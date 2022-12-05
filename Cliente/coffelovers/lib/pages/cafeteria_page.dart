import 'package:coffelovers/controller/cafeteria_controller.dart';
import 'package:coffelovers/pages/cafeteria_cadastro.dart';
import 'package:coffelovers/pages/cafeteria_card.dart';
import 'package:coffelovers/repository/cafeteria_repository.dart';
import 'package:flutter/material.dart';

class CafeteriaPage extends StatefulWidget {
  const CafeteriaPage({super.key});

  @override
  State<CafeteriaPage> createState() => _CafeteriaPageState();
}

class _CafeteriaPageState extends State<CafeteriaPage> {
  var cafeteriaController = CafeteriaController(CafeteriaRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: cafeteriaController.fetchCafeteriaList(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar cafeterias'),
              );
            }

            return ListView.separated(
                itemBuilder: ((context, index) {
                  var cafeteria = snapshot.data?[index];
                  return CafeteriaCard(
                      nome: '${cafeteria?.nome}',
                      endereco: '${cafeteria?.endereco}',
                      id: '${cafeteria?.id}');
                }),
                separatorBuilder: ((context, index) {
                  return Divider(thickness: 0.5, height: 0.5);
                }),
                itemCount: snapshot.data?.length ?? 0);
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CafeteriaCadastro()));
          },
          child: Icon(Icons.add),
        ));
  }
}
