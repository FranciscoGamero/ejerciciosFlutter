import 'package:flutter/material.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: ListView(
          key: GlobalKey(),
          scrollDirection: Axis.horizontal, // por defecto es vertical
          padding: const EdgeInsets.only(right: 50, left: 15),
          children: [
            // agregamos este espacio para que los widget empiecen abajo
            // del área de configuraciones del dispositivo
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 25, top: 50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/8FMhYekyLR4ibHQ9Kpuaqe4cVjL.jpg',
                          height: 600.0,
                          width: 250.0,
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const Text('Jason', style: TextStyle(fontSize: 30)),
                    const Text('Statham',
                        style: TextStyle(fontSize: 30, color: Colors.grey)),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 25, top: 50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/9VYK7oxcqhjd5LAH6ZFJ3XzOlID.jpg',
                          height: 600.0,
                          width: 250.0,
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const Text('Pedro', style: TextStyle(fontSize: 30)),
                    const Text('Pascal',
                        style: TextStyle(fontSize: 30, color: Colors.grey)),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 25, top: 50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/8FMhYekyLR4ibHQ9Kpuaqe4cVjL.jpg',
                          height: 600.0,
                          width: 250.0,
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const Text('Jason', style: TextStyle(fontSize: 30)),
                    const Text('Statham',
                        style: TextStyle(fontSize: 30, color: Colors.grey)),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 25, top: 50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/9VYK7oxcqhjd5LAH6ZFJ3XzOlID.jpg',
                          height: 600.0,
                          width: 250.0,
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const Text('Pedro', style: TextStyle(fontSize: 30)),
                    const Text('Pascal',
                        style: TextStyle(fontSize: 30, color: Colors.grey)),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 25, top: 50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/8FMhYekyLR4ibHQ9Kpuaqe4cVjL.jpg',
                          height: 600.0,
                          width: 250.0,
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const Text('Jason', style: TextStyle(fontSize: 30)),
                    const Text('Statham',
                        style: TextStyle(fontSize: 30, color: Colors.grey)),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 25, top: 50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/9VYK7oxcqhjd5LAH6ZFJ3XzOlID.jpg',
                          height: 600.0,
                          width: 250.0,
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const Text('Pedro', style: TextStyle(fontSize: 30)),
                    const Text('Pascal',
                        style: TextStyle(fontSize: 30, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
