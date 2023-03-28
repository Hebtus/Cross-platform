// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// This class returns cards that represent different categories 
class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: GridView.count(
            crossAxisCount:
                (MediaQuery.of(context).orientation == Orientation.landscape)
                    ? 4
                    : 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 10,
            childAspectRatio: 1/0.7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:10,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.music_note_sharp,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Music",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.theater_comedy,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Performing & Visual arts",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.holiday_village,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Holiday",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.health_and_safety,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Health",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
             SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.gamepad,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Hobbies",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.business,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Business",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.local_drink,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Food & Drink",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20,left:15),
                    child: FittedBox(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.hardEdge,
                        color: const Color.fromARGB(255, 255, 249, 249),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 250, 195, 188),
                          onTap: () {},
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      color:
                                          const Color.fromARGB(255, 247, 229, 218),
                                      height: double.infinity,
                                      child: const Icon(
                                        Icons.sports,
                                        color: Colors.pink,
                                        size: 30,
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Center(
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: AutoSizeText(
                                                "Sports & Fitness",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold),
                                              ))),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
            ]));
  }
}
