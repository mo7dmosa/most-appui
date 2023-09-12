import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostui/models/address.dart';
import 'package:mostui/models/country.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  String? _gender;
  int? _selectedCountryId;
  late TextEditingController _experienceTextController;

  List<Address> _addresses = <Address>[
    Address(name: 'Address #1'),
    Address(name: 'Address #2'),
    Address(name: 'Address #3'),
    Address(name: 'Address #4'),
  ];

  final List<Country> _countries = <Country>[
    const Country(id: 1, name: 'Palestine'),
    const Country(id: 2, name: 'Eygpt'),
    const Country(id: 3, name: 'Moroco'),
  ];

  List<String> _experiences = <String>[];

  @override
  void initState() {
    super.initState();
    _experienceTextController = TextEditingController();
  }

  @override
  void dispose() {
    _experienceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        SwitchListTile(
          title: const Text('Notificcations'),
          subtitle: const Text('Enable/Disable Notificatiosn'),
          value: _notifications,
          onChanged: (bool value) {
            setState(() => _notifications = value);
          },
        ),
        const SizedBox(height: 10),
        Text(
          'Gender',
          style: GoogleFonts.nunito(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text('Male'),
                value: 'M',
                groupValue: _gender,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() => _gender = value);
                  }
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Female'),
                value: 'F',
                groupValue: _gender,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() => _gender = value);
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Address',
          style: GoogleFonts.nunito(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        for (Address address in _addresses)
          CheckboxListTile(
            title: Text(address.name),
            value: address.selected,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  address.selected = value;
                });
              }
            },
          ),
        const SizedBox(height: 10),
        Text(
          'Country',
          style: GoogleFonts.nunito(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<int>(
          isExpanded: true,
          onChanged: (int? value) {
            setState(() => _selectedCountryId = value);
          },
          value: _selectedCountryId,
          hint: const Text('Select country'),
          dropdownColor: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(10),
          itemHeight: 48,
          onTap: () => print('Tapped'),
          elevation: 4,
          items: _countries.map((Country country) {
            return DropdownMenuItem<int>(
              value: country.id,
              child: Text(country.name),
              onTap: () {},
              enabled: false,
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Text(
          'Experiences',
          style: GoogleFonts.nunito(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: _experienceTextController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.send,
          style: GoogleFonts.nunito(),
          maxLength: 30,
          enabled: true,
          onSubmitted: (String value) => _performSave(),
          decoration: InputDecoration(
            hintText: 'Enter experience',
            hintStyle: GoogleFonts.nunito(),
            counterText: '',
            suffixIcon: IconButton(
              onPressed: () => _performSave(),
              icon: const Icon(Icons.add),
            ),
          ),
        ),
        Wrap(
          spacing: 10,
          children: _experiences.map((String experience) {
            return Chip(
              elevation: 3,
              avatar: const Icon(
                Icons.category,
                size: 14,
                color: Colors.white,
              ),
              side: const BorderSide(
                color: const Color(0xFFE4DCCF),
              ),
              deleteIcon: const Icon(Icons.close, size: 14),
              deleteIconColor: const Color(0xFFE4DCCF),
              deleteButtonTooltipMessage: 'DELETE',
              onDeleted: () {
                print('Delete: $experience');
                _delete(experience: experience);
              },
              label: Text(
                experience,
                style: GoogleFonts.nunito(
                  color: const Color(0xFFF0EBE3),
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: const Color(0xFF7D9D9C),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_experienceTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enter required data'),
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }

  void _save() {
    setState(() => _experiences.add(_experienceTextController.text));
    _experienceTextController.clear();
  }

  void _delete({required String experience}) {
    setState(() => _experiences.remove(experience));
  }
}
