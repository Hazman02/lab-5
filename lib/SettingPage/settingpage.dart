import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final String selectedFactory;
  final ValueChanged<String> onFactoryChanged;

  const SettingsPage({
    required this.selectedFactory,
    required this.onFactoryChanged,
    super.key,
  });

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    if (widget.selectedFactory == 'Factory 1') {
      return _buildSettingsPage();
    } else {
      return _buildContactPage();
    }
  }

  Widget _buildSettingsPage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: DropdownButton<String>(
          value: widget.selectedFactory,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              widget.onFactoryChanged(newValue);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Settings Page: ${widget.selectedFactory}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildThresholdForm(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
              child: Text(isEditing ? 'Save' : 'Edit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThresholdForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildThresholdField(label: 'Steam Pressure', initialValue: '34.19 bar'),
        _buildThresholdField(label: 'Steam Flow', initialValue: '22.82 T/H'),
        _buildThresholdField(label: 'Water Level', initialValue: '55.41%'),
        _buildThresholdField(label: 'Power Frequency', initialValue: '50.08 Hz'),
      ],
    );
  }

  Widget _buildThresholdField({required String label, required String initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (isEditing)
            Expanded(
              child: TextFormField(
                initialValue: initialValue,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter minimum threshold',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContactPage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: DropdownButton<String>(
          value: widget.selectedFactory,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              widget.onFactoryChanged(newValue);
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
      body: Center(
        child: Text(
          'Setting Page: ${widget.selectedFactory}',
        ),
      ),
    );
  }
}
