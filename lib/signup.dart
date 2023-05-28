import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _date = TextEditingController();
  String myAge = "";
  @override
  Widget build(BuildContext context) {
    return Material(
    child: Column(
      children: [
        Image.asset("assets/images/headfinal-01.png"),
        SizedBox(
          width: 300,
        child :Text(
            "Climb just few Steps",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
         // textAlign: TextAlign.left,

        ),
        ),
    Padding(
    padding: const EdgeInsets.symmetric( horizontal: 40),
    child: Column(children: [
    TextFormField(
    decoration: InputDecoration(
    hintText: "Ex: Sonia Agarwal, Ani Chatterjee",
    labelText: "Enter Full Name"

    ),
    onChanged: (value){
    //name = value;
    setState(() {

    });
    },
    ),
      TextFormField(
        decoration: InputDecoration(
            hintText: "Ex: 0123456789",
            labelText: "Enter Phone Number",


        ),
      ),
      TextFormField(
        controller: _date,
        decoration: InputDecoration(
          //hintText: "$myAge",
          labelText: "Enter Date Of Birth",


        ),
       // onChanged:(value){
         // myAge= value;
          //setState(() {

          //});
        //},
        onTap: () async {
          //_date.text = "$myAge";

          DateTime? pickedate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1940), lastDate: DateTime.now());

          if (pickedate != null) {
            setState(() {
                _date.text = DateFormat('yyyy-MM-dd').format(pickedate);
            });
          }
        }

        ),
      TextFormField(
        decoration: InputDecoration(
          hintText: "Ex: 700170",
          labelText: "Enter Pincode/zipcode",


        ),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
      children: [
        Text(
           "choose your",
          style: TextStyle(fontSize: 20),
        ),
          SizedBox(
            width: 5,
          ),
        Text(
            "DREAM",

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
      )


      ],
    ),
    ),
    ],
    ),
    );
  }
  pickdob(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      //if(pickedDate != null){
        calculateAge(pickedDate!);
      //}

    });


  }
  calculateAge(DateTime birth){
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) ~/ 30);
    setState(() {
      myAge = '$years years, $months months, $days days';
    });
  }
}
