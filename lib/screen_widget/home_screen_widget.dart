import 'package:flutter/material.dart';
import 'package:webapp/service/api_connection_service.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rest = APIConnectionService();
    rest.login();
    return Container();
  }
}
