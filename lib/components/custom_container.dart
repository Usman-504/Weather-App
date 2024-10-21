import 'package:flutter/material.dart';
import 'package:weather_app/constants/colors.dart';

class CustomContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  const CustomContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });


  @override
  Widget build(BuildContext context) {
    var heightX = MediaQuery.of(context).size.height;
    return Container(
      height: heightX * 0.13,
      width: heightX * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kSecondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              height: heightX * 0.002,
            ),
             Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: heightX * 0.002,
            ),
            Text(
              value, style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}