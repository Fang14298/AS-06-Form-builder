import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Map<String, dynamic> formData;
  const ResultPage({super.key, required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ข้อมูลที่กรอก')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        children: formData.entries.map((entry) {
          String title;
          String subtitle;
          if (entry.key == 'name') {
            title = 'ชื่อ';
            subtitle = entry.value?.toString() ?? '';
          } else if (entry.key == 'email') {
            title = 'อีเมล';
            subtitle = entry.value?.toString() ?? '';
          } else if (entry.key == 'phone') {
            title = 'เบอร์โทรศัพท์';
            subtitle = entry.value?.toString() ?? '';
          } else if (entry.key == 'gender') {
            title = 'เพศ';
            subtitle = entry.value?.toString() ?? '';
          } else if (entry.key == 'accept_terms') {
            title = 'ยอมรับเงื่อนไขการใช้งาน';
            subtitle = (entry.value == true) ? 'ตกลง' : 'ไม่ตกลง';
          } else if (entry.key == 'hobbies') {
            title = 'งานอดิเรก';
            subtitle = (entry.value is List && entry.value.isNotEmpty)
              ? (entry.value as List).join(', ')
              : '-';
          } else if (entry.key == 'favorite_color') {
            title = 'สีที่ชอบ';
            subtitle = entry.value?.toString() ?? '';
          } else if (entry.key == 'subscribe') {
            title = 'สมัครรับข่าวสาร';
            subtitle = (entry.value == true) ? 'สมัคร' : 'ไม่สมัคร';
          } else if (entry.key == 'age') {
            title = 'อายุ';
            subtitle = '${entry.value ?? ''} ปี';
          } else if (entry.key == 'score') {
            title = 'คะแนน';
            subtitle = entry.value?.toString() ?? '';
          } else if (entry.key == 'range_slider') {
            title = 'คะแนนช่วง';
            if (entry.value is RangeValues) {
              final range = entry.value as RangeValues;
              subtitle = 'ตั้งแต่ ${range.start.toInt()} ถึง ${range.end.toInt()}';
            } else {
              subtitle = entry.value?.toString() ?? '';
            }
          } else if (entry.key == 'dob' && entry.value is DateTime) {
            final date = entry.value as DateTime;
            title = 'วันเกิด (วันและเวลา)';
            subtitle = 'วันที่: ${date.day}/${date.month}/${date.year}\nเวลา: ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
          } else if (entry.key == 'date_range' && entry.value != null) {
            title = 'ช่วงวันที่';
            if (entry.value is List && entry.value.length == 2 && entry.value[0] is DateTime && entry.value[1] is DateTime) {
              final start = entry.value[0] as DateTime;
              final end = entry.value[1] as DateTime;
              subtitle = 'ตั้งแต่ ${start.day}/${start.month}/${start.year} ถึง ${end.day}/${end.month}/${end.year}';
            } else {
              subtitle = entry.value.toString();
            }
          } else if (entry.key == 'note') {
            title = 'หมายเหตุ';
            subtitle = entry.value?.toString() ?? '';
          } else {
            title = entry.key;
            subtitle = entry.value?.toString() ?? '';
          }
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: Text(title, style: TextStyle(color: Colors.pink[700], fontWeight: FontWeight.bold)),
              subtitle: Text(subtitle),
            ),
          );
        }).toList(),
      ),
    );
  }
}
