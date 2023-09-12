import "package:flutter/material.dart";

const primaryColor = Color(0xFFFF3B65);
const secondaryColor = Color(0xFFFFFFFF);
const primaryTextColor = Color(0xFF3A3A3A);

final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: primaryColor,
  side: const BorderSide(
    color: primaryColor,
    width: 1.5,
  ),
  textStyle: const TextStyle(fontWeight: FontWeight.w600),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  elevation: 0,
  textStyle: const TextStyle(fontWeight: FontWeight.w600),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
);
