import 'package:flutter/material.dart';
import 'package:sharing_codelab/util/to_be_implemented.dart';

class JoinTripPage extends StatefulWidget {
  @override
  _JoinTripPageState createState() => _JoinTripPageState();
}

class _JoinTripPageState extends State<JoinTripPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController shareTokenFormController =
      TextEditingController();

  @override
  void dispose() {
    shareTokenFormController.dispose();
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
                      controller: shareTokenFormController,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Paste the share token',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                      child: const Text(
                        'This will join an album in your Google Photos account',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Center(
                      child: RaisedButton(
                        onPressed: () => _joinTrip(context),
                        child: const Text('Join Trip'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _joinTrip(BuildContext context) async {
    // TODO(codelab): Implement this call
    ToBeImplemented.showMessage();

    // Show loading indicator

    // Call the API to join an album with the entered share token

    // Hide loading indicator

    // Return to the previous screen
    Navigator.pop(context);
  }
}
