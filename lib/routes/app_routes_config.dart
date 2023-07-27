///Description: route file for handing the navigation between screens
///we currently have pickup screen, locker box screen, home screen, splash screen

abstract class AppRoutesSettings{
  static late AppRoutesSettings current;
  String get home;
  String get pickupBoxes;
  String get lockScreen;
  String get splashScreen;
}
