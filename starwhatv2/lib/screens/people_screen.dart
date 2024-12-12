import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:starwhat/models/people_response/people_response.dart';
import 'package:http/http.dart' as http;

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 238),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 252, 232, 192),
          title: Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.network(
                      'https://cdn.freebiesupply.com/logos/large/2x/star-wars-logo-png-transparent.png',
                      width: 100)),
              const Text('Lista de Personajes')
            ],
          )),
      body: FutureBuilder<PeopleResponse>(
        future: peopleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildPeopleList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<PeopleResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  String getGender(String genero) {
    switch (genero) {
      case "male":
        return "Hombre";
      case "female":
        return "Mujer";
      case "n/a":
        return "Otro";
      default:
        return "Desconocido";
    }
  }

  Widget _buildPeopleList(PeopleResponse peopleResponse) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        peopleResponse.results!.length,
        (index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            color: const Color.fromARGB(255, 243, 237, 223),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(peopleResponse.results![index].name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Text(
                              getGender(peopleResponse.results![index].gender!),
                              textAlign: TextAlign.end),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${peopleResponse.results![index].mass!} Kg",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${peopleResponse.results![index].height!} cm",
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
