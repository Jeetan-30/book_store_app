import 'package:bookstore/Constant/constant_file.dart';
import 'package:bookstore/data/user_data.dart';
import 'package:bookstore/page/sign_in_page.dart';
import 'package:bookstore/page/spalash_screen.dart';
import 'package:bookstore/page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In",style: myStyle(22,Colors.white,FontWeight.bold),),
        centerTitle: true,
        backgroundColor:primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 70 ,
                  backgroundImage: AssetImage('assets/images/book logo.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                /// First Name
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    label: Text("Email",style: myStyle(18),),
                    hintText: "Email",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter email";
                    }
                    if(value.toString() != userdata[0].email){
                      return "email does not match";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// Password
                TextFormField(
                  controller: _password,
                  obscureText: isObs,
                  decoration: InputDecoration(
                    label: Text("Password",style: myStyle(18),),
                    hintText: "Enter your password",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    suffix: IconButton(
                      onPressed: (){
                        isObs = !isObs;
                        setState(() {

                        });
                      },
                      icon: Icon(Icons.visibility),
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter password";
                    }
                    if(value.length < 8){
                      return "Password must be at least 8 digits/char";
                    }
                    if(value.toString() != userdata[0].password){
                      return "password does not match";
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  color:primaryColor,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate() && _email.text.toString() == userdata[0].email && _password.text.toString() == userdata[0].password){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>SplashScreen1()),(routes)=>false);
                    }
                    else{
                      Text('Wrong email and password');
                    }
                  },
                  child: Text("Log In",style: myStyle(20,Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Forgot Password?',style: myStyle(22,),),
                SizedBox(
                  height: 20,
                ),
                Text('New?',style: myStyle(18,),),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Registration()));
                  },
                  child: Text("Sign Up Now!",style: myStyle(22,Colors.black,FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                    }, icon: Icon(Icons.facebook,color: Colors.blue,),),
                    Gap(15),
                    IconButton(onPressed: (){
                    }, icon: Icon(Icons.telegram_outlined,color: Colors.blue,),),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
