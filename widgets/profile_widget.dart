import 'package:flutter/material.dart';
import '../models/user.dart'; 

class ProfileWidget extends StatelessWidget { 
  final User user;
  final VoidCallback? onEditPressed;
  final bool isCompact;

  const ProfileWidget({
    Key? key,
    required this.user,
    this.onEditPressed,
    this.isCompact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue[50], 
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: isCompact ? 24 : 40,
            child: Icon(Icons.person, size: isCompact ? 24 : 40),
          ),
          const SizedBox(height: 16),
          Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(user.email, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
