import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';

class ExcelService {
  static Future<List<Map<String, String>>> parseBusDetails() async {
    try {
      // Load the Excel file from assets
      ByteData data = await rootBundle.load('assets/ktm_ekm_ksrtc.xlsx');
      final bytes = data.buffer.asUint8List();
      final excel = Excel.decodeBytes(bytes);

      List<Map<String, String>> busDetails = [];
      final timeFormatter = DateFormat('hh:mm a');

      for (var table in excel.tables.keys) {
        if (excel.tables[table] != null) {
          for (var row in excel.tables[table]!.rows.skip(1)) {
            // Extract column values based on the modified Excel structure
            String rawTime = row[0]?.value?.toString() ?? '';  // Updated Time Column
            String busName = row[1]?.value?.toString() ?? '';  // Updated Bus Name Column
            String source = row[2]?.value?.toString() ?? '';   // Updated Source Column
            String destination = row[3]?.value?.toString() ?? '';  // Updated Destination Column
            String route1 = row[4]?.value?.toString() ?? '';
            String route2 = row[5]?.value?.toString() ?? '';// Updated Route Column

            // Convert time format if needed
            String formattedTime;
            try {
              DateTime parsedTime = DateFormat('HH:mm:ss').parse(rawTime);
              formattedTime = timeFormatter.format(parsedTime);
            } catch (e) {
              formattedTime = rawTime; // Keep raw format if parsing fails
            }

            busDetails.add({
              'time': formattedTime,
              'busName': busName,
              'source': source,
              'destination': destination,
              'route1': route1,
              'route2': route2,
            });
          }
        }
      }

      return busDetails;
    } catch (e) {
      print('Error loading bus details: $e');
      return [];
    }
  }
}
