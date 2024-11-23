import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/asstes.dart';

class CustomSignWithGoogle extends StatelessWidget {
  const CustomSignWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsImages.google),
          SizedBox(
            width: 13,
          ),
          Text(
            'Continue with Google',
          ),
        ],
      ),
    );
  }
}
