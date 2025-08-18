import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({
    super.key,
    required this.hint,
    required this.items,
    required this.getValue,
    this.icon = Icons.error,
  });
  final String hint;
  final List<String> items;
  final IconData icon;
  final Function(String) getValue;

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    Color? backgroundColor = Colors.grey[200];
    TextStyle style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    );
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp);
    String? selectedValue;
    return DropdownButtonFormField2(
      alignment: Alignment.centerRight,
      items: widget.items
          .map(
            (item) => DropdownMenuItem(
              alignment: Alignment.centerRight,
              value: item,
              child: Text(item, style: style2),
            ),
          )
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.getValue(selectedValue ?? '');
      },
      isExpanded: true,
      hint: Text(widget.hint, style: style),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.r),
        ),
        filled: true,
        fillColor: backgroundColor,
      ),
      buttonStyleData: ButtonStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: backgroundColor,
        ),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(widget.icon, color: primaryColor),
      ),
      dropdownStyleData: DropdownStyleData(
        offset: Offset(0, -5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: backgroundColor,
        ),
      ),
    );
  }
}
