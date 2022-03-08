import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/global_components/k_text_field.dart';
import 'package:ajapp/views/screens/checkout/checkout_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';
class PaymentCardScreen extends StatefulWidget {
  const PaymentCardScreen({ Key? key }) : super(key: key);

  @override
  _PaymentCardScreenState createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 2,
        leadingIconRequired: true,
        leadingicon: AssetPath.arrow,
        leadiconpress: () => Navigator.pop(context),
        cartIconRequired: false,
        textRequired: true,
        text: "Checkout",
        ),
        body:Column(

          children:[
            Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          KTextField(
                           
                            hintText: 'Card Number',
                            hintColor: KColor.textFieldLabel,
                            textInputType: TextInputType.number,
                            controller: emailController,
                            requiredField: true,
                            topMargin: 4,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: KSize.getWidth(context, 110),
                              child: KTextField(
                              hintText: "CVV",
                              hintColor: KColor.textFieldLabel,
                              textInputType: TextInputType.text,
                              controller: passwordController,
                              requiredField: true,
                              topMargin: 4,
                              
                          ),
                            ),
                            SizedBox(
                              width: KSize.getWidth(context, 110),
                              child: KTextField(
                              hintText: "EX",
                              hintColor: KColor.textFieldLabel,
                              textInputType: TextInputType.text,
                              controller: passwordController,
                              requiredField: true,
                              topMargin: 4,
                          ),
                            ),
                          ],
                        )
                         
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Text("Order Id",style: KTextStyle.bodyText1.copyWith(color: KColor.bodyText1),),
          ] 
        ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: KButton(
          getHeight: KSize.getHeight(context, 56),
          getWidth: KSize.getWidth(context, 300),
          containerColor: KColor.primary,
          kbuttonTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CheckoutScreen()));
          },
          text: "Pay Now",
          txtcolor: KColor.white,
          borderColor: KColor.primary,
        ),
      ),
      
    );
  }
}