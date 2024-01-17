import 'package:flutter/material.dart';
import 'package:task_ui/person_Widget.dart';

class PersonsView extends StatelessWidget {
  const PersonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFDFDF),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Persons'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFFE8D3FF),
              Color(0xFFFFDEDE),
            ],
          ),

        ),
        child: GridView.builder(

          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: _calculateCrossAxisCount(context),
          ),
          itemBuilder: (context, index) {
            return Center(
              child: SizedBox(
                width: _calculateContainerWidth(context),
                height: 300,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Persons(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1200) {
      return 4;
    } else if (screenWidth > 600) {
      return 3;
    } else {
      return 2;
    }
  }

  double _calculateContainerWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = _calculateCrossAxisCount(context);

    return (screenWidth - (crossAxisCount - 1) * 16) / crossAxisCount;
  }
}
