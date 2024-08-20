import 'package:cervical_cancer_prediction/auth/auth_services.dart';
import 'package:cervical_cancer_prediction/pages/apphome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool signin = true;
  TextEditingController nameRe = TextEditingController();
  TextEditingController emailRe = TextEditingController();
  TextEditingController passwordRe = TextEditingController();
  TextEditingController RepasswordRe = TextEditingController();
  TextEditingController emailLog = TextEditingController();
  TextEditingController passwordLog = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 100,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          signin = true;
                        });
                      },
                      child: Container(
                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                            color: signin
                                ? const Color.fromARGB(255, 42, 2, 107)
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(999),
                                bottomRight: Radius.circular(999))),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: signin
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 42, 2, 107),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          signin = false;
                        });
                      },
                      child: Container(
                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                          color: signin
                              ? Colors.white
                              : const Color.fromARGB(255, 42, 2, 107),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(999),
                              bottomLeft: Radius.circular(999)),
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: signin
                                  ? const Color.fromARGB(255, 42, 2, 107)
                                  : const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                signin
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: nameRe,
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name*';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                helperText: "Enter your name",
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: emailRe,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email*';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                helperText: "Enter your email address",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordRe,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'password*';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                helperText: "Enter your password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: RepasswordRe,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Repeat Password*';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                helperText: "Repeat your password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 38,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: emailLog,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                helperText: "Enter your password",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordLog,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                helperText: "Enter your password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                            )
                          ],
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: signin ? signUp : signIn,
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 42, 2, 107),
                        ),
                      ),
                      child: signin
                          ? const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    if (_formKey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        auth.signUserWithEmailAndPassword(emailLog.text, passwordLog.text).then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppHome(),
                ),
              ),
            );
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong password')),
          );
        } else if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user with that email')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('An error occured , please try again')),
          );
        }
      }
    }
  }

  void signUp() {
    Map<String, dynamic> users = {
      "Name": nameRe.text,
      "Email": emailRe.text,
      "Password": passwordRe.text,
    };
    if (passwordRe.text.trim() != RepasswordRe.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Mismatch')),
      );
    } else {
      if (_formKey.currentState!.validate()) {
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        auth.addUserDetails(users).then(
              (value) => auth
                  .createUserWithEmailAndPassword(emailRe.text, passwordRe.text)
                  .then(
                (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppHome(),
                    ),
                  );
                },
              ),
            );
      }
    }
  }
}
