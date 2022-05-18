import 'package:flutter/material.dart';

abstract class AppStyleWidget {
  Widget heading(BuildContext context,
          {String text = "",
          Color? color,
          double opacity = 1,
          double txtSize = 15,
          double height = 1,
          int maxLines = 100,
          TextDecoration textDecoration = TextDecoration.none,
          FontWeight weight = FontWeight.w400,
          TextAlign align = TextAlign.left,
          double scale = 1}) =>
      Opacity(
        opacity: opacity,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: align,
          maxLines: maxLines,
          textScaleFactor: scale,
          style: TextStyle(
              decoration: textDecoration,
              height: height,
              fontSize: txtSize,
              color: color,
              fontWeight: weight),
        ),
      );

  PageController controller = PageController(
    initialPage: 0,
  );

  Widget txtFieldContainer(BuildContext context,
          {String hintText = "",
          Function()? onEnable,
          Color color = Colors.black12,
          TextEditingController? controller,
          Color borderColor = Colors.black12,
          Widget? suffixIcon,
          FontWeight hintWeight = FontWeight.w600,
          Widget? prefixIcon,
          int maxLines = 1,
          double borderThickness = 1.0,
          bool obscure = false,
          double hintSize = 12,
          Color hintColor = Colors.black26}) =>
      Row(
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: borderColor,
                        width: borderThickness,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(left: prefixIcon == null ? 10 : 0),
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, prefixIcon == null ? 0.0 : 3.0, 0.0),
                      child: TextField(
                        onTap: onEnable,
                        controller: controller,
                        minLines: maxLines,
                        maxLines: maxLines,
                        obscureText: obscure,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            suffixIcon: suffixIcon,
                            prefixIcon: prefixIcon,
                            border: InputBorder.none,
                            hintText: hintText,
                            hintStyle: TextStyle(
                                color: hintColor,
                                fontWeight: hintWeight,
                                fontSize: hintSize)),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  )))
        ],
      );

  Widget button1(Widget child, double radius,
          {Color color = Colors.blueAccent,
          VoidCallback? onTap,
          Color borColor = Colors.transparent,
          Color shadowColor = Colors.transparent,
          double borderThickness = 0.6}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: child,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: borColor, width: borderThickness),
              boxShadow: [
                BoxShadow(
                    color: shadowColor,
                    blurRadius: 30,
                    spreadRadius: 1,
                    offset: const Offset(0, 30))
              ],
              borderRadius: BorderRadius.circular(radius),
              color: color),
        ),
      );

  Widget hPadding({required Widget child}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      );

  Color hexColor(String color) => Color(int.parse("0xff$color"));

  Widget navigate(
          {required BuildContext context,
          required Widget page,
          required Widget child}) =>
      GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => page)),
        child: child,
      );

  Widget sBox(BuildContext context, double height) =>
      SizedBox(height: MediaQuery.of(context).size.height * height);

  Widget aImage(String name, {double scale = 1, Color? color}) => Image.asset(
        "images/$name.png",
        scale: scale,
        color: color,
      );
}
