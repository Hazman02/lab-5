import 'package:flutter/material.dart';
import 'package:lab5v2/MainPage/mainpage.dart';

class Afterotppage extends StatelessWidget {
  const Afterotppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //logo upm
              Image.asset('images/upm-new-logo-6911DC0B99-seeklogo.com.png', height: 110),

              const SizedBox(height: 50),

              //Welcome
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50),

              //Enter activation code text
              const Text(
                'Enter the activation code you received via SMS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 20),

              //OTP textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    hintText: 'OTP',
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //Didn't receive text
              const Text(
                "Didn't receive? Tap here",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 20),

              //Activate Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
                child: const Text('Activate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
