// Make sure your Internet is Connected
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:translator/translator.dart';

class TranslatorApp extends StatefulWidget {
  const TranslatorApp({super.key});

  @override
  State<TranslatorApp> createState() => _TranslatorAppState();
}

class _TranslatorAppState extends State<TranslatorApp> {
  List<String> languages = [
    'English',
    'Hindi',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese	',
    'Italian'
  ];
  List<String> languagescode = [
    'en',
    'hi',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it'
  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'hi';
  String data = 'आप कैसे हैं?';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Hindi';
  TextEditingController controller =
      TextEditingController(text: 'How are you?');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   translate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   flexibleSpace: Container(
      //       decoration: const BoxDecoration(
      //     color: Color.fromARGB(255, 50, 46, 165),
      //   )),
      //   title: const Text(
      //     'Translator App',
      //     style: TextStyle(
      //         color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  "Quari",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Lato-Regular'),
                ),
                Text(
                  " Translate",
                  style: TextStyle(
                      color: Color.fromARGB(255, 251, 131, 91),
                      fontSize: 17,
                      fontFamily: 'Lato-Bold'),
                ),
              ],
            ),
          ),
          const Text(
            textAlign: TextAlign.center,
            "Quick\nTranslation",
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontFamily: 'Lato-Regular'),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height *
                      0.15, // Set minimum height to 100
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 235, 230),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Form(
                  key: formkey,
                  child: TextFormField(
                    controller: controller,
                    maxLines: null,
                    minLines: null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        errorStyle: TextStyle(color: Colors.black)),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato-Regular',
                        fontSize: 15),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 235, 230),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            10,
                          ),
                          topRight: Radius.circular(10))),
                  child: DropdownButton(
                    underline: const SizedBox.shrink(),
                    value: selectedvalue,
                    focusColor: Colors.transparent,
                    items: languages.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                        onTap: () {
                          if (lang == languages[0]) {
                            from = languagescode[0];
                          } else if (lang == languages[1]) {
                            from = languagescode[1];
                          } else if (lang == languages[2]) {
                            from = languagescode[2];
                          } else if (lang == languages[3]) {
                            from = languagescode[3];
                          } else if (lang == languages[4]) {
                            from = languagescode[4];
                          } else if (lang == languages[5]) {
                            from = languagescode[5];
                          } else if (lang == languages[6]) {
                            from = languagescode[6];
                          } else if (lang == languages[7]) {
                            from = languagescode[7];
                          } else if (lang == languages[8]) {
                            from = languagescode[8];
                          }
                          setState(() {
                            // print(lang);
                            // print(from);
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedvalue = value!;
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Translate to",
            style: TextStyle(
                color: Colors.black, fontFamily: 'Lato-Regular', fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height *
                      0.15, // Set minimum height to 100
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 235, 230),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SelectableText(
                      data,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Lato-Regular'),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 235, 230),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              10,
                            ),
                            topRight: Radius.circular(10))),
                    child: DropdownButton(
                      underline: const SizedBox.shrink(),
                      value: selectedvalue2,
                      focusColor: Colors.transparent,
                      items: languages.map((lang) {
                        return DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                          onTap: () {
                            if (lang == languages[0]) {
                              to = languagescode[0];
                            } else if (lang == languages[1]) {
                              to = languagescode[1];
                            } else if (lang == languages[2]) {
                              to = languagescode[2];
                            } else if (lang == languages[3]) {
                              to = languagescode[3];
                            } else if (lang == languages[4]) {
                              to = languagescode[4];
                            } else if (lang == languages[5]) {
                              to = languagescode[5];
                            } else if (lang == languages[6]) {
                              to = languagescode[6];
                            } else if (lang == languages[7]) {
                              to = languagescode[7];
                            } else if (lang == languages[8]) {
                              to = languagescode[8];
                            }
                            setState(() {
                              // print(lang);
                              // print(from);
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedvalue2 = value!;
                      },
                    )),
              ),
              Positioned(
                right: 30,
                bottom: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: IconButton(
                      iconSize: 20, onPressed: () {}, icon: Icon(Icons.copy)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: translate,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 251, 131, 91),
                  ),
                  fixedSize: MaterialStatePropertyAll(Size(300, 45))),
              child: isloading
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Translate',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato-Bold',
                          fontSize: 15),
                    )),
          const SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}
