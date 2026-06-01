import 'package:flutter/material.dart';

class BuildListTitle extends StatelessWidget {
  const BuildListTitle({super.key,
    required this.icon,
    required this.title,
    this.onTap,});

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 34),
      title: Text(title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class BuildSwitchTitle extends StatelessWidget {
  const BuildSwitchTitle({super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,});

  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 34),
      title: Text(title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      trailing: Switch(
        value: value,
        activeColor: Colors.blue,
        onChanged: onChanged,
      ),
    );
  }
}