import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';
import 'package:flutter_app/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

// State extendi yukarıdaki classtan geliyor,
// statefulwidget olması için böyle gerçekleşti
//with ifadesi inheritence olmuyor ama
// o classta yazılan fonksiyonları bu classta da kullanmamı sağlıyor
class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;

  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //scaffold ile başladım. diğer widgetler flutterdeki widget hiyerarşisinden oluşuyor
      // methodlar ile widget return ederek bu alanları sadeleştirmeliyim....
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        // padding: containter unitleri arasında bosluk bırakır
        child: Form(
          key: formKey,
          //formKeyi yukarıda tanımladım, bu formkey ile formun içine bişeyler gönderip almak mümkün
          //aşağıda bu keyi kullanacağım
          child: Column(
            children: <Widget>[
              buildFirstNameFeild(),
              buildLastNameFeild(),
              buildGradeFeild(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameFeild() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Talha"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameFeild() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Yücel"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeFeild() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "0-100"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
