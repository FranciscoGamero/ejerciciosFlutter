import 'package:flutter/material.dart';
import 'package:starwhat/models/people_response/people.dart';

class PeopleDetailScreen extends StatefulWidget {
  final People peopleItem;
  final int index;
  const PeopleDetailScreen(
      {super.key, required this.peopleItem, required this.index});

  @override
  State<PeopleDetailScreen> createState() => _PeopleDetailScreenState();
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

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 238),
      appBar: AppBar(
        title: Text(widget.peopleItem.name!),
        backgroundColor: const Color.fromARGB(255, 252, 232, 192),
      ),
      body: SliverAppBar(
          floating: false,
          pinned: true,
          snap: false,
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
            title: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                'https://starwars-visualguide.com/assets/img/characters/${widget.index + 1}.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Text(
                  'Altura: ${widget.peopleItem.height!} cm',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Peso: ${widget.peopleItem.mass!} kg',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Año de nacimiento: ${widget.peopleItem.birthYear!}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Genero: ${getGender(widget.peopleItem.gender!)}',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text(
                      'Lista de vehiculos:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    ListView(
                      key: GlobalKey(),
                      children: [
                        for (var vehicle in widget.peopleItem.vehicles!)
                          Text(
                            vehicle,
                            style: const TextStyle(fontSize: 20.0),
                          ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Naves Espaciales:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    ListView(
                      key: GlobalKey(),
                      children: [
                        for (var starships in widget.peopleItem.starships!)
                          Text(
                            starships,
                            style: const TextStyle(fontSize: 20.0),
                          ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text(
                      'Especies:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    ListView(
                      key: GlobalKey(),
                      children: [
                        for (var species in widget.peopleItem.species!)
                          Text(
                            species,
                            style: const TextStyle(fontSize: 20.0),
                          ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ]),
    );
  }
}
