import 'package:chat_realtime/config/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final Function()? onTap;
  ButtonDefault({required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return  Container(
      width: _size.width,
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith<double>(
                (state) => 2,
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                (state) => TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor:  MaterialStateProperty.resolveWith<Color>(
                  (state) {
                if(state.contains(MaterialState.disabled)){
                  return Colors.grey.withOpacity(0.2);
                }
                return MyTheme.accentColor;
              }
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (state) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(color: Colors.white)
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
