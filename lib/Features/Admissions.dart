import 'package:flutter/material.dart';

class AdmissionScreen extends StatefulWidget {
  const AdmissionScreen({Key key}) : super(key: key);

  @override
  State<AdmissionScreen> createState() => _AdmissionScreenState();
}

class _AdmissionScreenState extends State<AdmissionScreen> {
  TextEditingController NameController = TextEditingController();
  TextEditingController RollNumber = TextEditingController();
  TextEditingController ClassNumber = TextEditingController();
  TextEditingController Fee = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController ContactNumber = TextEditingController();
  TextEditingController ContactPersonName = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    NameController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Admission Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                // icon: Icon(Icons.person),
                labelText: 'Student Name',
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                NameController.text = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Roll#:',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                RollNumber.text = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Fee:',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                Fee.text = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Class:',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ClassNumber.text = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Address:',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Address.text = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Contact Number:',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                ContactNumber.text = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Contact Person Name:',
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                ContactPersonName.text = value;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
