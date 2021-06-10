import 'package:catalog/Utilits/route_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var welcomeUser="";
  bool changeButton=false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(

          child: Form(
            child: Column(
              children: [
                Image.asset("assets/images/login.png"),
                SizedBox(height: 30,),
                Text("Let's begin",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                  child: Column(
                    children: [
                      TextFormField(

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          labelText: "User name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0)
                          )
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value){
                          value=welcomeUser;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(

                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12.0),
                            labelText: "User password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0)
                            )
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      InkWell(
                        onTap: () async{
                          setState(() {
                            changeButton=true;
                          });
                          await Future.delayed(Duration(milliseconds: 700));
                          await Navigator.pushNamed(context, MyRoutes.homeRoute);
                          setState(() {
                            changeButton=false;
                          });

                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 700),
                          width: changeButton?45:MediaQuery.of(context).size.width*0.5,
                          height: changeButton?45:35,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: changeButton?BorderRadius.circular(45):BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: changeButton?Icon(Icons.done,color: Colors.white,):Text("Login",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17
                            ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
