import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.label, required this.content});
  final String label, content;

  @override
  Widget build(BuildContext context) {
    TextStyle style = Styles.textStyle20.copyWith(
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.secondary,
    );
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$label :', style: style),
          const SizedBox(height: 10),
          Text(content, style: style.copyWith(fontSize: 22)),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
