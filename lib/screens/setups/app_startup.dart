import 'package:flutter/material.dart';

class AppStartup extends StatefulWidget {
  const AppStartup({super.key});

  @override
  State<AppStartup> createState() => _AppStartupState();
}

class _AppStartupState extends State<AppStartup> {
  int currentStep = 0;

  List<String> responseList = [
    "Hello Kabuhjeet!",
    "Keep Going...",
    "Almost There...",
    "Last One!",
  ];

  List<String> instructionsList = [
    "How do you want us to refer you as?",
    "Tell us about yourself. What is your current status as to align this application’s to your needs."
        "How much is your allowance or salary per month?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(responseList[currentStep]),

              Expanded(
                child: Column(
                  children: [
                    (currentStep == 3)
                        ? Column(
                            children: [
                              Text(
                                "These terms and conditions govern your access to the application. ",
                              ),
                              ElevatedButton(
                                onPressed: () => setState(() {}),
                                child: Text("Terms and Conditions"),
                              ),
                              Text(
                                "By accessing or using our Service, you agree to be bound by these Terms. If you do not agree to all of these Terms, you are strictly prohibited from using the Service and must discontinue use immediately",
                              ),
                            ],
                          )
                        : Text(instructionsList[currentStep]),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () => setState(() {
                  currentStep--;
                }),
                child: Text("Back"),
              ),

              ElevatedButton(
                onPressed: () => setState(() {
                  currentStep++;
                }),
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
