// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This method returns app bar of the 
/// return type: Preferredsizewidget
PreferredSizeWidget MainAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      onPressed: () {
        return context.go("/home"); // navigates to homescreen when hebtus is clicked
      },
      child: const Text('Hebtus'),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(
            onPressed: () {
              return context.go("/basicinfo");
            },
            icon: const Icon(
              Icons.add,
              color: Colors.grey,
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text(
                "Browse events",
                style: TextStyle(fontSize: 12),
              ),
            ),
            const PopupMenuItem(
                child: Text(
              "Manage my events",
              style: TextStyle(fontSize: 12),
            )),
            const PopupMenuItem(
                child: Text(
              "salma.ahmed01@eng-st.cu.edu.eg",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )),
            const PopupMenuItem(
                child: Text(
              "Sign Out",
              style: TextStyle(fontSize: 12),
            )),
          ],
          child: const Icon(
            Icons.supervised_user_circle,
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
