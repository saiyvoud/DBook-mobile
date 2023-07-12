import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dbook_project/Provider/Auth/AuthService.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Forget_Password.dart';
import 'formregister.dart';

class Form_Login extends StatefulWidget {
  static const routeName = "/formlogin_screen";
  @override
  State<Form_Login> createState() => _Form_LoginState();
}

class _Form_LoginState extends State<Form_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade300,
        body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child:
                Consumer<AuthServiceProvider>(builder: (context, Auth, child) {
              return SingleChildScrollView(
                child: Form(
                  key: Auth.formKey,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 140,
                          height: 140,
                          child: Image.asset('assets/images/dbook.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "ດີບຸກ",
                              style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            )),
                        SizedBox(
                          height: 60,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "020 ເບີໂທ",
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            border: OutlineInputBorder(),
                          ),
                          controller: Auth.phoneLoginController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "phone is required";
                            } else if (value.length == 8) {
                              return null;
                            }
                            return "phone not match 8";
                          },
                          //controller: VertifyLogin.phoneNumber,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "ລະຫັດຜ່ານ",
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            border: OutlineInputBorder(),
                          ),
                          controller: Auth.passwordLoginController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 180),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Forget_Password()),
                                  );
                                },
                                child: Text(
                                  "ລືມລະຫັດຜ່ານ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.lightBlue[900],
                                  ),
                                ))),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 120),
                          width: 180,
                          height: 60,
                          child: FloatingActionButton(
                              backgroundColor: Colors.lightBlue[900],
                              child: Text(
                                "ເຂົ້າສູ່ລະບົບ",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () {
                                Auth.Login(context);
                                if (Auth.loading == true) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 100,
                                          child: SimpleDialog(
                                            // title: Text('ແຈ້ງເຕືອນ'),

                                            title: Column(
                                              children: [
                                                CircularProgressIndicator(),
                                                SizedBox(height: 10),
                                                Text('loading ...'),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: 'ແຈ້ງເຕືອນ',
                                    desc: 'ເບີໂທ ຫລື ລະຫັດຂອງທ່ານບໍ່ຖືກຕ້ອງ',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  )..show();
                                }
                              }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 40),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Form_Regester()),
                                  );
                                },
                                child: Text(
                                  "ຍັງບໍ່ມີບັນຊີເທື່ອບໍ? ລົງທະບຽນ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Colors.lightBlue[900],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
