
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddeercampaign/models/product.dart';
import 'package:reddeercampaign/products/product_content.dart';


class ProductsListView extends StatelessWidget {
  const ProductsListView({Key key,@required this.productsList}) : super(key: key);
  final List<Product> productsList;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right:15,left: 15),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text('عوائد حاصل از فروش  این محصولات در جهت پیشبرد اهداف پویش مورد استفاده قرار می گیرد .',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(thickness: 3,),
          ),
          SizedBox(height: 10,),
          Text('برای سفارش , نام محصول را به شماره 09111169195  پیامک بفرمایید .',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(thickness: 3,),
          ),
          Expanded(child:
          ListView.builder(
              itemCount:productsList.length ,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,left: 20),
                    child: Card(
                      color: Colors.grey[200],
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.black,
                        child: ListTile(
                          onTap: (){Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductsContent(product: productsList[index],)));
                          },

                          title: Text('    '+productsList[index].title,textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.w600),),
                          leading:Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:MemoryImage(base64Decode(productsList[index].image)),
                              ),
                            ),
                          ), // //Icon(Icons.arrow_forward_ios),


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
