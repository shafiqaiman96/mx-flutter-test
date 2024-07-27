import 'utils.dart';

Future<void> initApp() async {
  await HiveHelper().initHive();
}
