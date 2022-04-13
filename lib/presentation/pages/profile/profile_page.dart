import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _profileContent(),
        Container(
          margin: const EdgeInsets.only(top: 48, right: 48),
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => _developDialog(context),
            icon: const Icon(Icons.info_outline),
          ),
        ),
      ],
    );
  }

  Widget _profileContent() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.image),
          ),
          const SizedBox(height: 16),
          const Text('Mihalkov Gleb Alexandrovich'),
          const SizedBox(height: 16),
          const Text('email: mihalkovgleb@gmail.com'),
        ],
      ),
    );
  }

  void _developDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SimpleDialog(
          title: Text('About the developer'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Group number: 951008'),
            ),
            SimpleDialogOption(
              child: Text('Student\'s last name: Mihalkov'),
            ),
            SimpleDialogOption(
              child: Text('Laboratory work number: 1'),
            ),
          ],
        );
      },
    );
  }
}
