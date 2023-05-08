// ignore_for_file: no_logic_in_create_state



import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:hebtus_crossplatform/globals/globals.dart';



///This class returns textfield for entering LocationSearch
class LocationSearch extends StatefulWidget {
 
  final void Function(
      {String? category,
       DateTime? todaystartdate, DateTime? todayenddate,double?long,double?lat,
      bool? online,
      bool? free,
      String?address}) rebuildLandingPage;
      LocationSearch({super.key,required this.rebuildLandingPage});

  @override
  State<LocationSearch> createState() => _LocationSearchState(rebuildLandingPage);
 
}

class _LocationSearchState extends State<LocationSearch> {
 
  final TextEditingController _searchController = TextEditingController();
  String _responseText = '';
 
  _LocationSearchState(rebuildLandingPage);
  @override
  void initState() {
    super.initState();
    
  }
  



  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 19),
            width: MediaQuery.of(context).size.width * 0.28,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Enter LocationSearch",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Search'),
            onPressed: search,
          ),
          Center(
            child: Text(_responseText),
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
      widget.rebuildLandingPage(long:longitude_v,lat:latitude_v);
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
