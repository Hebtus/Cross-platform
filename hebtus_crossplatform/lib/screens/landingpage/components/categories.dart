import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  height: 10,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
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
                              Expanded(
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
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 3, right: 5),
                                  child: Center(
                                      child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: AutoSizeText(
                                            "Performing & visual arts",
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                ),
                              )
                            ]),
                      ),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 9, right: 5),
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
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 9, right: 5),
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
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 9, right: 5),
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
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 9, right: 5),
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
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 9, right: 5),
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
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Color.fromARGB(255, 255, 249, 249),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 250, 195, 188),
                      onTap: () {},
                      child: Container(
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 9, right: 5),
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
                  )),
            ]));
  }
}
