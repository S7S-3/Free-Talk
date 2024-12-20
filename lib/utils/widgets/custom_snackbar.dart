import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);

  // Declare the overlayEntry variable before using it
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 50, // Adjust the value for desired position
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Automatically remove the overlay after some time (e.g., 3 seconds)
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
