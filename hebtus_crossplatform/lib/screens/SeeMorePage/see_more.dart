// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/screens/SeeMorePage/component/events.dart';

///This class returns page that opens after clicking on see more button
class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(context),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(  /// page
          physics: const BouncingScrollPhysics(),
          child: Container(
            child: Column(children: [
              GridView.count(
                childAspectRatio: 0.85,
                crossAxisCount: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? 4
                    : 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (var i = 0; i < 6; i++) EventSeeMore(num: i), 
                ],
              ),
            ]),
          ),
        ));
  }
}
