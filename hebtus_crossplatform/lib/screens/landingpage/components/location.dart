import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:hebtus_crossplatform/globals/globals.dart';

///This class returns textfield for entering location
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
  /*void search() async {
    _LocationState().search() as List<double>;
    return ;
   }*/
}

class _LocationState extends State<Location> {
  final TextEditingController _searchController = TextEditingController();
  String _responseText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text(
                    "use current location",
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {},
                ),
              ],
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 19),
              width: MediaQuery.of(context).size.width * 0.28,
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Enter location",
                  hintStyle: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Search'),
            onPressed: search,
          ),
          Expanded(
            child: Center(
              child: Text(_responseText),
            ),
          ),
        ],
      ),
    );
  }

  void search() async {
    final searchQuery = _searchController.text;
    if (searchQuery.isEmpty) {
      setState(() {
        _responseText = 'Please enter a search query.';
      });
      return;
    }
    final response = await http.get(Uri.parse(
        'https://api.geoapify.com/v1/geocode/autocomplete?text=$searchQuery&apiKey=8c0ae3cbd8fc449aab02e760ef906a5d'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['features'].isEmpty) {
        /* setState(() {
          _responseText = 'No results found for "$searchQuery".';
        });*/
        return;
      }
      final coordinates = data['features'][0]['geometry']['coordinates'];
      latitude_v = coordinates[1];
      longitude_v = coordinates[0];
      setState(() {
        _responseText = 'Latitude: $latitude_v\nLongitude: $longitude_v';
      });
      log('API response: $_responseText');
    } else {
      setState(() {
        _responseText =
            'Error: API request failed with status code ${response.statusCode}.';
      });

      log('API request failed with status code ${response.statusCode}');
      return;
    }
  }
}
