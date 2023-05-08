// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, duplicate_import
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/services/auth_service.dart';
import 'package:hebtus_crossplatform/current_user.dart';
import '../current_user.dart';

/// This method returns app bar of the
/// return type: Preferredsizewidget
CurrentUser currentUser = CurrentUser();
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
        return context
            .go("/home"); // navigates to homescreen when hebtus is clicked
      },
      child: const Text('Hebtus'),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: currentUser.isLoggedIn == true
            ? IconButton(
                onPressed: () {
                  return context.go("/basicinfoStart");
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ))
            : Container(),
      ),
      currentUser.isLoggedIn == true
          ? Padding(
              padding: const EdgeInsets.only(right: 20),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text(
                      "Browse events",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                      onTap: () {
                        return context.go("/creatorhome");
                      },
                      child: const Text(
                        "Manage my events",
                        style: TextStyle(fontSize: 12),
                      )),
                  PopupMenuItem(
                      child: Text(
                    currentUser.getuseremail(),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )),
                  PopupMenuItem(
                      onTap: () async {
                        AuthService authService = AuthService();
                        try {
                          String message = await authService.logout();
                          currentUser.logout();
                          print(message);
                          return context.go("/");
                        } catch (e) {
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: Text(e
                                      .toString()
                                      .replaceAll(RegExp(r'Exception: '), '')),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: const Text(
                        "Sign out",
                        style: TextStyle(fontSize: 12),
                      )),
                ],
                child: const Icon(
                  Icons.supervised_user_circle,
                  color: Colors.grey,
                ),
              ),
            )
          : TextButton(
              onPressed: () {
                return context.go("/");
              },
              child: const Text("Login")),
    ],
  );
}
