import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/modes_row.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/vocab_list.dart';

class VocabBody extends StatelessWidget {
  const VocabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: const Column(
        children: [
          ModesRow(),
          VocabList(),
        ],
      ),
    );
  }
}
