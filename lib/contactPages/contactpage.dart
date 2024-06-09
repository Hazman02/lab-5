import 'package:flutter/material.dart';
import 'package:lab5v2/contactPages/addContactPages.dart';

class ContactsPage extends StatelessWidget {
  final String selectedFactory;
  final ValueChanged<String> onFactoryChanged;

  const ContactsPage({
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
          ? _buildContactList()
          : Center(
              child: Text('Contacts Page: $selectedFactory'),
            ),
      floatingActionButton: selectedFactory == 'Factory 1'
          ? FloatingActionButton(
              onPressed: () {
                // Navigate to AddContactPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddContactPage()),
                );
              },
              child: const Icon(Icons.add),
            )
          : null, // Hide the FAB for other factories
    );
  }

  Widget _buildContactList() {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildContactItem(
            name: 'John Doe',
            role: 'Engineer',
            phoneNumber: '+1 123 456 7890',
          ),
          _buildContactItem(
            name: 'Jane Smith',
            role: 'Technician',
            phoneNumber: '+1 987 654 3210',
          ),
          // Add more contact items here
        ],
      ),
    );
  }

  Widget _buildContactItem({required String name, required String role, required String phoneNumber}) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text('$role\n$phoneNumber'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // Handle deleting contact
          },
        ),
        onTap: () {
          // Handle contact item tap
        },
      ),
    );
  }
}
