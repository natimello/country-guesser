import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? icon;
  const CustomAppBar({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: icon == null ? null : 45,
        leading: icon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  icon!,
                ),
              ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.indigo[600], fontWeight: FontWeight.w600)),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
