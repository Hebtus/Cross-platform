import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hebtus_crossplatform/constants.dart' as constants;

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      child: Row(
        
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_drop_down_sharp,
              color: Color.fromARGB(255, 122, 190, 245),
              size: 47,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            width: 120.w,
            child:  TextField(
              decoration: InputDecoration(
                hintText: "Enter location",hintStyle: TextStyle(fontSize:15.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
