import 'package:bytebankbancodedados/model/contacts.dart';
import 'package:flutter/material.dart';

import '../../database/dao/contact_dao.dart';

class ContactsForm extends StatefulWidget {
  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Contacs'),
      backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name'
                ),
                style: TextStyle(
                  fontSize: 24
                ),
              ),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                  labelText: 'Account number'
              ),
              style: TextStyle(
                  fontSize: 24
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: (){
                      final String name = _nameController.text;
                      final int? accountNumber =
                        int.tryParse(_accountNumberController.text);
                      final Contact newContact =
                      Contact(0, name, accountNumber!);
                      _contactDao.save(newContact).then((id) =>
                          Navigator.pop(context));
                    },
                    child: Text('Create')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
