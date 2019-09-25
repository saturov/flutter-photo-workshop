import 'package:flutter/material.dart';
import 'package:sharing_codelab/components/primary_raised_button.dart';

import '../util/to_be_implemented.dart';

class CreateTripPage extends StatefulWidget {
  @override
  _CreateTripPageState createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController tripNameFormController = TextEditingController();

  @override
  void dispose() {
    tripNameFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: _isLoading
            ? Center(child: const CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: tripNameFormController,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Trip name',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                      child: const Text(
                        'This will create a shared album in your Google Photos'
                            ' account',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Center(
                      child: PrimaryRaisedButton(
                        onPressed: () => _createTrip(context),
                        label: const Text('Create Trip'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _createTrip(BuildContext context) async {
    // Display the loading indicator.
    setState(() => _isLoading = true);

    // TODO(codelab): Implement call to PhotosLibraryApiModel scope here.
    ToBeImplemented.showMessage();

    // Hide the loading indicator.
    setState(() => _isLoading = false);
    Navigator.pop(context);
  }
}
