// user_info_widget.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'my_data.dart';

class VisualizationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('testBox'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var box = Hive.box('testBox');

          // Cast Iterable<dynamic> to Iterable<MyData>
          List<MyData> dataList = box.values.cast<MyData>().toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('User ID')),
                DataColumn(label: Text('Keep Me Signed In')),
                DataColumn(label: Text('Subjects')),
              ],
              rows: dataList
                  .map(
                    (data) => DataRow(
                      cells: [
                        DataCell(Text(data.userId)),
                        DataCell(Text(data.keepMeSignedIn.toString())),
                        DataCell(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data.userScores.entries
                                .map(
                                  (entry) =>
                                      Text('${entry.key}: ${entry.value}'),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
