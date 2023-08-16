import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dbook_project/Provider/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Update_Information_Customer extends StatefulWidget {
  static const routeName = "/Update_Information_Customer";
  @override
  State<Update_Information_Customer> createState() =>
      _Update_Information_CustomerState();
}

class _Update_Information_CustomerState
    extends State<Update_Information_Customer> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false)..getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
        ),
        backgroundColor: Colors.orange.shade50,
        body: Consumer<OrderProvider>(
          builder: (context, address, child) {
            if (address.isLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Form(
              key: address.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "ບໍລິສັດຂົນສົ່ງ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: address.listAddress![0].express,
                            onChanged: (value) => address.express.text = value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ບໍລິສັດຂົນສົ່ງຫ້າມວ່າງ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                labelText: "ບໍລິສັດຂົນສົ່ງ",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "ສາຂາ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            initialValue: address.listAddress![0].branch,
                            onChanged: (value) => address.branch.text = value,
                            // controller: address.branch,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ສາຂາ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                labelText: "ສາຂາ",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "ເບີໂທ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            initialValue:
                                address.listAddress![0].phone.toString(),
                            onChanged: (value) => address.phone.text = value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ເບີໂທຫ້າມວ່າງ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                labelText: "ເບີໂທ",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 300),
                            child: Text(
                              "ຊື່ຜູ້ຮັບ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          //SizedBox(height: 12,),
                          TextFormField(
                            initialValue: address.listAddress![0].name,
                            onChanged: (value) => address.name.text = value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ຊື່ຜູ້ຮັບຫ້າມວ່າງ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                labelText: "ຊື່ຜູ້ຮັບ ",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder()),
                          ),
                          //SizedBox(height: 12,),
                          Text(
                            "ບ້ານ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            initialValue: address.listAddress![0].village,
                            onChanged: (value) => address.village.text = value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ບ້ານຫ້າມວ່າງ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                labelText: "ບ້ານ ",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder()),
                          ),
                          Text(
                            "ເມືອງ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            initialValue: address.listAddress![0].district,
                            onChanged: (value) => address.district.text = value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ເມືອງຫ້າມວ່າງ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                labelText: "ເມືອງ  ",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder()),
                          ),
                          Text(
                            "ແຂວງ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            initialValue: address.listAddress![0].province,
                            onChanged: (value) => address.province.text = value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ແຂວງຫ້າມວ່າງ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white,
                                labelText: "ແຂວງ  ",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder()),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // margin:EdgeInsets.only(left: 120),
                            width: 350,
                            height: 60,
                            child: FloatingActionButton(
                                backgroundColor: Colors.lightBlue[900],
                                child: Text(
                                  "ບັນທຶກ",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () async {
                                  await address.updateAddress(
                                    address_id: address.listAddress![0].id!,
                                    phone: address.phone.text.isEmpty
                                        ? address.listAddress![0].phone
                                            .toString()
                                        : address.phone.text,
                                    name: address.name.text.isEmpty
                                        ? address.listAddress![0].name!
                                        : address.name.text,
                                    village: address.village.text.isEmpty
                                        ? address.listAddress![0].village!
                                        : address.village.text,
                                    district: address.district.text.isEmpty
                                        ? address.listAddress![0].district!
                                        : address.district.text,
                                    province: address.province.text.isEmpty
                                        ? address.listAddress![0].province!
                                        : address.province.text,
                                    express: address.express.text.isEmpty
                                        ? address.listAddress![0].express!
                                        : address.express.text,
                                    branch: address.branch.text.isEmpty
                                        ? address.listAddress![0].branch!
                                        : address.branch.text,
                                  );
                                  if (address.success == true) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.SUCCES,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: 'ສຳເລັດ',
                                      desc: 'ບັນທຶກສຳເລັດ',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {},
                                    )..show();
                                  } else {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.ERROR,
                                      animType: AnimType.RIGHSLIDE,
                                      title: 'ແຈ້ງເຕືອນ',
                                      desc: 'ເກີດບັນຫາໃນການເພີ່ມຂໍ້ມູນ',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {},
                                    )..show();
                                  }

                                  /// -------
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
