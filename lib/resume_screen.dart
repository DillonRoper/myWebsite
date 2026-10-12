import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height:24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Text(
              'This is my most recent resume, reach out to me via my contact information for more details.', 
              style: TextStyle(fontSize: 20, color: Color(0xFFCCDAD1))
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: ConstrainedBox( 
              constraints: const BoxConstraints(
                maxHeight: 2000,
                maxWidth: 2000
              ),
              child:Image.asset('assets/images/resume.png')
            )
          ),
          InkWell(
            onTap: () {
              final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
              anchor.href = '/assets/resume.pdf';
              anchor.download = 'Dillon-Roper-Resume.pdf';
              anchor.style.display = 'none';

              web.document.body!.appendChild(anchor);
              anchor.click();
              anchor.remove();
            },
            child: Text(
              'Download as PDF',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF0000EE),
                backgroundColor: Color(0xFFCCDAD1),
                decoration: TextDecoration.underline
              )
            )
          ),
          SizedBox(height: 200)
        ]
      )
    );
  }
}