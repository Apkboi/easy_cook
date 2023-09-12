import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CookingTimeDuration extends StatefulWidget {
  const CookingTimeDuration({Key? key}) : super(key: key);

  @override
  State<CookingTimeDuration> createState() => _CookingTimeDurationState();
}

class _CookingTimeDurationState extends State<CookingTimeDuration> {
  var selectedRange = const RangeValues(5, 15);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by cooking time',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        SliderTheme(
          data: SliderThemeData(
            thumbShape: SliderComponentShape.noThumb
          ),
          child: RangeSlider(

            onChangeStart: (val){

            },
            values: selectedRange,
            onChanged: (val) {
              setState(() {
                selectedRange = val;
              });
            },
            min: 5,
            max: 120,
          ),
        ),
        const SizedBox(height: 16,),

        Center(child:  Text('${selectedRange.start.round()} - ${selectedRange.end.round()} minutes',style: Theme.of(context).textTheme.titleLarge,)),
        const SizedBox(height: 16,),

        CustomButton(child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Apply filter'),
            SizedBox(width: 10,),
            Icon(FluentIcons.options_20_regular)
          ],
        ), onPressed: () {

          context.router.pop(true);
        }),
        const SizedBox(height: 16,),

      ],
    );
  }
}
