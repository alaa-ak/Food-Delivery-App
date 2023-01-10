import 'package:food_delivery_app/data/api_client/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPerferences;

  LocationRepo({required this.apiClient, required this.sharedPerferences});

  Future<Response> getAddressfromGeocode(LatLng latlng) async {
    print("Hi I am getAddressfromGeocode");
    print("Lat is ${latlng.latitude}" + " Lng is ${latlng.longitude}");
    return await apiClient.getData('${AppConstants.GEOCODE_URI}'
        '?lat=${latlng.latitude}&lng=${latlng.longitude}');
  }
}
