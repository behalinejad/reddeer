import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_images_slider/flutter_images_slider.dart';
import 'package:reddeercampaign/models/house_images.dart';

class MyImageSlider extends StatelessWidget {
  const MyImageSlider({Key key,@required this.imgList}) : super(key: key);
  final List<HouseImage> imgList;



  List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
  List<String> _toStrList(List<HouseImage> imageList){
    List<String> imageListStr;
    if (imageList.length > 0) {
     /* imageList.forEach((houseImage) {
        imageListStr.add(houseImage.image);
      });*/
     for(int i=0;i<imageList.length;i++){
       imageListStr.add(imageList[i].image);
     }
    }
    return imageListStr;
  }
  @override
  Widget build(BuildContext context) {
  // List<String> strImageList =  _toStrList(imgList);

    if (imgList.length>0) {
      return ImagesSlider(
        items: _map<Widget>(imgList, (index, i) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    //image: NetworkImage(i),
                    image: MemoryImage(base64Decode(imgList[index].image)),
                    fit: BoxFit.cover
                )
            ),
          );
        }),
        autoPlay: true,
        viewportFraction: 1.0,
        aspectRatio: 2.0,
        distortion: false,
        align: IndicatorAlign.bottom,
        indicatorWidth: 5,
        autoPlayDuration: Duration(seconds: 2),
        indicatorColor: Colors.green,
        indicatorBackColor: Colors.greenAccent[100],


      )
      ;
    }else{
      return Text('تصویری برای این مورد یافت نشد');
    }
  }
}
