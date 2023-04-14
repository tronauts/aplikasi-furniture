import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/pages/home.dart';
import 'package:uts/pages/home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool visibilityPass = false;

  final String myUser = 'admin';
  final String myPass = 'admin';

  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/wp1.jpg'), fit: BoxFit.cover),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 120, left: 10, right: 10),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Your Future",
                        style: GoogleFonts.notoSans(
                          fontSize: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.25),
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      'Furniture',
                      style: GoogleFonts.notoSans(
                        fontSize: 40,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 5,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Positioned(
                      child: Container(
                        height: 245,
                        width: MediaQuery.of(context).size.width - 40,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(255, 53, 51, 49)
                                      .withOpacity(0.4),
                                  spreadRadius: 7,
                                  blurRadius: 15),
                            ]),
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Text(
                                  'Login',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 20, color: Color.fromARGB(255, 96, 96, 96)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
// Text Field Username
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: cUser,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  hintText: 'Hallo',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
// Text Field Password
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: cPass,
                                obscureText: !visibilityPass,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Masukan Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            visibilityPass = !visibilityPass;
                                          });
                                        },
                                        icon: visibilityPass
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
// Login Button
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF00722C),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF00722C).withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          cekLogin(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00722C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void cekLogin(BuildContext context) {
    if (cUser.text == myUser && cPass.text == myPass) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => home(),
          ));
    } else if (cUser.text.isEmpty || cPass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User dan Password harus di isi'),
          backgroundColor: Color(0xFF00722C),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User atau Password Salah'),
          backgroundColor: Color(0xFF00722C),
        ),
      );
    }
  }
}
