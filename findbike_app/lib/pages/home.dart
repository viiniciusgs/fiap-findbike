import 'package:findbike_app/repositories/bikes_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bikesRepository = BikesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Bike'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Desconectar'),
                    content: const Text('Deseja se desconectar?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.red[300],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: _bikesRepository.bikes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final bikes = snapshot.data;

                  return CustomScrollView(
                    slivers: [
                      SliverList.builder(
                        itemBuilder: (context, index) {
                          final bike = bikes[index];

                          return ListTile(
                            title: Text('Bike ${bike["id"]}'),
                            subtitle: Text(
                                '${bike["station"]["address"]["street"]}, ${bike["station"]["name"]}'),
                            trailing: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Alugar Bike ${bike["id"]}}'),
                                      content:
                                          const Text('Deseja alugar a bike?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Não'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _bikesRepository
                                                  .update(bike["id"]);
                                            });

                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Sim'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Alugar'),
                            ),
                          );
                        },
                        itemCount: bikes.length,
                      ),
                    ],
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
