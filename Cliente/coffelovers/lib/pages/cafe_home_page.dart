import 'package:coffelovers/pages/cafe_card.dart';
import 'package:flutter/material.dart';

class CafeHomePage extends StatefulWidget {
  const CafeHomePage({super.key});

  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CafeCard(
        nome: "Meu Café",
        nota: "5",
        tipo: "Amargo",
      ),
    );
  }
}
