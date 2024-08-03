import 'package:flutter/material.dart';
import 'package:superpoupa_b2b_ui_components/src/helpers/enums.dart';
import 'package:superpoupa_b2b_ui_components/src/helpers/screen_definer.dart';

class SuperPoupaB2BDropdown extends StatelessWidget {
  final String labelText;
  final List<String> values;
  final String selectedValue;
  final Function(String?) onSelect;

  const SuperPoupaB2BDropdown({
    super.key,
    required this.labelText,
    required this.values,
    required this.selectedValue,
    required this.onSelect,
  });

@override
  Widget build(BuildContext context) {
    final ScreenSize screenSize = ScreenDefiner.define(context);

    return SizedBox(
      height: screenSize == ScreenSize.xlarge ? 50 : 60,
      child: FormField<String>(
        initialValue: '',
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isDense: true,
                onChanged: onSelect,
                items: values.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}