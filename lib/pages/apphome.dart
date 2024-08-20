import 'package:cervical_cancer_prediction/pages/form.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  
  const AppHome({
    super.key,
  });

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 140,
          horizontal: 15,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 30, 1, 65),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Would you like to know your",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 30, 1, 65),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "cervical cancer risk leveel and what to do next ?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 30, 1, 65),
                        fontWeight: FontWeight.bold),
                  ),
                 
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 5),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MultiForm()),
                          );
                        },
                        style: const ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 42, 2, 107),
                            )),
                        child: const Text(
                          "Run test now!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
