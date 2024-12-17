import 'dart:convert';

import 'package:ejercicio_bottomnavbar/models/person.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PersonaResponse> peopleResponse;
  List<List<Color>> gradientsArray = [
    [
      Color(0xFF7780F2),
      Color(0xFF0A32C7),
    ],
    [
      Color(0xFF43DFB8),
      Color(0xFF12C37A),
    ],
    [
      Color(0xFFBEA2F2),
      Color(0xFF8515BF),
    ],
    [
      Color(0xFFFAB423),
      Color(0xFFE765B9),
    ],
  ];
  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('People'),
        ),
        backgroundColor: Color(0xFF182232),
        body: Column(
          children: [
            Column(
              children: [
                const Text(
                  "Listas de Persona",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                FutureBuilder<PersonaResponse>(
                  future: peopleResponse,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildPeopleList(context, snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            )
          ],
        ));
  }

  Future<PersonaResponse> getPeople() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/popular?api_key=84692859733af3a8230341b350a595fd'));

    if (response.statusCode == 200) {
      return PersonaResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildPeopleList(
      BuildContext context, PersonaResponse peopleResponse) {
    return ListView.separated(
        separatorBuilder: (context, index) => const Spacer(
              flex: 1,
            ),
        scrollDirection: Axis.horizontal,
        itemCount: peopleResponse.listaPersona!.length,
        itemBuilder: (context, index) {
          return _buildPeopleItem(
              context, peopleResponse.listaPersona![index], index);
        });
  }
    Widget _buildPeopleItem(BuildContext context, Persona people, int index) {
    return SizedBox(
      width: 220,
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(children: [
          Positioned(
            top: 40,
            child: Container(
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: RadialGradient(
                    colors: gradientsArray[index % gradientsArray.length]),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 310,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    gradientsArray[index][0].withOpacity(0.0),
                    gradientsArray[index][0].withOpacity(0.5),
                  ],
                  stops: <double>[0.0, 0.5],
                ).createShader(bounds);
              },
              child: Image.asset(
                'assets/img/${people.profilePath}.png',
              ),
            ),
          ),
        ]),
        Center(
          child: Text(
            people.name!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ]),
    );
  }
}
