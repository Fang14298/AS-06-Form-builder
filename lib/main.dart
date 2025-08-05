import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FormBuilder Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink[50],
        cardColor: Colors.pink[100],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.pink,
            side: const BorderSide(color: Colors.pinkAccent),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.pink[50],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('กรอกข้อมูล')), 
      body: Container(
        color: Colors.pink[50],
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.pink[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text('🐰 ฟอร์มกรอกข้อมูล 🩷', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink)),
                      ),
                      const SizedBox(height: 20),
                      Divider(thickness: 2, color: Colors.pinkAccent),
                      const SizedBox(height: 10),
                      const Text('🎗️ ข้อมูลส่วนตัว', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.pink)),
                      const SizedBox(height: 12),
                      FormBuilderTextField(
                        name: 'name',
                        decoration: const InputDecoration(labelText: 'ชื่อ'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(2),
                        ]),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderTextField(
                        name: 'email',
                        decoration: const InputDecoration(labelText: 'อีเมล'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderTextField(
                        name: 'phone',
                        decoration: const InputDecoration(labelText: 'เบอร์โทรศัพท์'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.minLength(9),
                        ]),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 12),
                      FormBuilderDropdown(
                        name: 'gender',
                        decoration: const InputDecoration(labelText: 'เพศ'),
                        items: const [
                          DropdownMenuItem(value: 'ชาย', child: Text('ชาย')),
                          DropdownMenuItem(value: 'หญิง', child: Text('หญิง')),
                          DropdownMenuItem(value: 'อื่นๆ', child: Text('อื่นๆ')),
                        ],
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 20),
                      Divider(thickness: 2, color: Colors.pinkAccent),
                      const SizedBox(height: 10),
                      const Text('🎀 ความสนใจ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.pink)),
                      const SizedBox(height: 12),
                      FormBuilderCheckbox(
                        name: 'accept_terms',
                        initialValue: false,
                        title: const Text('ยอมรับเงื่อนไขการใช้งาน'),
                        validator: FormBuilderValidators.equal(true, errorText: 'กรุณายอมรับเงื่อนไข'),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderCheckboxGroup<String>(
                        name: 'hobbies',
                        decoration: const InputDecoration(labelText: 'งานอดิเรก'),
                        options: [
                          FormBuilderFieldOption(value: 'อ่านหนังสือ'),
                          FormBuilderFieldOption(value: 'เล่นกีฬา'),
                          FormBuilderFieldOption(value: 'ท่องเที่ยว'),
                          FormBuilderFieldOption(value: 'เล่นเกม'),
                        ],
                        validator: FormBuilderValidators.minLength(1, errorText: 'เลือกอย่างน้อย 1 งานอดิเรก'),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderRadioGroup<String>(
                        name: 'favorite_color',
                        decoration: const InputDecoration(labelText: 'สีที่ชอบ (Radio)'),
                        options: [
                          'แดง', 'น้ำเงิน', 'เขียว', 'เหลือง'
                        ].map((color) => FormBuilderFieldOption(value: color)).toList(),
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderSwitch(
                        name: 'subscribe',
                        title: const Text('สมัครรับข่าวสาร'),
                        initialValue: false,
                      ),
                      const SizedBox(height: 20),
                      Divider(thickness: 2, color: Colors.pinkAccent),
                      const SizedBox(height: 10),
                      const Text('📝 ข้อมูลเพิ่มเติม', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.pink)),
                      const SizedBox(height: 12),
                      FormBuilderSlider(
                        name: 'age',
                        min: 0.0,
                        max: 100.0,
                        initialValue: 18.0,
                        divisions: 100,
                        decoration: const InputDecoration(labelText: 'อายุ'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.min(1),
                          FormBuilderValidators.max(100),
                        ]),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderSlider(
                        name: 'score',
                        min: 0.0,
                        max: 100.0,
                        initialValue: 50.0,
                        divisions: 20,
                        decoration: const InputDecoration(labelText: 'คะแนน'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.min(0),
                          FormBuilderValidators.max(100),
                        ]),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderRangeSlider(
                        name: 'range_slider',
                        min: 0.0,
                        max: 100.0,
                        initialValue: const RangeValues(20, 80),
                        divisions: 20,
                        decoration: const InputDecoration(labelText: 'คะแนนช่วง (RangeSlider)'),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderDateTimePicker(
                        name: 'dob',
                        inputType: InputType.both,
                        decoration: const InputDecoration(labelText: 'วันเกิด (วันและเวลา)'),
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderDateRangePicker(
                        name: 'date_range',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        decoration: const InputDecoration(labelText: 'ช่วงวันที่'),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderTextField(
                        name: 'note',
                        decoration: const InputDecoration(labelText: 'หมายเหตุ'),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 140,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.favorite),
                              label: const Text('ส่งข้อมูล', style: TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () {
                                if (_formKey.currentState?.saveAndValidate() ?? false) {
                                  final data = _formKey.currentState!.value;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultPage(formData: data),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.refresh),
                              label: const Text('รีเซ็ต', style: TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () {
                                _formKey.currentState?.reset();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ...existing code...
