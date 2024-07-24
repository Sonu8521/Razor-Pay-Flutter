import 'package:flutter/material.dart';
import 'razorpay_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final RazorpayService _razorpayService = RazorpayService();

  @override
  void initState() {
    super.initState();
    _razorpayService.init();
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }

  void _startPayment() {
    _razorpayService.openCheckout(500, 'example@domain.com', '1234567890');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay Integration'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _startPayment,
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}
