// import 'package:geolocator/geolocator.dart';
// // import 'package:geocoder/geocoder.dart';
//
// String adr1 =
//     " C-309, Gautam Appartment, Gauhar Baug , Bilimora , Gujarat 369321 , India ";
// String adr2 =
//     " B/2 Jay Appartment, Nutan Park Society, Near Anavil Wadi, Bilimora , Gujarat 369321 , India";
//
// Address address = Address(
//   addressLine: adr2,
// );
// double latitude = 20.7691082;
// double longitude = 72.9751604;
// double diff = 0.0;
//
// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//   return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.medium);
// }
//
// void getLocation() async {
//   try {
//     Position position = await _determinePosition();
//     final coordinates = new Coordinates(position.latitude, position.longitude);
//     var addresses =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var first = addresses.first;
//     print("hello 1");
//     address = first;
//     print("hello 2");
//     print("${first.featureName} : ${first.addressLine}");
//     print(position.latitude);
//     print(position.longitude);
//     latitude = position.latitude;
//     longitude = position.longitude;
//   } catch (e) {
//     print("hello 3");
//     print(e);
//   }
// }
//
// Future<Coordinates> getCordinates() async {
//   final query =
//       "C-309, Gautam Appartment, Gauhar Baug , Bilimora , Gujarat 369321 , India";
//   var addresses = await Geocoder.local.findAddressesFromQuery(query);
//   var first = addresses.first;
//   print("${first.featureName} : ${first.coordinates}");
//   return first.coordinates;
// }
//
// void diffCordinates() async {
//   print("Diff cord strt");
//   Coordinates c = await getCordinates();
//   double distanceInMeters =
//       Geolocator.distanceBetween(latitude, longitude, c.latitude, c.longitude);
//   print(distanceInMeters);
//   diff = distanceInMeters;
//   print("Diff cord end");
// }
//
// // class Location{
// //   double latitude,longitude;
// //   Future<void> getCurrentLocation() async{
// //     try{
// //       Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.low,
// //       );
// //       latitude = position.latitude;
// //       longitude = position.longitude;
// //     }
// //     catch(e){
// //       print(e);
// //     }
// //   }
// // }
