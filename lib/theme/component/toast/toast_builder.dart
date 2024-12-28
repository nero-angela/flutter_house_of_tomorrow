import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class ToastBuilder extends StatefulWidget {
  const ToastBuilder({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<ToastBuilder> createState() => _ToastBuilderState();
}

class _ToastBuilderState extends State<ToastBuilder> {
  bool _isShow = false;

  bool get isShow => _isShow;

  set isShow(bool value) {
    setState(() {
      _isShow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: screenSize.height * 0.25,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: context.color.toastContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: DefaultTextStyle(
            style: context.typo.headline6.copyWith(
              color: context.color.onToastContainer,
            ),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}
