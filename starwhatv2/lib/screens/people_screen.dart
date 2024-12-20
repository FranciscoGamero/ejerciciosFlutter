import 'package:flutter/material.dart';
import 'package:starwhat/models/people_response/people.dart';
import 'package:starwhat/models/people_response/people_response.dart';
import 'package:http/http.dart' as http;
import 'package:starwhat/screens/people_detail_screen.dart';

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
            return _buildPeopleList(context, snapshot.data!);
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

  Widget _buildPeopleList(BuildContext context, PeopleResponse peopleResponse) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        peopleResponse.results!.length,
        (index) {
          return _buildPeopleItem(
              context, peopleResponse.results![index], index);
        },
      ),
    );
  }

  Widget _buildPeopleItem(BuildContext context, People people, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
      color: const Color.fromARGB(255, 243, 237, 223),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10, left: 35, right: 35),
            child: SizedBox(
              height: 85,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PeopleDetailScreen(
                              peopleItem: people,
                              index: index,
                            )),
                  );
                },
                child: Hero(
                    tag:
                        'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(people.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(getGender(people.gender!),
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
                      "${people.mass!} Kg",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${people.height!} cm",
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
  }
}
