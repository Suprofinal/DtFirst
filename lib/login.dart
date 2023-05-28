import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:untitled/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ChangeButton = false;

  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child : Column(
          children: [
            Container(
        width: 400,
        height: 300,
        child: Image.asset("assets/images/headfinal-01.png"),
            ),
            SizedBox(
              width: size.width,
              height: 90,
              child: RiveAnimation.asset("assets/loginanim.riv",
                stateMachines: ["Login Machine"],
                onInit: (artboard){
                controller = StateMachineController.fromArtboard(artboard, "Login Machine");
                if(controller == null) return;
                artboard.addController(controller!);
                isChecking = controller?.findInput("isChecking");
                isHandsUp = controller?.findInput("isHandsUp");
                trigSuccess = controller?.findInput("trigSuccess");
                trigFail = controller?.findInput("trigFail");
                }
              ),

            ),


            TextFieldContainer(

              child: TextField(

                onChanged: (value){
                  if(isHandsUp !=null ){
                    isHandsUp!.change(false);
                  }
                  if(isChecking == null)return;
                  isChecking!.change(true);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.amber,),
                  hintText: "Ex: Rahul001, abby2003",
                  labelText: "Enter Username"
                ),
              ),

            ),
           SizedBox(height: 20,),
           TextFieldContainer(
               child :TextField(
                 onChanged: (value){
                   if(isHandsUp !=null ){
                     isHandsUp!.change(true);
                   }
                   if(isChecking == null)return;
                   isChecking!.change(false);
                 },
                 obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock,color: Colors.amber,),
                    hintText: "Minimum 6 character",
                    labelText: "Enter Password"
                ),
              ),
           ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child : const Text(
                "Forgot Password?",
                textAlign: TextAlign.right,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            InkWell(
                onTap: () async{
                  setState(() {
                    ChangeButton= true;

                  }
                  );

                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, myRoute.HomeRoute);
                  await Navigator.pushNamed(context, myRoute.HomeRoute);
                  setState(() {
                    ChangeButton = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds:1),
                  width: ChangeButton? 50 : 100,
                  height: 50,

                  alignment: Alignment.center,

                  child: ChangeButton? Icon(Icons.done) : Text(
                    "Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18,),
                  ),
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(ChangeButton? 50 :10),
                    color: Colors.amber,
                    //shape: ChangeButton? BoxShape.circle : BoxShape.rectangle,

                  ),
                )


            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 35,
              width: size.width,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                      "Don't have account?"
                  ),
                  TextButton(
                      onPressed : ()
                      {
                        Navigator.pushNamed(context, myRoute.SignupRoute);
                      },
                      child: const Text(
                          "Register Here",

                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 15,
                        ),
                      ),
                  ),

                ],

              ),
            ),
            Container(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                   Text(
                      "Are you an admin?"
                  ),
                  TextButton(
                    onPressed : ()
                    {

                    },
                    child: const Text(
                      "Click Here",

                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],


              ),
            ),
          ],

      ),
      ),


    );

  }


}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Container(
      //width: 330,

      width: size.width *0.9,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const[BoxShadow(
          blurRadius: 10,
          color: Colors.grey,
          offset: Offset(0, 5),
        )
        ]
      ),
      child: child,
    );
  }
}
