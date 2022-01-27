import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    required this.title,
    required this.value,
    required this.categories,
    this.onChanged,
  });

  final String title;
  final String? value;
  final List<String> categories;
  final Function(String value)? onChanged;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String? value = widget.value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: _myText(widget.title),
      value: value,
      onChanged: _onChanged,
      validator: _validator,
      decoration: _myDropDownButtonDecoration(),
      iconEnabledColor: Theme.of(context).colorScheme.onPrimary,
      dropdownColor: Theme.of(context).colorScheme.onBackground,
      items: _getItems(),
    );
  }

  List<DropdownMenuItem<String>>? _getItems() {
    return widget.categories.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: _myText(value),
      );
    }).toList();
  }

  //used for color
  Widget _myText(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
    );
  }

  InputDecoration? _myDropDownButtonDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.onBackground,
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(MyConstants.borderRadius),
      ),
    );
  }

  void _onChanged(String? item) {
    if (item != null) {
      widget.onChanged?.call(item);
      setState(() {
        value = item;
      });
    }
  }

  String? _validator(String? value) {
    if (value == null) {
      return 'Please select something';
    }
  }
}
