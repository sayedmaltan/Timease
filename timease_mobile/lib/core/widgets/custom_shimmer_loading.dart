import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLoading extends StatelessWidget {
  const CustomShimmerLoading({
    super.key,
    this.itemCount = 10,
     this.height,
  });

  final int itemCount;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height:height?? 80,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
