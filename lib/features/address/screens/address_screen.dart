import 'package:clone_of_amazon/common/widgets/custom_button.dart';
import 'package:clone_of_amazon/common/widgets/custom_textformfield.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
// import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "/address";
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _addressFormKey = GlobalKey<FormState>();
  final flatCtrl = TextEditingController();
  final areaCtrl = TextEditingController();
  final pinCodeCtrl = TextEditingController();
  final townCtrl = TextEditingController();

  @override
  void dispose() {
    flatCtrl.dispose();
    areaCtrl.dispose();
    pinCodeCtrl.dispose();
    townCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final address = "No 94 4th street Gopalapuram Tindivanam 604001";
    // final address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          address,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Or",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextformfield(
                      controller: flatCtrl,
                      hintText: 'Flat, House no, Building',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextformfield(
                      controller: areaCtrl,
                      hintText: 'Area, street',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextformfield(
                      controller: pinCodeCtrl,
                      hintText: 'Pincode',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextformfield(
                      controller: townCtrl,
                      hintText: 'Town/City',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: "Pay",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
