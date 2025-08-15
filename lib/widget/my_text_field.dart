import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum InputType { text, email, phoneNumber, any }

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.autoDetectLanguage = true,
    this.initialTextDirection = TextDirection.rtl,
    this.inputType = InputType.any,
  });

  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final bool autoDetectLanguage;
  final TextDirection initialTextDirection;
  final InputType inputType;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late TextDirection _textDirection;
  late TextAlign _textAlign;
  late TextInputType _keyboardType;
  late List<TextInputFormatter> _inputFormatters;

  @override
  void initState() {
    super.initState();
    _textDirection = widget.initialTextDirection;
    _textAlign = _getTextAlign(widget.initialTextDirection);
    _updateInputSettings();

    if (widget.autoDetectLanguage) {
      widget.controller.addListener(_updateTextDirection);
    }
  }

  TextAlign _getTextAlign(TextDirection direction) {
    return direction == TextDirection.rtl ? TextAlign.right : TextAlign.left;
  }

  @override
  void dispose() {
    if (widget.autoDetectLanguage) {
      widget.controller.removeListener(_updateTextDirection);
    }
    super.dispose();
  }

  void _updateInputSettings() {
    switch (widget.inputType) {
      case InputType.email:
        _keyboardType = TextInputType.emailAddress;
        _inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9@.-_]')),
        ];
        break;
      case InputType.phoneNumber:
        _keyboardType = TextInputType.phone;
        _inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case InputType.text:
        _keyboardType = TextInputType.text;
        _inputFormatters = [
          FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z0-9 _\u0621-\u063A\u0641-\u064A]'),
          ),
        ];
        break;
      default:
        _keyboardType = TextInputType.text;
        _inputFormatters = [];
        break;
    }
  }

  bool _isTextEnglish(String text) {
    if (text.isEmpty) return false;
    final englishCount = RegExp(r'[a-zA-Z0-9]').allMatches(text).length;
    final arabicCount = RegExp(r'[\u0600-\u06FF]').allMatches(text).length;
    return englishCount > arabicCount;
  }

  void _updateTextDirection() {
    if (!widget.autoDetectLanguage) return;

    final text = widget.controller.text;
    final isEnglish = _isTextEnglish(text);

    if (mounted) {
      setState(() {
        _textDirection = isEnglish ? TextDirection.ltr : TextDirection.rtl;
        _textAlign = _getTextAlign(_textDirection);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color whiteColor = Color(0xFF000000);
    Color? backgroundColor = Colors.grey[200];
    TextStyle style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
    );
    return TextFormField(
      cursorColor: whiteColor,
      controller: widget.controller,
      obscureText: widget.isPassword,
      textDirection: _textDirection,
      textAlign: _textAlign,
      keyboardType: _keyboardType,
      inputFormatters: _inputFormatters,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: style,
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(widget.icon, color: primaryColor),
      ),
    );
  }
}
