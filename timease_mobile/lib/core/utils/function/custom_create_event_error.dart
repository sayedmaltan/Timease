import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;
bool isDisplayed = false;

void showError({
  required BuildContext context,
  required String msg,
  double ?top,
}) {
  if (isDisplayed) {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
  isDisplayed = true;
  _overlayEntry = _createOverlayEntry(msg: msg,top: top);
  Overlay.of(context).insert(_overlayEntry!);

  Future.delayed(Duration(seconds: 3), () {
    _overlayEntry?.remove();
    _overlayEntry = null;
    isDisplayed = false;
  });
}

OverlayEntry _createOverlayEntry({required String msg,double ?top}) {
  return OverlayEntry(
    builder: (context) => Positioned(
      top: top??100,
      right: 42,
      left: 42,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  msg,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  _overlayEntry?.remove();
                  _overlayEntry = null;
                  isDisplayed = false;
                },
                child: Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
