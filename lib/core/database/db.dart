import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;

abstract class AppDB {
  static Future<void> init() async {
    final docsDirectory = await PathProvider.getApplicationDocumentsDirectory();
    Hive.init(docsDirectory.path);
  }

  static void dispose() async {
    await Hive.close();
  }

  static LazyBox getBox(String boxName) {
    final lazyBox = Hive.box(boxName) as LazyBox;
    return lazyBox;
  }

  static Future<void> clear() async {}
}
