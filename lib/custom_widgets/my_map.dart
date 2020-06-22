import 'package:flutter/material.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

class MyMap extends StatelessWidget {
  const MyMap({Key key,@required this.lat,@required this.lng}) : super(key: key);
  final double lat;
  final double lng;




  @override
  Widget build(BuildContext context) {
    var controller = MapController(
        location: LatLng(lat, lng),
        zoom: 16
    );
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    controller.tileSize = 256 / devicePixelRatio;
    return Map(
      controller: controller,
      provider: const CachedGoogleMapProvider(),

    //),


    );
  }
}

/// You can enable caching by using [CachedNetworkImageProvider] from cached_network_image package.
class CachedGoogleMapProvider extends MapProvider {
  const CachedGoogleMapProvider();

  @override
  ImageProvider getTile(int x, int y, int z) {
    //Can also use CachedNetworkImageProvider.
    return NetworkImage(
        'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425');
  }
}

