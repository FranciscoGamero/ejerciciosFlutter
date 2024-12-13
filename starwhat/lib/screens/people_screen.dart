import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:starwhat/models/people_list_response/people_list_response.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleListResponse> listaPersonas;

  @override
  void initState() {
    super.initState();
    listaPersonas = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PeopleListResponse>(
      future: listaPersonas,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildPeopleList(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  Future<PeopleListResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleListResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load PeopleListResponse');
    }
  }
  
  Widget _buildPeopleList(PeopleListResponse peopleListResponse) {
    return ListView.builder(
      itemCount: peopleListResponse.results!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(peopleListResponse.results![index].name!),
        );
      },
    );
  }
}
