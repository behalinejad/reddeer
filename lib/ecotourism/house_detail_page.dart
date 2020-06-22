
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reddeercampaign/models/house_images.dart';
import  'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/custom_widgets/my_image_slider.dart';
import 'package:reddeercampaign/custom_widgets/my_map.dart';

import 'package:reddeercampaign/models/house.dart';

class HouseDetailPage extends StatefulWidget {
  const HouseDetailPage({Key key, @required this.house}) : super(key: key);
  final House house;

  @override
  _HouseDetailPageState createState() => _HouseDetailPageState();
}

class _HouseDetailPageState extends State<HouseDetailPage> {
  @override
  Widget build(BuildContext context) {
   Http http = Http();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.house.name,
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[500],
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              StreamBuilder(
                stream: http.makeHousesImagesGetRequest(widget.house),
                builder: (context,snapshot) {
                  if (snapshot.hasData ) {
                    return MyImageSlider(imgList: snapshot.data,);
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text('تصویری برای این مورد یافت نشده '),
                    );
                  } else {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.lightBlue,
                      strokeWidth: 5,

                    );
                  }
                }
              ),
              //MyImageSlider( imgList: _makeHouseImageList(),),
              SizedBox(height: 20,),
              Text(widget.house.description,style: TextStyle(fontSize: 18),textDirection: TextDirection.rtl,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(thickness: 2,),
              ),
              SizedBox(height: 10,),
              Text('نشانی  :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
              Text(widget.house.address,style: TextStyle(fontSize: 18),textDirection: TextDirection.rtl,),
              Text('شماره تماس  :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
              Text(widget.house.phoneNumber,style: TextStyle(fontSize: 18),textDirection: TextDirection.rtl,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(thickness: 2,),
              ),
              SizedBox(
                height: 400,
                child: MyMap(lat: 36.193450, lng:  52.459327,),
                /*FlutterMap(
                  options:  MapOptions(
                    center: LatLng(51.5, -0.09),
                    zoom: 13.0,
                  ),
                  layers: [
                     TileLayerOptions(
                      urlTemplate: "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",

                      additionalOptions: {
                        'accessToken':
                            'pk.eyJ1IjoicmVkZGVlciIsImEiOiJja2I2NXgzcmkwNHg3MnlvYjZnZjJzYjVrIn0.H5c3MiQs6zH1deC1yl0egw',
                             'id': 'mapbox.streets',
                      },
                    )
                  ],
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}
