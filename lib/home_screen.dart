import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Row(
          spacing: 16,
          children: [
            Expanded(child: Image.asset(
              'assets/images/dillon-roper.jpg',
              fit: BoxFit.contain,
            )),
            Expanded(child: Text(
              'Hello and welcome to my website!\n'
              'Use the links above to navigate between pages.\n\n'
              'Job Status: Looking for Summer 2027 internships\n\n'
              'My current interests:\n'
              '- Epistemology of Taxonomy Ontology Knowledge Graphs for Neuro-Symbolic AI\n'
              '- Deriving Machine Ethics from Contractarianism and Game Theory\n'
              '- Aesthetics and Metaphysics of RPG Worlds',
              style: TextStyle(fontSize: 20, color: Color(0xFFCCDAD1))
            ))
          ]
        )),
      ]
    );
  }
}