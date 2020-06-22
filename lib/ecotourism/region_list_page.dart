
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddeercampaign/ecotourism/houses_in_region.dart';

import 'package:reddeercampaign/models/region.dart';
import 'package:reddeercampaign/products/product_content.dart';


class RegionListPage extends StatelessWidget {
  const RegionListPage({Key key,@required this.regionList}) : super(key: key);
  final List<Region> regionList;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right:15,left: 15),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text('مناطقی که در آن خانه های بوم گردی مورد تائید پویش مرال وجود دارند  .',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(thickness: 3,),
          ),
          SizedBox(height: 10,),

          Expanded(child:
          ListView.builder(
              itemCount:regionList.length ,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,left: 20),
                    child: Card(
                      color: Colors.green[200],
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.black,
                        child: ListTile(
                          onTap: (){Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HousesInRegionPage(region: regionList[index],)));
                          },

                          title: Text('    '+regionList[index].name,textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.w600),),
                          leading: Icon(Icons.exit_to_app),

                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
          ),
        ],
      ),
    );

  }
}
