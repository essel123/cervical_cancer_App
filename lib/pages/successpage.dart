import 'package:cervical_cancer_prediction/pages/results.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final double results;
  const Test({
    super.key,
    required this.results,
  });

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  double? results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       color: Color.fromARGB(255, 21, 1, 72),
      //     ),
      //   ),
      // ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            "Submitted",
                            style: TextStyle(
                              fontSize: 65,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 1, 87),
                            ),
                          ),
                          Text(
                            "Successfully",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 1, 87),
                            ),
                          ),
                        ],
                      )),
                  // Padding(
                  //   padding: const EdgeInsets.all(5),
                  //   child: Image.asset("images/success.png"),
                  // ),
                  // Text("${widget.results}")
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        results = widget.results;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Results(
                            results: results!,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 5, 1, 87),
                      ),
                      elevation: const WidgetStatePropertyAll(5),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Proceed to view test results",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
