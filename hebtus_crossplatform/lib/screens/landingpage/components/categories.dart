import 'package:flutter/material.dart';
class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children:  [
      Row(children: [
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.music_note_sharp,color:Colors.pink,size: 30,)),
                const Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text("Music",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ]),
            ),)
            
          ),
        ),
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.music_note_sharp,color:Colors.pink,size: 30,)),
                Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Column(
                  children: const [
                    Text("Performing & ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Visual arts ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                )
              ]),
            ),)
            
          ),
        ),
      ],),
       
       Row(children: [
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.holiday_village_rounded,color:Colors.pink,size: 30,)),
                const Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text("Holiday",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ]),
            ),)
            
          ),
        ),
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.health_and_safety_rounded,color:Colors.pink,size: 30,)),
                Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text("Health",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ]),
            ),)
            
          ),
        ),
      ],),
      Row(children: [
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.games_sharp,color:Colors.pink,size: 30,)),
                const Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text("Hobbies",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ]),
            ),)
            
          ),
        ),
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.business,color:Colors.pink,size: 30,)),
                Padding(
                  padding: EdgeInsets.only(left:20),
                 child: Text("Business",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ]),
            ),)
            
          ),
        ),
      ],),
      
      Row(children: [
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.local_drink,color:Colors.pink,size: 30,)),
                 Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: Column(
                  children: const [
                    Text("Food & ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Drink ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                )
              ]),
            ),)
            
          ),
        ),
        Container(
          width: 250,
          child: Card(
            margin: const EdgeInsets.all(25),
            clipBehavior: Clip.hardEdge,
            color: Color.fromARGB(255, 255, 249, 249),
            child:InkWell(
              splashColor: Color.fromARGB(255, 250, 195, 188),
              onTap: (){},
              child: 
             Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                Container(color: const Color.fromARGB(255, 247, 229, 218),
                height: 80,
                
                  child: const Icon(Icons.sports,color:Colors.pink,size: 30,)),
                Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Column(
                  children: const [
                    Text("Sports & ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Fitness ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                )
              ]),
            ),)
            
          ),
        ),
      ],),
    ],);
  }
}