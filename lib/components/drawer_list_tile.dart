import 'package:flutter/material.dart';

class ReusableModalListTile extends StatelessWidget {

  final IconData icon;
  final String titleText;

  const ReusableModalListTile({
    required this.icon,
    required this.titleText,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black.withOpacity(0.5),
        size: 24.0,
      ),
      title: Text(
        titleText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}