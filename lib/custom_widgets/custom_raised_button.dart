import 'package:flutter/material.dart';


class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton(
      {Key key,
      this.color: Colors.grey,
      this.imageUrl: '',
      this.text: '',
      this.onPressed})
      : super(key: key);
  final Color color;
  final String imageUrl;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('    '),
              Text(text, style: TextStyle(color: Colors.black87, fontSize: 20)),
            ],
          ),
          FlatButton(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(imageUrl)
            ),
            onPressed: onPressed,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),

            ),
          ),
        ],
      ),
    );
  }
}
