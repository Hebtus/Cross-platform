import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/LandingPage/landing_page.dart';

PreferredSizeWidget mainappbar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      onPressed: () {
        LandingPageScreen();
      },
      child: const Text('Hebtus'),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(
            onPressed: () {},
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
              "Tickets",
              style: TextStyle(fontSize: 12),
            )),
            const PopupMenuItem(
                child: Text(
              "Credits",
              style: TextStyle(fontSize: 12),
            )),
            const PopupMenuItem(
                child: Text(
              "Liked",
              style: TextStyle(fontSize: 12),
            )),
            const PopupMenuItem(
                child: Text(
              "Following",
              style: TextStyle(fontSize: 12),
            )),
            const PopupMenuItem(
                child: Text(
              "Interests",
              style: TextStyle(fontSize: 12),
            )),
            const PopupMenuItem(
                child: Text(
              "salma.ahmed01@eng-st.cu.edu.eg",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )),
            const PopupMenuItem(
                child: Text(
              "Account settings",
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
