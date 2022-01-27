import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/custom_dropdown_button.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/custom_slidable.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/filepicker_method.dart';

class CustomVerticalStepper extends StatefulWidget {
  const CustomVerticalStepper();

  @override
  _CustomVerticalStepperState createState() => _CustomVerticalStepperState();
}

class _CustomVerticalStepperState extends State<CustomVerticalStepper> {
  int _stepperIndex = 0;

  ///TODO change this to real content
  List<Widget> get _exampleList => [
        CustomSlidable(
          onDelete: () {},
          onHide: () {},
          child: ListTile(
            tileColor: Colors.blue,
            title: const Text('Test SlideAble'),
            onTap: _getData,
          ),
        ),
        const CustomDropdownButton(
          title: 'Select Something',
          value: null,
          categories: ['Opt1', 'Opt2', 'Opt3'],
        ),
        const SizedBox(),
      ];

  Future<void> _getData() async {
    final PlatformFile? _file = await filePicker();
    if (_file != null) {
      // ignore: avoid_print
      print(_file.name);
      // ignore: avoid_print
      print(_file.path);
      // ignore: avoid_print
      print(_file.bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(onSurface: Theme.of(context).colorScheme.onBackground),
      ),
      child: Stepper(
        type: StepperType.horizontal,
        physics: const BouncingScrollPhysics(),
        controlsBuilder: _myButtonBuilder,
        onStepTapped: _onStepTapped,
        onStepContinue: _onStepContinue,
        onStepCancel: _onStepCancel,
        currentStep: _stepperIndex,
        steps: stepBuilder(),
      ),
    );
  }

  List<Step> stepBuilder() {
    return _exampleList.map<Step>((Widget _widget) {
      return Step(
        isActive: _stepperIndex == _exampleList.indexOf(_widget),
        state: _stepperIndex > _exampleList.indexOf(_widget)
            ? StepState.complete
            : StepState.indexed,
        //hide title
        title: const SizedBox.shrink(),
        content: _widget,
      );
    }).toList();
  }

  void _onStepTapped(int index) {
    setState(() {
      _stepperIndex = index;
    });
  }

  void _onStepContinue() {
    setState(() {
      _stepperIndex += 1;
    });
  }

  void _onStepCancel() {
    setState(() {
      _stepperIndex -= 1;
    });
  }

  Widget _myButtonBuilder(context, controlsDetails) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_backButton(), _nextButton()],
      ),
    );
  }

  Widget _nextButton() {
    //change button style on last step
    if (_stepperIndex == _exampleList.length - 1) {
      return TextButton(
        onPressed: _onStepContinue,
        child: const Text('Preview'),
      );
    } else {
      return TextButton(
        onPressed: _onStepContinue,
        child: const Text('Next'),
      );
    }
  }

  Widget _backButton() {
    //hide back button on first step
    if (_stepperIndex == 0) {
      return const SizedBox.shrink();
    } else {
      return TextButton(
        onPressed: _onStepCancel,
        child: const Text('Back'),
      );
    }
  }
}
