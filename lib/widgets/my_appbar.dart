import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;

  const MyAppBar({
    Key? key,
    required this.title,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.blue
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white,
           fontSize: 20,
           ),
        ),
        centerTitle: centerTitle,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
      ),
    );
  }
}
