### AS-06-Form builder

โปรแกรมนี้เป็นแอปฟอร์มกรอกข้อมูลที่ใช้ Flutter และแพ็กเกจ flutter_form_builder เพื่อสร้างฟอร์มที่มีหลายประเภทข้อมูล พร้อมการตรวจสอบความถูกต้องและแสดงผลข้อมูลที่กรอก

### โครงสร้างหลัก
คลาส StatefulWidget สำหรับสร้างฟอร์มกรอกข้อมูล โดยใช้ widget จาก flutter_form_builder เช่น
  - FormBuilderTextField: กรอกชื่อ, อีเมล, เบอร์โทรศัพท์, หมายเหตุ
  - FormBuilderDropdown: เลือกเพศ
  - FormBuilderCheckbox, FormBuilderCheckboxGroup: ยอมรับเงื่อนไข, เลือกงานอดิเรก
  - FormBuilderRadioGroup: เลือกสีที่ชอบ
  - FormBuilderSwitch: สมัครรับข่าวสาร
  - FormBuilderSlider, FormBuilderRangeSlider: กรอกอายุ, คะแนน, คะแนนช่วง
  - FormBuilderDateTimePicker: เลือกวันเกิด (วันและเวลา)
  - FormBuilderDateRangePicker: เลือกช่วงวันที่
  - มีปุ่มส่งข้อมูลและรีเซ็ตฟอร์ม
  - เมื่อกดส่งข้อมูล จะตรวจสอบความถูกต้องและนำข้อมูลไปแสดงในหน้า ResultPage

#### 3. ResultPage
คลาส StatelessWidget สำหรับแสดงผลข้อมูลที่กรอก โดยแสดงข้อมูลแต่ละฟิลด์เป็นภาษาไทยในรูปแบบที่อ่านง่าย เช่น
  - ชื่อ, อีเมล, เบอร์โทรศัพท์, เพศ, งานอดิเรก, สีที่ชอบ, อายุ, คะแนน, คะแนนช่วง, วันเกิด, ช่วงวันที่, หมายเหตุ ฯลฯ
  - ข้อมูลแต่ละรายการจะแสดงใน Card พร้อม subtitle ที่จัดรูปแบบให้เหมาะสม

### การทำงานโดยรวม
1. ผู้ใช้กรอกข้อมูลในฟอร์มและกด "ส่งข้อมูล"
2. แอปตรวจสอบความถูกต้องของข้อมูล
3. หากข้อมูลถูกต้อง จะนำข้อมูลไปแสดงในหน้า ResultPage โดยแสดงรายละเอียดแต่ละฟิลด์เป็นภาษาไทย
4. สามารถกด "รีเซ็ต" เพื่อเริ่มกรอกใหม่ได้

<img width="255" height="555" alt="1" src="https://github.com/user-attachments/assets/6cb77731-c1f9-4268-a6be-7ba0d04a8561" /> 
<img width="255" height="555" alt="2" src="https://github.com/user-attachments/assets/129a9498-d2ec-4cb7-8d6c-901ea80135d1" />
<img width="255" height="555" alt="3" src="https://github.com/user-attachments/assets/49024668-3cc2-4d82-958f-7b0013d976a8" /> <br>
<img width="255" height="555" alt="4" src="https://github.com/user-attachments/assets/ebf8d704-336e-407b-b5b0-318c7e256e69" />
<img width="255" height="555" alt="5" src="https://github.com/user-attachments/assets/0e269a24-2ef8-489d-8061-017f8e49b4bd" />
<img width="255" height="555" alt="6" src="https://github.com/user-attachments/assets/b09c8b28-4982-491d-9fa7-5af8cfe807b3" />
