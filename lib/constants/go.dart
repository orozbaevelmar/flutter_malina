import 'package:flutter/material.dart';

class Go {
  static to(context, destination,
      {bool lazy = false, Function(dynamic)? hasThen}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );
  }

  static replace(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }
}
