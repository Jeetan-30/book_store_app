import 'package:bookstore/Constant/constant_file.dart';
import 'package:bookstore/data/user_data.dart';
import 'package:bookstore/model/user_model.dart';
import 'package:bookstore/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Registration successful'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();
  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Registration", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// First Name
                TextFormField(
                  controller: _firstName,
                  decoration: InputDecoration(
                    label: Text(" Name"),
                    hintText: " Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter first name";
                    }
                  },
                ),

                SizedBox(height: 30,),

                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Enter your email",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    // suffix: Icon(Icons.email_outlined),
                    // suffixIcon: Icon(Icons.abc),
                    // prefix: Icon(Icons.abc),
                    // prefixIcon: Icon(Icons.abc)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter email";
                    }
                    if (!value.contains("@")) {
                      return "Enter correct email";
                    }
                  },
                ),

                SizedBox(height: 30,),

                TextFormField(

                  controller: _phoneNo,
                  decoration: InputDecoration(
                    label: Text(" Contact"),
                    hintText: " Contact",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter first Contact";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// Password
                TextFormField(
                  controller: _password,
                  obscureText: isObs,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Enter your password",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        isObs = !isObs;
                        setState(() {

                        });
                      },
                      icon:  Icon(Icons.visibility),
                    ),
                    // suffixIcon: Icon(Icons.abc),
                    // prefix: Icon(Icons.abc),
                    // prefixIcon: Icon(Icons.abc)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 digits/char";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// Re-password
                TextFormField(
                  controller: _rePassword,
                  obscureText: isObs,
                  decoration: customDecoration(
                      "Re enter the pass",
                      Icon(Icons.visibility)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    if (value != _password.text.toString()) {
                      return "Password does not match";
                    }
                  },
                ),
                Gap(25),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  color: Color(0xff00b4d8),
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      userdata.add(
                        Register(
                          name: _firstName.text.toString(),
                          email: _email.text.toString(),
                          password: _password.text.toString(),
                          phoneNo: _phoneNo .text.toString(),
                        ),
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => SignInPage()),
                      );
                    }
                  },
                  child: Text(
                    "Sign Up!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(20),
                Text('Sign up using', style: myStyle(15,Colors.black,FontWeight.bold)),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.facebook, color: Colors.blue,),),
                    Gap(15),
                    IconButton(onPressed: () {}, icon: Icon(Icons.telegram, color: Colors.blue,),),
                  ],
                ),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration customDecoration(String hint, Icon icon) {
    return InputDecoration(
      label: Text(hint),
      hintText: hint,
      // hintStyle: TextStyle(color: Colors.purple)
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      suffix: IconButton(
        onPressed: () {
          setState(() {
            isObs = !isObs;
          });
        },
        icon: icon,
      ),
    );
  }
}
