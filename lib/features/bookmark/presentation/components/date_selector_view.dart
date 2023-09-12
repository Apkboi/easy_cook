import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateSelectorView extends StatefulWidget {
  const DateSelectorView({Key? key}) : super(key: key);

  @override
  State<DateSelectorView> createState() => _DateSelectorViewState();
}

class _DateSelectorViewState extends State<DateSelectorView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter Categories',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        SfDateRangePicker(



        minDate: DateTime(2000),
        maxDate: DateTime(2030),
        selectionMode: DateRangePickerSelectionMode.extendableRange,
        view: DateRangePickerView.year,
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) {

        },
        monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
      ),
        const SizedBox(height: 10,),
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
        const SizedBox(
          height: 16,
        ),

      ],
    );
  }
}
