import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 750,
      padding: EdgeInsetsGeometry.all(12),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _projectItem(
          title: 'This Website!',
          desc: 'A place to store information about my various projects and job status',
          actionItems: ['Add links to my GitHub and social media accounts', 'Polish the UI design'],
          image: 'assets/images/my-website.jpg'
        ),
        _projectItem(
          title: 'Hierarchical Nodal Contractarianism',
          desc: 'An essay on the social contract as an abstraction of emergent human behavior. Analyzes the ideas of ontology and ethics under this framework before evaluating their applications on the fields of political science and machine ethics.',
          actionItems: ['Complete more research on modern Game Theory and Contractarianism to assemble citations', 'Finish the first draft of the ontology', 'Finish the first draft of the ethics', 'Conduct further research on the applications for machine ethics in modern AI systems'],
          image: 'assets/images/contractarianism.jpg'
        ),
        _projectItem(
          title: 'MyMusicTheory',
          desc: 'An app designed to help people memorize the association between tones, sounds, and their names. Basic functionality has been achieved but there are still some bug fixes and extra features to be added.',
          actionItems: ['Redo screen layout', 'Remove unnecessary features that were installed to meet assignment requirements (e.g. weather)', 'Improve data-driven localization', 'Repair graph functionality'],
          //image: 'assets/images/website.jpg'
        ),
        _projectItem(
          title: 'Escapism',
          desc: 'A procedurally generated RPG with an emphasis on player choice and adaptable NPC architecture. This is a casual side hobby, progress is dependent upon free time.',
          actionItems: ['Finalize first draft on metaphysics of the fantasy setting', 'Complete implementation of low-level code that will support NPC simulation', 'Assemble all aspects of the design into a comprehensive document'],
          //image: 'assets/images/website.jpg'
        ),
        _projectItem(
          title: 'TempoHero',
          desc: 'An app that uses Python to detect the BPM of any piece of music to assist musicians in teaching themselves to play at the correct tempo.',
          actionItems: ['N/A, this project and its design goals have been merged into the design goals of MyMusicTheory.'],
          //image: 'assets/images/website.jpg'
        ),
      ]
    );
  }

  Widget _projectItem({required String title, required String desc, required List<String> actionItems, String? image}) {
    image ??= 'assets/images/placeholder.jpg';
    String actionItemsText = '';
    for (String item in actionItems) {
      actionItemsText += '- $item\n';
    }
    return Container(
      color: Color(0xFF3E2056),
      child: Column(
        spacing: 12,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFCCDAD1))),
          Expanded (child: Row(
            spacing: 12,
            children: [
              Expanded(child: Image.asset(image)),
              Expanded(child: Text(desc, style: TextStyle(fontSize: 16, color: Color(0xFFCCDAD1))))

            ]
          )),
          Expanded(child: Column(
            children: [
              Text(
              'Action Items:', 
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFFCCDAD1), 
                decoration: TextDecoration.underline
              )
            ),
              Text(
              actionItemsText, 
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFCCDAD1),
              )
            )
            ]
          ))
        ]
      )

    );
  }

}