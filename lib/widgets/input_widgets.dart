import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    Key? key,
    required this.formKey,
    required this.textController,
    required this.hints,
  }) : super(key: key);

  final GlobalKey formKey;
  final List<TextEditingController> textController;
  final List<String> hints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: textController
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      controller: e,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'can not be null';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: hints[textController.indexOf(e)],
                        prefixIcon: Icon(
                          textController.indexOf(e) == 0
                              ? Icons.person
                              : Icons.lock,
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
