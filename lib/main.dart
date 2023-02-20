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

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

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
            subtitle: const Text(
                'Por favor, dedica unos minutos a responder este cuestionario. La información nos sirve para conocer el nivel de satisfacción de los alumnos con la asignatura. Tu respuestas son confidenciales.'),
          ),
          FastAutocomplete<String>(
            name: 'autocomplete',
            labelText: 'Nombre de la asignatura',
            options: const [
              'Taller de sistemas',
              'Base de datos I',
              'Optativo de especialidad',
              'Base de datos II',
              'Consultoria de empresas'
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter asignatura';
              }
              return null;
            },

            //decoration: InputDecoration(
            //  labelText: 'Nombre de la asignatura',
            ////  focusedBorder: OutlineInputBorder(
            //    borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //    borderSide: BorderSide(color: Colors.blue, width: 2.0),
            //  ),
            //),
          ),
          /*FastAutocomplete<String>(
            name: 'autocomplete',
            labelText: 'Profesor que la imparte',
            options: const [
              'Ricardo Mendez',
              'Jenny Morales',
              'Sergio Baltierra',
              'Fabian Tellier'
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter docente';
              }
              return null;
            },
          ),*/
          /*FastAutocomplete<String>(
            name: 'autocomplete',
            labelText: 'Nivel academico',
            options: const [
              '1er semestre',
              '2do semestre',
              '3er semestre',
              '4to semestre',
              '5to semestre',
              '6to semestre',
              '7mo semestre',
              '8vo semestre',
              '9no semestre'
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter semestre';
              }
              return null;
            },
          ),*/
          //FastFormArray<String>(
          //  name: 'form_array',
          //  reorderable: true,
          //  labelText: 'Form Array',
          //  initialValue: const ['One', 'Two', 'Three'],
          //  itemBuilder: (key, index, field) =>
          //      FastFormArrayItem(key, index, field),
          //),

          //const FastSwitch(
          //  name: 'switch',
          //  labelText: 'Switch',
          //  titleText: 'This is a switch',
          //  contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          //),

          const FastDropdown<String>(
            name: 'dropdown',
            labelText: 'Tipo de asignatura',
            items: ['Obligatorio', 'Optativo', 'Ayudantia'],
            initialValue: 'Obligatorio',
          ),
          FastRadioGroup<String>(
            //orientation: BorderRadiusDirectional.horizontal(),
            name: 'radio_group',
            labelText: 'Tipo de asignatura',
            options: const [
              FastRadioOption(text: 'Obligatorio', value: 'option-1'),
              FastRadioOption(text: 'Optativo', value: 'option-2'),
              FastRadioOption(text: 'Ayudantia', value: 'option-3'),
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
                  "Next",
                  style: TextStyle(
                    fontSize: 20.0,
                    //color: Colors.blue,   color letra
                    //backgroundColor: Colors.red, texto subrayado
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Example2App()));
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
