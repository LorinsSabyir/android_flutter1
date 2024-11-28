import 'package:android_flutter/components/button.dart';
import 'package:flutter/material.dart';
import 'package:android_flutter/components/textfield.dart';



  class Login extends StatelessWidget{
     Login({super.key});

    //text editing controller
    final userController = TextEditingController();
    final passController = TextEditingController();

    //Login User Button method
    void loginUser(){

    }


    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(height: 50),
              //logo
        Icon(
          Icons.lock,
          size: 100,
          ),
          SizedBox(height: 50),

        //welcomeback
        Text(
          'Hello! Welcome Back',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18,
          ),
          ),
        SizedBox(height: 50),

      //username textfield
        MyTextField(
          controller: userController,
          hintText: 'Username',
          obscureText: false,
        ),
        SizedBox(height: 20),

        //password textfield
        MyTextField(
          controller: passController,
          hintText:'Password',
          obscureText: true,
          ),
         SizedBox(height: 15),

        //forgot password
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forget Password?',
                style: TextStyle(color: Colors.grey[700]),
                ),
            ],
          ),
        ),
        SizedBox(height: 30),

        //sign in button
        Button(onTap: loginUser,),
        SizedBox(height: 30),

        // register
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't Have an Account?"),
            const SizedBox(width: 6),
            Text(
              "Sign Up",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)
              )
          ],
        )

          ],)
        )
        )
      );
    }
  }