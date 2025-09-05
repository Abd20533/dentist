
import 'package:flutter/material.dart';

class BuildSectionHeader extends StatelessWidget {
  const BuildSectionHeader({super.key, required this.title, this.onAdd, required this.icon,  this.color=Colors.black});

  final String title;
  final VoidCallback? onAdd;
  final  IconData icon;
  final  Color? color;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (onAdd != null)
            IconButton(
              icon:  Icon(icon, size: 28,color: color,),
              onPressed: onAdd,
            ),
        ],
      ),
    );
  }
}





class BuildSectionHeaderInverse extends StatelessWidget {
  const BuildSectionHeaderInverse({super.key, required this.title, this.onAdd, required this.icon,  this.color=Colors.black});

  final String title;
  final VoidCallback? onAdd;
  final  IconData icon;
  final  Color? color;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          if (onAdd != null)
            IconButton(
              icon:  Icon(icon, size: 28,color: color,),
              onPressed: onAdd,
            ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),



        ],
      ),
    );
  }
}