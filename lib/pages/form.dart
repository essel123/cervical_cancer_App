import 'package:cervical_cancer_prediction/auth/api.dart';
import 'package:cervical_cancer_prediction/pages/field.dart';
import 'package:cervical_cancer_prediction/pages/successpage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MyApiService {
  final String apiUrl =
      'https://ml-api-i2am.onrender.com'; // Replace with your API URL

  Future<double> sendData(MyRequest request) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Uncomment if needed
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      double result = jsonResponse['Biospy'].toDouble();

      return result;
    } else {
      return response.statusCode.toDouble();
    }
  }
}

class MultiForm extends StatefulWidget {
  const MultiForm({super.key});

  @override
  State<MultiForm> createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  TextEditingController controller6 = TextEditingController();

  TextEditingController controller7 = TextEditingController();

  TextEditingController controller8 = TextEditingController();
  TextEditingController controller9 = TextEditingController();

  TextEditingController controller10 = TextEditingController();

  TextEditingController controller11 = TextEditingController();

  TextEditingController controller12 = TextEditingController();
  TextEditingController controller13 = TextEditingController();
  TextEditingController controller14 = TextEditingController();
  // TextEditingController controller15 = TextEditingController();
  // TextEditingController controller16 = TextEditingController();
  // TextEditingController controller17 = TextEditingController();
  // TextEditingController controller18 = TextEditingController();
  // TextEditingController controller19 = TextEditingController();
  // TextEditingController controller20 = TextEditingController();
  // TextEditingController controller21 = TextEditingController();
  // TextEditingController controller22 = TextEditingController();
  // TextEditingController controller23 = TextEditingController();
  // TextEditingController controller24 = TextEditingController();
  var currentStep = 0;
  double? smokes;
  double? iud;
  double? stds;
  double results = -1;
  double? contraceptive_;
  bool smokes_children = true;
  bool contraceptive_children = true;
  bool iud_children = true;
  bool stds_children = true;
  final String apiUrl =
      'https://ml-api-i2am.onrender.com'; // Replace with your API URL

  bool ishorzontal = true;
  Future<void> sendData(MyRequest request) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Uncomment if needed
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      double result = jsonResponse['Biospy'].toDouble();

      setState(() {
        results = result;
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
  }

  // https://ml-api-i2am.onrender.com

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              setState(
                () {
                  ishorzontal = true;
                },
              );
            },
            child: !ishorzontal
                ? const Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 50,
                      )
                    ],
                  )
                : const Text(""),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                setState(
                  () {
                    ishorzontal = false;
                  },
                );
              },
              child: ishorzontal
                  ? const Row(
                      children: [
                        // Text("Vertical"),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 50,
                        )
                      ],
                    )
                  : const Text("")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: SafeArea(
            child: Stepper(
          steps: getStep(),
          controller: ScrollController(),
          type: ishorzontal ? StepperType.horizontal : StepperType.vertical,
          elevation: 0,
          currentStep: currentStep,
          onStepContinue: () {
            setState(
              () {
                if (currentStep == getStep().length - 1) {
                  return;
                } else {
                  currentStep += 1;
                }
              },
            );
          },
          onStepCancel: () {
            currentStep == 0
                ? null
                : setState(
                    () {
                      currentStep -= 1;
                    },
                  );
          },
          onStepTapped: (value) {
            setState(() {
              currentStep = value;
            });
          },
          controlsBuilder: (context, details) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Row(
                children: [
                  currentStep > 0
                      ? Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentStep == 0
                                    ? null
                                    : setState(
                                        () {
                                          currentStep -= 1;
                                        },
                                      );
                              });
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
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Text(""),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (currentStep == getStep().length - 1) {
                            MyRequest request = MyRequest(
                              Age: double.parse(controller1.text),
                              Number_of_sexual_partners:
                                  double.parse(controller2.text),
                              First_sexual_intercourse:
                                  double.parse(controller3.text),
                              Num_of_pregnancies:
                                  double.parse(controller4.text),
                              Smokes: smokes!,
                              Smokes_Years: smokes_children
                                  ? double.parse(controller6.text)
                                  : 0,
                              Smokes_pack_per_year: smokes_children
                                  ? double.parse(controller7.text)
                                  : 0,
                              Hormonal_Contraceptives: contraceptive_!,
                              Hormonal_Contraceptives_years:
                                  contraceptive_children
                                      ? double.parse(controller9.text)
                                      : 0,
                              IUD: iud!,
                              IUD_years: iud_children
                                  ? double.parse(controller11.text)
                                  : 0,
                              STDs: stds!,
                              Number_of_diagnosis: stds_children
                                  ? double.parse(controller13.text)
                                  : 0,
                              Time_since_last_diagnosis: stds_children
                                  ? double.parse(controller14.text)
                                  : 0,
                            );

                            showDialog(
                              context: context,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );

                            var resp = sendData(request);

                            resp.then(
                              (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Test(
                                      results: results,
                                    ),
                                  ),
                                );
                              },
                            );

                            return;
                          } else {
                            setState(() {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //       content: Text(
                              //           'Request successful: ${response.body}')),
                              // );
                              currentStep += 1;
                            });
                          }
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
                        child: currentStep == getStep().length - 1
                            ? const Text(
                                "Submit",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                ),
                              )
                            : const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.5,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 18,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ],
                              )),
                  ),
                ],
              ),
            );
          },
        )),
      ),
    );
  }

  List<Step> getStep() => [
        Step(
          title: Text(
            "Step 1",
            style: TextStyle(
              fontSize: 12,
              color: currentStep > 0
                  ? const Color.fromARGB(255, 5, 1, 87)
                  : const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          content: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Field(
                  controller: controller1,
                  inputType: TextInputType.number,
                  label: "How old are you ?",
                  hintText: "e.g 20",
                  enable: true,
                ),
                Field(
                  controller: controller2,
                  inputType: TextInputType.number,
                  label: "How many sexual partners do you have ?",
                  hintText: "e.g 20",
                  enable: true,
                ),
                Field(
                  controller: controller3,
                  inputType: TextInputType.number,
                  label: "How old were you when you had your first sex ?",
                  hintText: "e.g 20",
                  enable: true,
                ),
                Field(
                  controller: controller4,
                  inputType: TextInputType.number,
                  label: "How many times have you been pregnant ?",
                  hintText: "e.g 4",
                  enable: true,
                ),
                TextFormField(
                  controller: controller5,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (controller5.text.toLowerCase() == "no") {
                      smokes = 0;
                      setState(() {
                        smokes_children = false;
                      });
                    } else if (controller5.text.toLowerCase() == "yes") {
                      setState(() {
                        smokes_children = true;
                        smokes = 1;
                      });
                    }
                  },
                  // onFieldSubmitted: (value) {
                  //   if (controller5.text.toLowerCase() != "no" ||
                  //       controller5.text.toLowerCase() != "yes") {
                  //     setState(() {
                  //       controller5.clear();
                  //     });
                  //   }
                  // },
                  decoration: const InputDecoration(
                    hintText: "Yes/No",
                    label: Text("Have you Smoked before ?"),
                    enabled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          isActive: currentStep >= 0,
        ),
        Step(
          title: Text(
            "Step 2",
            style: TextStyle(
              fontSize: 12,
              color: currentStep > 1
                  ? const Color.fromARGB(255, 5, 1, 87)
                  : const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          content: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Field(
                  controller: controller6,
                  inputType: TextInputType.number,
                  label: "How many years have you smoked ?",
                  enable: smokes_children,
                  hintText: "e.g 3",
                ),
                Field(
                  controller: controller7,
                  inputType: TextInputType.number,
                  label: "How many packs have you smoked per year ?",
                  hintText: "e.g 3",
                  enable: smokes_children,
                ),
                TextFormField(
                  controller: controller8,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (controller8.text.toLowerCase() == "no") {
                      setState(() {
                        contraceptive_ = 0;
                        contraceptive_children = false;
                      });
                    } else if (controller8.text.toLowerCase() == "yes") {
                      setState(() {
                        contraceptive_ = 1;
                        contraceptive_children = true;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Yes/No",
                    label: Text("Have you ever used any contraceptive ?"),
                    enabled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Field(
                  controller: controller9,
                  inputType: TextInputType.number,
                  label:
                      "And how many years have you been using contraceptives if yes ?",
                  hintText: "e.g 4",
                  enable: contraceptive_children,
                ),
                TextFormField(
                  controller: controller10,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (controller10.text.toLowerCase() == "no") {
                      setState(() {
                        iud = 0;
                        iud_children = false;
                      });
                    } else if (controller10.text.toLowerCase() == "yes") {
                      setState(() {
                        iud = 1;
                        iud_children = true;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Yes/No",
                    label: Text(
                        "Have you ever used an interuterine device  before ?"),
                    enabled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          isActive: currentStep >= 1,
        ),
        Step(
          title: Text(
            "Step 3",
            style: TextStyle(
              fontSize: 12,
              color: currentStep > 2
                  ? const Color.fromARGB(255, 5, 1, 87)
                  : const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          content: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Field(
                  controller: controller11,
                  inputType: TextInputType.number,
                  label:
                      "How many years have you been using the interuterine device(s) ?",
                  hintText: "e.g 2",
                  enable: iud_children,
                ),
                TextFormField(
                  controller: controller12,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (controller12.text.toLowerCase() == "no") {
                      setState(() {
                        stds_children = false;
                        stds = 0;
                      });
                    } else if (controller12.text.toLowerCase() == "yes") {
                      setState(() {
                        stds = 1;
                        stds_children = true;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Yes/No",
                    label: Text("Have you been treated of STDs (HPV)?"),
                    enabled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Field(
                  controller: controller13,
                  inputType: TextInputType.number,
                  label: "How many times have you been treated of STDs ?",
                  hintText: "e.g 1",
                  enable: stds_children,
                ),
                Field(
                  controller: controller14,
                  inputType: TextInputType.number,
                  label:
                      "How long has it been since your last diagnosis(years) ?",
                  hintText: "e.g 2",
                  enable: stds_children,
                ),
              ],
            ),
          ),
          isActive: currentStep >= 2,
        ),
        Step(
          title: Text(
            "Finish",
            style: TextStyle(
              fontSize: 12,
              color: currentStep > 3
                  ? const Color.fromARGB(255, 5, 1, 87)
                  : const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          state: currentStep >= 3 ? StepState.complete : StepState.indexed,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Are these the details you gave?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 9, 1, 85)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Step 1",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Text("Age :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller1.text),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Number of sexual partners :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller2.text)
                          ],
                        ),
                        Row(
                          children: [
                            const Text("First sexual intercourse :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller3.text),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Number of pregnancies :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller4.text)
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Smokes ? :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller5.text)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Step 2",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Text("Years of smoking :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(smokes_children ? controller6.text : "0"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Average packs smoked per year :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(smokes_children ? controller7.text : "0"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Ever used hormonal Contraceptive ?:"),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(controller8.text),
                          ],
                        ),
                        Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total years of using hormonal "),
                                Text("Contraceptive "),
                              ],
                            ),
                            const SizedBox(
                              width: 0,
                            ),
                            Text(contraceptive_children
                                ? controller9.text
                                : "0"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Ever used Interuterine device? :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller10.text),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Step 3",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Number of years of using "),
                                Text("interuterine device :"),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(iud_children ? controller11.text : "0"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Ever contracted STDs? :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(controller12.text),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                                "Number of times for diagonising STDs :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(stds_children ? controller13.text : "0"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                                "How long since last diagnosis of STDs :"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(stds_children ? controller14.text : "0"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          isActive: currentStep >= 3,
        )
      ];
}
