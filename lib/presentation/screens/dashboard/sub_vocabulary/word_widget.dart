import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class WordWidget extends StatelessWidget {
  const WordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width * 0.9,
      child: Column(
        children: const [
          Text("Hello"),
          Divider(),
          Text("नमस्कार"),
          Divider(),
          Text("你好"),
          Text("Nǐ hǎo"),
          Text("नि हाओ")
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.WHITE,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }
}
