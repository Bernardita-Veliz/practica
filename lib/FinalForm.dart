import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_floc/flutter_floc.dart';
//import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:flutter_fast_forms_example/form_array_item.dart';

//import 'custom_form_field.dart';

import 'package:flutter_fast_forms/FormPage.dart';
import 'config/palette.dart';
import 'main.dart';

void main() => runApp(const Example3App());

class Example3App extends StatelessWidget {
  const Example3App({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Fast Forms Example';

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        return CupertinoApp(
          title: title,
          home: FormPage(title: title),
        );

      case TargetPlatform.android:
      default:
        return MaterialApp(
          title: title,
          theme: ThemeData(
            primarySwatch: Palette.kToDark,
            primaryColor: Colors.grey[900],
            accentColor: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FormPage(title: title),
        );
    }
  }
}

class FormPage extends StatelessWidget {
  FormPage({super.key, required this.title});

  final formKey = GlobalKey<FormState>();
  final String title;
  final _formKey = GlobalKey<FormState>();
  //void onSubmitting() async {
  //  try {
  //    await Future<void>.delayed(const Duration(milliseconds: 500));
  //    emitSuccess(canSubmitAgain: true);
  //  } catch (e) {
  //    emitFailure();
  //  }
  //}

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text(title)),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FastForm(
                    adaptive: true,
                    formKey: formKey,
                    children: _buildCupertinoForm(context),
                    onChanged: (value) {
                      // ignore: avoid_print
                      print('Form changed: ${value.toString()}');
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Reset'),
                    onPressed: () => formKey.currentState?.reset(),
                  ),
                ],
              ),
            ),
          ),
        );

      case TargetPlatform.android:
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FastForm(
                    formKey: formKey,
                    children: _buildForm(context),
                    onChanged: (value) {
                      // ignore: avoid_print
                      print('Form changed: ${value.toString()}');
                    },
                  ),
                  /*ElevatedButton(
                    child: const Text('Reset'),
                    onPressed: () => formKey.currentState?.reset(),
                  ),*/
                ],
              ),
            ),
          ),
        );
    }
  }

  List<Widget> _buildForm(BuildContext context) {
    return [
      FastFormSection(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        header: const Padding(
          padding: EdgeInsets.all(12.0),
          //child: Text(
          //  'Form Example Section',
          //  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          //),
        ),
        children: [
          ListTile(
            // selectedTileColor: Color.fromARGB(255, 150, 150, 150),
            selectedColor: Colors.black,
            selected: true,
            subtitle:
                const Text('Muchas gracias por responder el cuestionario.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  "submit",
                  style: TextStyle(
                    fontSize: 20.0,
                    //color: Colors.blue,   color letra
                    //backgroundColor: Colors.red, texto subrayado
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExampleApp()));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20.0,
                    //color: Colors.blue,   color letra
                    //backgroundColor: Colors.red, texto subrayado
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExampleApp()));
                },
              ),
            ],
          ),
          /*ElevatedButton(
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Example2App()));
              }),*/
        ],
      ),
    ];
  }

  List<Widget> _buildCupertinoForm(BuildContext context) {
    return [
      FastFormSection(
        adaptive: true,
        insetGrouped: true,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        header: const Text('Form Example Section'),
        children: [
          const FastTextField(
            name: 'text_field',
            labelText: 'Text Field',
            placeholder: 'Placeholder',
            helperText: 'Helper Text',
          ),
          const FastSwitch(
            name: 'switch',
            labelText: 'Remind me on a day',
          ),
          FastDatePicker(
            name: 'datepicker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
            labelText: 'Datepicker',
            showModalPopup: true,
          ),
          FastSegmentedControl<String>(
            name: 'segmented_control',
            labelText: 'Class',
            children: const {
              'economy': Text('Economy'),
              'business': Text('Business'),
              'first': Text('First'),
            },
          ),
          FastSlider(
            name: 'slider',
            min: 0,
            max: 10,
            prefixBuilder: (field) {
              return CupertinoButton(
                padding: const EdgeInsets.only(left: 0),
                onPressed: field.widget.enabled
                    ? () => field.didChange(field.widget.min)
                    : null,
                child: const Icon(CupertinoIcons.volume_mute),
              );
            },
            suffixBuilder: (field) {
              return CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: field.widget.enabled
                    ? () => field.didChange(field.widget.max)
                    : null,
                child: const Icon(CupertinoIcons.volume_up),
              );
            },
            helperBuilder: (FormFieldState<double> field) {
              return const DefaultTextStyle(
                style: TextStyle(
                  color: CupertinoColors.black,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 6.0),
                  child: Text('This is a help text'),
                ),
              );
            },
            validator: (value) => value! > 8 ? 'Volume is too high' : null,
          ),
          FastDatePicker(
            name: 'timepicker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
            labelText: 'TimePicker',
            mode: CupertinoDatePickerMode.time,
          ),
        ],
      ),
    ];
  }
}
