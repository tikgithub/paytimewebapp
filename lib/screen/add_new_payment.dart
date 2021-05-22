import 'package:flutter/material.dart';
import 'package:webapp/service/api_connection_service.dart';

class AddNewPayment extends StatefulWidget {
  @override
  _AddNewPaymentState createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<AddNewPayment> {
  @override
  Widget build(BuildContext context) {
    var rest = APIConnectionService();
    rest.login();
    return Container(
      child: Text('Add new payment'),
    );
  }
}
