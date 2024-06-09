import 'package:flutter/material.dart';
import 'package:lab5v2/SettingPage/settingpage.dart';
import 'package:lab5v2/contactPages/contactpage.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1; // Default to the Home page
  String _selectedFactory = 'Factory 1'; // Default factory

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFactoryChanged(String newFactory) {
    setState(() {
      _selectedFactory = newFactory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            SettingsPage(
              selectedFactory: _selectedFactory,
              onFactoryChanged: _onFactoryChanged,
            ),
            HomePage(
              selectedFactory: _selectedFactory,
              onFactoryChanged: _onFactoryChanged,
            ),
            ContactsPage(
              selectedFactory: _selectedFactory,
              onFactoryChanged: _onFactoryChanged,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String selectedFactory;
  final ValueChanged<String> onFactoryChanged;

  const HomePage({
    required this.selectedFactory,
    required this.onFactoryChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: DropdownButton<String>(
          value: selectedFactory,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onFactoryChanged(newValue);
            }
          },
          items: ['Factory 1', 'Factory 2', 'Factory 3', 'Factory 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
        body: selectedFactory == 'Factory 1'
          ? _buildGridWidgets()
          : Center(
              child: Text('Home page: $selectedFactory'),
            ),
    );
  }

  Widget _buildGridWidgets(){
    return Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _buildInfoWidget(
                    title: 'Steam Pressure',
                    value: '34.19 bar',
                    imageUrl: 'images/gauge.png', // Replace with actual image asset path
                  ),
                ),
                Expanded(
                  child: _buildInfoWidget(
                    title: 'Steam Flow',
                    value: '22.82 T/H',
                    imageUrl: 'images/gauge.png', // Replace with actual image asset path
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _buildInfoWidget(
                    title: 'Water Level',
                    value: '55.41%',
                    imageUrl: 'images/gauge.png', // Replace with actual image asset path
                  ),
                ),
                Expanded(
                  child: _buildInfoWidget(
                    title: 'Power Frequency',
                    value: '50.08 Hz',
                    imageUrl: 'images/gauge.png', // Replace with actual image asset path
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }

  Widget _buildInfoWidget({
    required String title,
    required String value,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.asset(
            imageUrl,
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(value),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}