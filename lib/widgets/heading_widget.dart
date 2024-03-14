import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatefulWidget {
  final String heading;
  final String subHeading;
  final VoidCallback onTap;
  final String buttonName;

  const HeadingWidget(
      {super.key,
      required this.heading,
      required this.subHeading,
      required this.onTap,
      required this.buttonName});

  @override
  State<HeadingWidget> createState() => _HeadingWidgetState();
}

class _HeadingWidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.heading,
                style: const TextStyle(
                  color: AppConstant.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                widget.subHeading,
                style: const TextStyle(
                  color: AppConstant.gray,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppConstant.appSecondryColor,
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.buttonName,
                  style: const TextStyle(
                    color: AppConstant.appSecondryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
