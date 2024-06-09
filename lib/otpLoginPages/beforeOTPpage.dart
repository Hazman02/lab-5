import 'package:flutter/material.dart';
import 'afterOTPpage.dart';

class Beforeotppage extends StatefulWidget {
  const Beforeotppage({super.key});

  @override
  _BeforeotppageState createState() => _BeforeotppageState();
}

class _BeforeotppageState extends State<Beforeotppage> {
  bool _isChecked = false;

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

              //Enter your mobile number
              const Text(
                'Please Enter Your Mobile Phone',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              //bendera malaysia + textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Image.asset('images/malaysia-flag-icon.png', height: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          hintText: 'Enter mobile number',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //checklist I agree with terms and conditions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      'I agree with terms and conditions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //Get Activation Code Button
              ElevatedButton(
                onPressed: _isChecked
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Afterotppage()),
                        );
                      }
                    : null,
                child: const Text('Get Activation Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
