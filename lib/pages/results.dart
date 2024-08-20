import 'package:cervical_cancer_prediction/pages/form.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final double results;
  const Results({
    super.key,
    required this.results,
  });

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  double? results;
  // final Uri _url = Uri.parse('https://flutter.dev');

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  // Future<void> _launchURL(String url) async {
  //   if (!await launchUrl(Uri.parse(url))) {
  //     // If the URL can't be launched, display an error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Could not launch $url')),
  //     );
  //   }
  // }

  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              textAlign: TextAlign.justify,
              widget.results == 0
                  ? "Congratulations!! After running test on the information you provided, you have tested negative. Feel free to check the resource materials for further information"
                  : widget.results == 1
                      ? "sorry after running test on the information you provided, you have tested positive. Feel free to check the resource materials for further information"
                      : "Please run test again, there have been technical issues",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 1, 5, 46),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      check = true;
                    });
                  },
                  child: Text(
                    "Recommendations",
                    style: TextStyle(
                        color: check
                            ? const Color.fromARGB(255, 9, 1, 122)
                            : Colors.deepOrange),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      check = false;
                    });
                  },
                  child: Text(
                    "Resource links",
                    style: TextStyle(
                        color: check
                            ? Colors.deepOrange
                            : const Color.fromARGB(255, 9, 1, 122)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            check
                ? const Column(
                    children: [
                      ExpansionTile(
                        title: Text(
                          '1. Human Papillomavirus (HPV) Vaccination',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 1, 5, 46),
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('Description'),
                            subtitle: Text(
                              """The primary cause of cervical cancer is persistent infection with certain types of HPV. Vaccination against HPV significantly reduces the risk of infection with these high-risk types. It's recommended for preteens, but can be administered up to age 26 for women. Regular vaccination helps build immunity from a young age, preventing potential cancer development later in life""",
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          '2. Regular Pap Smears and HPV Testing',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 1, 5, 46),
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('Description'),
                            subtitle: Text(
                              """Routine screenings such as Pap smears, which check for precancerous changes in the cervix, and HPV testing are critical in early detection. Women should begin screening at age 21 and continue every three years until age 29. From age 30 to 65, combined Pap and HPV testing every five years is recommended, or Pap testing alone every three years. Early detection can lead to timely treatment, reducing the risk of progression to cervical cancer.""",
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          '3. Practicing Safe Sex',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 1, 5, 46),
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('Description'),
                            subtitle: Text(
                              """Engaging in safer sexual practices, such as the use of condoms and limiting the number of sexual partners, can decrease the risk of HPV transmission. Discussing sexual history with partners can also help in making informed and safer choices, reducing the overall risk of cervical cancer linked to HPV.""",
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          '4. Smoking Cessation',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 1, 5, 46),
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('Description'),
                            subtitle: Text(
                              """Smoking is a significant risk factor for several cancers, including cervical cancer. Quitting smoking can help improve overall health and reduce the risk of disease progression. Resources such as counseling, support groups, and medications can aid individuals in quitting smoking effectively.""",
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          '5. Healthy Lifestyle Choices',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 1, 5, 46),
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text("Description"),
                            subtitle: Text(
                              """Maintaining a healthy diet, exercising regularly, and managing weight can bolster the immune system, helping the body fight off HPV infections. Diets rich in fruits, vegetables, whole grains, and lean proteins provide essential nutrients that promote overall well-being. Avoiding excessive alcohol consumption is also advisable.
                        
""",
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                //   ExpansionTile(
                //     title: const Text(
                //       '8. Quick links',
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.w600,
                //         color: Color.fromARGB(255, 1, 5, 46),
                //       ),
                //     ),
                //     children: <Widget>[
                //       const Text("hi"),
                //       const Text("hi"),
                //       ElevatedButton(
                //   onPressed: () => _launchURL('https://flutter.dev'),
                //   child: const Text('Open Flutter Website'),
                // ),
                //       ElevatedButton(
                //         onPressed: _launchUrl,
                //         child: const Text('Show Flutter homepage'),
                //       ),
                //     ],
                //   ),
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const ExpansionTile(
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Text(
                            'Quick links',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 1, 5, 46),
                            ),
                          ),
                          children: <Widget>[],
                        ),
                        MaterialButton(
                          textColor: Colors.deepPurple,
                          onPressed: () async {
                            await EasyLauncher.url(
                                url: "https://www.cancer.gov/types/cervical/");
                          },
                          child: const Text(
                            "National Cancer Institute (NCI)",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                        MaterialButton(
                          textColor: Colors.deepPurple,
                          onPressed: () async {
                            await EasyLauncher.url(
                                url:
                                    "https://www.cancer.net/cancer-types/cervical-cancer");
                          },
                          child: const Text(
                            "Cancer.Net (American Society of Clinical Oncology)",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                        MaterialButton(
                          textColor: Colors.deepPurple,
                          onPressed: () async {
                            await EasyLauncher.url(
                                url: "https://www.nccc-online.org/");
                          },
                          child: const Text(
                            "National Cervical Cancer Coalition (NCCC)",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                        MaterialButton(
                          textColor: Colors.deepPurple,
                          onPressed: () async {
                            await EasyLauncher.url(url: "https://www.nih.gov/");
                          },
                          child: const Text(
                            "The National Institutes of Health (NIH)",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                        MaterialButton(
                          textColor: Colors.deepPurple,
                          onPressed: () async {
                            await EasyLauncher.url(
                                url: "https://www.nccn.org/");
                          },
                          child: const Text(
                            "The National Comprehensive Cancer Network (NCCN)",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        // MaterialButton(
                        //   color: Colors.deepPurple,
                        //   textColor: Colors.white,
                        //   onPressed: () async {
                        //     await EasyLauncher.url(url: "https://pub.dev");
                        //   },
                        //   child: const Text("Open url"),
                        // ),
                        widget.results == 1
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      MaterialButton(
                                        // color: const Color.fromARGB(255, 33, 1, 94),
                                        // textColor: Colors.white,
                                        onPressed: () async {
                                          await EasyLauncher.openMap(
                                              lati: "5.30799", long: "1.98560");
                                        },
                                        child: Image.asset(
                                          "images/maps.png",
                                          fit: BoxFit.contain,
                                          scale: 1.5,
                                        ),
                                      ),
                                       const Text(
                                          "Visit clinic")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      MaterialButton(
                                        // color: Colors.green[700],
                                        textColor: Colors.white,
                                        onPressed: () async {
                                          await EasyLauncher.sendToWhatsApp(
                                              phone: "+233532911103",
                                              message:
                                                  "Hello, I tested positive for cervical cancer after running test with your software, kindly help me with anything I need, Thank you.");
                                        },
                                        child: Image.asset(
                                          "images/Whatsapp.png",
                                          fit: BoxFit.contain,
                                          scale: 1.5,
                                        ),
                                      ),
                                      const Text(
                                          "Consult ")
                                    ],
                                  ),
                                ],
                              )
                            : Container()
                      ]),
          ]),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          width: 200,
          decoration: const BoxDecoration(),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MultiForm(),
                ),
              );
            },
            backgroundColor: const Color.fromARGB(255, 30, 1, 65),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Run another test",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
