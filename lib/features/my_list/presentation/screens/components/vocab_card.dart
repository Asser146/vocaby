import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';

class VocabCard extends StatelessWidget {
  const VocabCard({
    super.key,
    required this.vocab,
  });
  final Vocab vocab;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Row(
          children: [
            Text(
              "${vocab.artikel} ",
              style: vocab.artikel == artikel[0]
                  ? TextStyles.nounDerStyle
                  : vocab.artikel == artikel[1]
                      ? TextStyles.nounDieStyle
                      : TextStyles.nounDasStyle,
            ),
            Text(vocab.noun, style: TextStyles.nounStyle),
            const Spacer(),
            Text(vocab.arabicTranslation, style: TextStyles.nounStyle),
            SizedBox(width: 3.w),
            // PopupMenuButton for Edit/Delete options
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'delete') {
                  context.read<MyListCubit>().deleteVocab(vocab);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
