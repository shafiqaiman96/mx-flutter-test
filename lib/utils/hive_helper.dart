import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

late ValueListenable<Box<ProductModel>> cartBox;

class HiveHelper {
  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(RatingAdapter());

    await openHiveBox();
  }

  Future<void> openHiveBox() async {
    await Hive.openBox<ProductModel>('cartBox');
    cartBox = Hive.box<ProductModel>('cartBox').listenable();
  }
}
