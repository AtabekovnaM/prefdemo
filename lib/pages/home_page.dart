import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prefdemo/model/user_model.dart';
import 'package:prefdemo/services/pref_service.dart';


class HomePage extends StatefulWidget {

 static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void _doLogin(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(email: email,password: password);
    Prefs.storeUser(user);

  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image(
                width: 250,
                height: 250,
                image: AssetImage('assets/images/ic_img1.jpg'),
              ),
            ),
            Text("Welcome back!",style: TextStyle(color: Colors.black,fontSize:32,fontWeight:FontWeight.w900,),),
            SizedBox(height: 7,),
            Text("Log in to your existant account of Q Allure",style: TextStyle(color: Colors.grey,fontSize: 17,),),
            SizedBox(height: 40,),
            Container(
             margin: EdgeInsets.only(left: 25,right: 20),
             height: 75,
             padding: EdgeInsets.only(left: 15,right: 15,top: 10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
               color: Colors.white
             ),
             child: Container(
              child:TextField(
                 controller: emailController,
                 decoration: InputDecoration(
                     hintText: "E-mail",
                     hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                     hoverColor: Colors.black,
                     border: InputBorder.none,
                     icon: Icon(Icons.account_circle_outlined,color: Colors.grey,)
                 ),
               ),
             ),
           ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 75,
              padding: EdgeInsets.only(left: 15,right: 15,top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white
              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 17),
                    border: InputBorder.none,
                    icon: Icon(Icons.lock_open,color: Colors.grey,)
                ),
              ),
            ),
            SizedBox(height: 7,),
            Container(
              margin: EdgeInsets.only(left: 230),
              child: Text("Forgot Password?",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 35,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 65,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.blue[900],
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FlatButton(
                onPressed: _doLogin,
                child: Text("LOG IN",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text("Or connect using",style: TextStyle(color: Colors.grey,fontSize: 17),),
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue[900],
                        ),
                        child: FlatButton(
                          onPressed: _doLogin,
                          child: Text("Facebook",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width:150 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red,
                        ),
                        child: FlatButton(
                          onPressed: _doLogin,
                          child: Text("Google",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account?",style: TextStyle(color: Colors.black87,fontSize: 17),),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: _doLogin,
                      child: Text("Sign Up",style: TextStyle(color: Colors.blue[700],fontSize: 17,fontWeight: FontWeight.w700),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
