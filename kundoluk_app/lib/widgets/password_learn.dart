import 'package:flutter/material.dart';

class PasswordLearn extends StatefulWidget {
  const PasswordLearn({Key? key}) : super(key: key);

  @override
  State<PasswordLearn> createState() => _PasswordLearnState();
}

class _PasswordLearnState extends State<PasswordLearn> {
  bool _isScure = true;
  void _isChangeLoading() {
    setState(() {
      _isScure = !_isScure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const [AutofillHints.password],
            obscureText: _isScure,
            decoration: InputDecoration(
              suffix: IconButton(
                  onPressed: () {
                    _isChangeLoading();
                  },
                  icon:
                      Icon(_isScure ? Icons.visibility : Icons.visibility_off)),
              border: const UnderlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
