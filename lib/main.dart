import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';
import 'package:flutter_app/screens/student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String baslikmesaz = "SELİM TANTUNİ";

 Student selectedStudent = Student.withId(0, "","", 0);

  List<Student> students = [new
    Student.withId(1,"Talha", "Yücel", 100),
    Student.withId(2,"Fatih", "Afsin", 45),
    Student.withId(3,"Berk", "Bozdağ", 12),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(baslikmesaz),
        ),
        body: buildBody(context));
  }


  void mesajgoster(BuildContext context, String mesaje) {
    var allert = AlertDialog(
      title: Text("İşlem Yapıldı"),
      content: Text(mesaje),
    );
    showDialog(context: context, builder: (BuildContext context) => allert);
  }

  Widget buildBody(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2021/01/15/17/01/green-5919790_960_720.jpg"),
                  ),
                  title: Text(students[index].firstName + " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not : " +
                      students[index].grade.toString() +
                      "[" + students[index].getStatus + "]"),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });
                    print(selectedStudent);
                  },
                );
              })),
      Text("Seçili Öğrenci " + selectedStudent.firstName ),
      Row(children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: RaisedButton(
            color: Colors.cyanAccent,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                Expanded(child: Text("Yeni Öğrenci")),
                Icon(Icons.add),
              ],
            ),
            onPressed: () {
              //Materail page route bu işin kitabı buymuş
              //navigator push işlemi route ve context aluyor.. mproute bunyn rotası
              // NAVIGATOR komutu bize yeni bir form sayfası açmamıza yarıyor
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
            },
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex:
              2, // ekrana verilen pay, ekranı 3 e bölüp birini veriyor 2 verseydim yarısını verecekti 4te 2
          child: RaisedButton(
            color: Colors.cyan,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Text("Güncelleee"),
                ),
                Icon(Icons.update),
              ],
            ),
            onPressed: () {
              var mesaj = "Güncellendi :" + selectedStudent.firstName;
              mesajgoster(context,mesaj);
            },
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: RaisedButton(
            color: Colors.redAccent,
            child: Row(
              children: <Widget>[
                SizedBox(width: 5.0,),
                Expanded(child: Text("Sil")),
                Icon(Icons.delete),
              ],
            ),
            onPressed: () {

              setState(() {
                students.remove(selectedStudent);
              });
              var mesajjj = "silindi :"  + selectedStudent.firstName;
              mesajgoster(context,mesajjj);

            }
          ),
        ),
      ]),
    ]);
  }
}
