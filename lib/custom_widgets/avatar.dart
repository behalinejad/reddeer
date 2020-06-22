import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key key, this.photoUrl, this.radius:20,this.icon}) : super(key: key);
  final String  photoUrl ;
  final double radius;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(  // decoration Worth to learn more
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black12,
          width: 5.0,
        ),

      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.black12 ,
        foregroundColor: Colors.black,
        backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
        child: photoUrl == null ? Icon(icon,size: radius+8) : null,
      ),
    );
  }
}
