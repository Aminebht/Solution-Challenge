// my_data_adapter.dart
import 'package:hive/hive.dart';
import 'my_data.dart';

class MyDataAdapter extends TypeAdapter<MyData> {
  @override
  final int typeId = 1; // Provide a unique identifier for your type

  @override
  MyData read(BinaryReader reader) {
    return MyData(
      userId: reader.readString(),
      userScores: Map<String, int>.from(reader.readMap()),
      keepMeSignedIn: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, MyData obj) {
    writer.writeString(obj.userId);
    writer.writeMap(obj.userScores);
    writer.writeBool(obj.keepMeSignedIn);
  }
}

Future<void> addDataToDatabase(MyData newData) async {
  var box = await Hive.openBox('testBox');
  await box.add(newData);
}
