import 'package:flutter/material.dart';

class ProjectHeaderAvatar extends StatelessWidget {
  const ProjectHeaderAvatar({Key key, this.photoUrl, this.radius:20,this.icon,this.title}) : super(key: key);
  final String  photoUrl ;
  final double radius;
  final IconData icon;
  final String title ;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        /*border: Border.all(
          color: Colors.black12,
          width:2.0,
        ),*/

      ),
      child:Padding(
        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
        child: Column(
          children: <Widget>[
            InkWell(

              child: CircleAvatar(
                radius: radius,
                backgroundColor: Colors.black12 ,
                backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
                //child: photoUrl == null ? Center(child: Icon(icon,size: 50)) : null,
              ),
            ),
            Text(_makeTitle()),
          ],
        ),
      ),

    );
  }

  String _makeTitle() {
    if (title.length > 8 )
      {
        return  '...' + title.substring(0,7) ;
      }else{
      return title;
    }

  }
}
