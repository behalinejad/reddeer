import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddeercampaign/custom_widgets/avatar.dart';


class HomeUserContainer extends StatelessWidget {
  const HomeUserContainer({Key key, this.name, this.lastName}) : super(key: key);
  final name;
  final lastName;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
       borderRadius: BorderRadius.all(Radius.circular(10)),
       color: Colors.greenAccent,
       gradient: LinearGradient(
         colors: [Colors.greenAccent[100], Colors.greenAccent],
         begin: Alignment.bottomLeft,
         end: Alignment.topRight,
       ),
       //border: Border(bottom: BorderSide()),
      ),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             Column(
               children: <Widget>[
                 Text(' $name $lastName '),

               ],
             ),
            //Divider(color: Colors.black12,thickness: 5,),
            Avatar(radius: 10,icon: Icons.person_outline,),
           ],
         ),
       ),
    );
  }
}
