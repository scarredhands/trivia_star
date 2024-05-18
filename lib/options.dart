import 'package:flutter/material.dart';

class options extends StatefulWidget {
  String option;

  options({Key? key, required this.option}) : super(key: key);

  @override
  State<options> createState() => _optionsState();
}

class _optionsState extends State<options> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: InkWell(
          onTap: () {},
          child: Container(
              height: 45,
              width: 240,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Colors.cyan)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          widget.option,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ))
      ],
    );
  }
}
