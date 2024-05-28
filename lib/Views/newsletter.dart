import 'package:flutter/material.dart';

class Newsletter extends StatelessWidget {
  const Newsletter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Center(
      child: Row(
        children: [
          const Padding(
            //padding: EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.all(10.0),
          ),
          Column(
            children: [
              SizedBox(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  //crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  spacing: 20,
                  runSpacing: 20,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Newsletter",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(
                          0xFF000000,
                        ),
                      ),
                    ),
                    Text(
                      "Subscribe to get offers and latest updates every week!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 18,
                        fontWeight: FontWeight.normal,
                        color: const Color(
                          0xFF000000,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: isSmallScreen ? 2 : 450),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: Wrap(
                  //alignment: WrapAlignment.end,
                  //crossAxisAlignment: WrapCrossAlignment.center,
                  //direction: Axis.horizontal,
                  spacing: isSmallScreen ? 5 : 20,
                  runSpacing: isSmallScreen ? 5 : 20,
                  children: const <Widget>[
                    _FormContent(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Container(
      constraints: BoxConstraints(
        maxWidth: isSmallScreen ? 150 : 250,
      ),
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              _gaph(),
              TextFormField(
                // textAlign: TextAlign.start,
                validator: (value) {
                  // add name
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'yourname@email.com',
                  // prefixIcon: Icon(Icons.alternate_email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              _gaph(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF29395B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Subscribe',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      AlertDialog(
                        title: const Text('Subscription Successful!'),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Your Email has been added to our Newsletter!"),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const MyHomePage(
                      //       title: "AdvenTour",
                      //     ),
                      //   ),
                      // );
                    }
                  },
                ),
              ),
              _gaph(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gaph() => const SizedBox(height: 13); // Sized Box for Height
  Widget _gapw() => const SizedBox(width: 20); // Sized Box for Width
}
