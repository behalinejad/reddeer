import 'dart:convert';
import 'package:reddeercampaign/logic/bo.dart';
import 'package:reddeercampaign/models/house.dart';
import 'package:reddeercampaign/models/house_images.dart';
import 'package:reddeercampaign/models/news.dart';
import 'package:reddeercampaign/models/product.dart';
import 'package:reddeercampaign/models/project.dart';
import 'package:reddeercampaign/models/region.dart';
import 'package:reddeercampaign/models/user.dart';
import 'package:http/http.dart' as http;

class Http {
  final url = 'http://192.168.43.186:8000/';
  final users = 'users/';
  final region = 'region/';
  final house = 'house/';
  final houseImages = 'house_images/';
  final news = 'news/';
  final activeProjects = 'projects/active/';
  final userDeviceId = 'usersbydevice/';
  final usersByUserName = 'usersbyusername/';
  final products = 'products/';
  final isActive = 'isactive/';
  final headers = {'Content-Type': 'application/json'};
  final encoding = Encoding.getByName('utf8');



  Future<List<User>> makeUsersGetRequest() async {
    try {
      http.Response response = await http.get('$url$users',headers: headers);
      List<User> result = List<User>.from(
          json.decode( utf8.decode(response.bodyBytes) ).map((json) => User.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      return result;
    } on Exception catch (e) {
      throw e;
    }
  }

  Stream<User> makeUserGetRequest(int id) async* {
    try {
      http.Response response = await http.get('$url$users$id',headers: headers);
      List<User> result = List<User>.from(
          json.decode(utf8.decode(response.bodyBytes)).map((json) => User.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      if(result.isNotEmpty) {
        yield result.first;
      }else{
        yield null;
      }
    } on Exception catch (e) {
      throw e;
    }
  }
  Future<User> makeUserGetRequestByUsername(String userName) async {
    try {
      http.Response response = await http.get('$url$usersByUserName$userName',headers: headers);
      List<User> result = List<User>.from(
          json.decode(utf8.decode(response.bodyBytes)).map((json) => User.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      if(result.isNotEmpty) {
        return result.first;
      }else{
        return null;
      }
    } on Exception catch (e) {
      throw e;

    }
  }
  Stream<User> makeUserGetRequestByDeviceId(String deviceId) async* {
    try {
     // print('Device id  = '+deviceId);
      http.Response response = await http.get('$url$userDeviceId$deviceId',headers: headers);
      List<User> result = List<User>.from(
          json.decode(utf8.decode(response.bodyBytes)).map((json) => User.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
    //  print('**********'+result.first.toJson());
      if(result.isNotEmpty) {
        print('**********'+result.first.toJson().toString());
        yield result.first;
      }else{
        yield null;
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  makeUserPostRequest(User user) async {
    try {
      String body = json.encode(user.toJson() );
      http.Response response = await http.post('$url$users',
          headers: headers, body: body, encoding:  encoding);
      //print('>>>>>>>>>>>>>>>>>>>>>>>>'+utf8.decode(response.bodyBytes));
     // print('++++++++++++++++++++++++${getStatusCode(response.statusCode)}');
    } on Exception catch (e) {
      throw e;
    }
  }

  makeUserPutRequest(User user) async {
    try {
      String body = json.encode(user.toJsonById());
      http.Response response = await http.put('$url$users${user.id}',
          headers: headers, body: body, encoding: encoding);
      print(response.body);
      print('${getStatusCode(response.statusCode)}');
    } on Exception catch (e) {
      throw e;
    }
  }

  makeUserDeleteRequest(User user) async {
    try {
      http.Response response = await http.post('$url$users${user.id}',
          headers: headers, encoding: encoding);
      print(response.body);
      print('${getStatusCode(response.statusCode)}');
    } on Exception catch (e) {
      throw e;
    }
  }


  Stream<List<News>> makeIsActiveNewsGetRequest(String newsActivationStatus) async* {
    try {
      http.Response response = await http.get('$url$news$isActive$newsActivationStatus',headers: headers);
      List<News> result = List<News>.from(
          json.decode(utf8.decode(response.bodyBytes)).map((json) => News.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      yield result;
    } on Exception catch (e) {
      throw e;
    }
  }

  Stream<List<Project>> makeActiveProjectsGetRequest() async* {
    try {
      http.Response response = await http.get('$url$activeProjects',headers: headers);
      List<Project> result = List<Project>.from(
          json.decode( utf8.decode(response.bodyBytes) ).map((json) => Project.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      yield result;
    } on Exception catch (e) {
      throw e;
    }
  }

  Stream<List<Product>> makeProductsGetRequest() async* {
    try {
      http.Response response = await http.get('$url$products',headers: headers);
      List<Product> result = List<Product>.from(
          json.decode( utf8.decode(response.bodyBytes) ).map((json) => Product.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      yield result;
    } on Exception catch (e) {
      throw e;
    }
  }

  Stream<List<Region>> makeRegionGetRequest() async* {
    try {
      http.Response response = await http.get('$url$region',headers: headers);
      List<Region> result = List<Region>.from(
          json.decode( utf8.decode(response.bodyBytes) ).map((json) => Region.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      yield result;
    } on Exception catch (e) {
      throw e;
    }
  }

  Stream<List<House>> makeHousesInRegionGetRequest(Region region) async* {
    try {
      http.Response response = await http.get('$url$house${region.id}',headers: headers);
      List<House> result = List<House>.from(
          json.decode( utf8.decode(response.bodyBytes) ).map((json) => House.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      yield result;
    } on Exception catch (e) {
      throw e;
    }
  }

  Stream<List<HouseImage>> makeHousesImagesGetRequest(House house) async* {
    try {
      http.Response response = await http.get('$url$houseImages${house.id}',headers: headers);
      List<HouseImage> result = List<HouseImage>.from(
          json.decode( utf8.decode(response.bodyBytes) ).map((json) => HouseImage.fromJson(json)));
      result.sort((a, b) => a.id.compareTo(b.id));
      print('${getStatusCode(response.statusCode)}');
      yield result;
    } on Exception catch (e) {
      throw e;
    }
  }
}
