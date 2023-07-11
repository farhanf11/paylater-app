import 'package:flutter/material.dart';
import 'package:paylater/user/TransferBank.dart';

import '../components/profileComponent/buttonProfile.dart';
import '../components/profileComponent/dataButton.dart';
import '../profile_page/helpCenter.dart';

class PaymentMethode extends StatelessWidget {
  const PaymentMethode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3E9EB),
      appBar: AppBar(
        title: const Text('Payment Methode'),
        leading: const BackButton(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          height: 188,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              MaterialButton(
                color: Colors.white,
                child: ButtonProfile(DataButton(
                  id: 5,
                  icon1: Icons.help,
                  text1: 'Help Center',
                  text2: 'Get the best answer of your question',
                  icon2: Icons.arrow_right_outlined,
                )),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TransferBank())),
              ),
              Text('BRI'),
              Text('BNI'),
              Text('BTN'),
              Text('BSI'),
            ],
          ),
        ),
      ),
    );
  }
}
