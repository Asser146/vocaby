import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
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
                if (value == 'edit') {
                  // context.read<MyListCubit>().selectVocab(vocab);
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return EditDialog(vocab: vocab);
                  //   },
                  // );
                } else if (value == 'delete') {
                  context.read<MyListCubit>().deleteVocab(vocab);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                  ),
                ),
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

// class EditDialog extends StatelessWidget {
//   const EditDialog({
//     super.key,
//     required this.vocab,
//   });
//   final Vocab vocab;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 100.h),
//       child: Dialog(
//         backgroundColor: const Color.fromARGB(255, 230, 228, 221),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text("Change Artikel", style: TextStyles.nounStyle),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white, // Background color
//                         borderRadius: BorderRadius.circular(8.r),
//                         border: Border.all(
//                           color: ColorsManager.thirdColor, // Border color
//                           width: 2.w,
//                         ),
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 10.w),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           value: context.watch<MyListCubit>().currentArtikel,
//                           iconSize: 30.sp,
//                           items: artikel.map((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value,
//                                   style: TextStyles.getArtikleStyle(value)),
//                             );
//                           }).toList(),
//                           onChanged: (String? value) {
//                             context.read<MyListCubit>().editArtikel(value!);
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
