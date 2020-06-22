import 'package:flutter/material.dart';
import 'package:reddeercampaign/ecotourism/house_detail_page.dart';
import 'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/models/region.dart';



class HousesInRegionPage extends StatefulWidget {
  const HousesInRegionPage({Key key,@required this.region}) : super(key: key);
  final Region region;




  @override
  _HousesInRegionPageState createState() => _HousesInRegionPageState();
}

class _HousesInRegionPageState extends State<HousesInRegionPage> {
  Http http = Http();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text( 'خانه های بوم گردی در ' +widget.region.name,style: TextStyle(fontSize: 18),),
        centerTitle: true,
        backgroundColor: Colors.green[500],
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.lightBlue,
          gradient: LinearGradient(
            colors: [Colors.grey[200], Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
           Expanded(
             child: StreamBuilder(
              stream: http.makeHousesInRegionGetRequest(widget.region),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount:snapshot.data.length ,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 30,left: 20),
                          child: Card(
                            color: Colors.grey[200],
                            elevation: 10,
                            child: InkWell(
                              splashColor: Colors.black,
                              child: ListTile(
                                onTap: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HouseDetailPage (house: snapshot.data[index],)));
                                },

                                title: Text('    '+snapshot.data[index].name,textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.w600),),
                                leading:Icon(Icons.home,color: Colors.brown,),

                              ),
                            ),
                          ),
                        );
                      }
                  );
                }else if(snapshot.hasError){
                  return Container(
                    child: Text(snapshot.error.toString()),
                  );
                } else{
                  return Center(
                    child:CircularProgressIndicator(
                      backgroundColor: Colors.lightBlue,
                      strokeWidth: 5,
                    ),
                  );
                }
              },
          ),
           ),
          ],
        ),
      ),
    );
  }
}
