import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            child: CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: const Text('Bike 1'),
                      subtitle: const Text('Avenida Paulista, Estação 1'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Alugar Bike 1'),
                                content: const Text('Deseja alugar a bike?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Não'),
                                  ),
                                  TextButton(
                                    onPressed: () {
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
                  itemCount: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
