import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floc/flutter_floc.dart';
//import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'FinalForm.dart';
import 'main.dart';

import 'config/palette.dart';
//import 'package:flutter_fast_forms_example/form_array_item.dart';

//import 'custom_form_field.dart';

void main() => runApp(const Example2App());

class Example2App extends StatelessWidget {
  const Example2App({super.key});

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
            title: const Text('Preguntas'),
            //selectedTileColor: Color.fromARGB(253, 218, 41, 28),
            subtitle: const Text(
                '\nPor favor, valora del 1 al 10 (donde 10 es "Totalmente de acuerdo" y 1 es "Totalmente en desacuerdo") las siguientes cuestiones:'),
            selectedColor: Colors.black,
            selected: true,
          ),
          ListTile(
            //selectedTileColor: Colors.green,
            subtitle:
                const Text('\nLa asignatura ha cubierto mis expectativas. -'),
            //selectedColor: Colors.white,
            //selected: true,
          ),
          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          ListTile(
            //selectedTileColor: Colors.green,
            subtitle: const Text(
                '\nLa asignatura ha aumentado mi interés en la materia. '),
            //selectedColor: Colors.white,
            //selected: true,
          ),
          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          ListTile(
            //selectedTileColor: Colors.green,
            subtitle: const Text(
                '\nLa asignatura ha ayudado a completar mi formación. -'),
            //selectedColor: Colors.white,
            //selected: true,
          ),
          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),

          ListTile(
            //selectedTileColor: Colors.green,
            subtitle: const Text(
                '\nLa asignatura muestra una secuencia coordinada de aprendizajes, de desarrollo de habilidades, de destrezas o de competencias. -'),
            //selectedColor: Colors.white,
            //selected: true,
          ),

          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          ListTile(
            //selectedTileColor: Colors.green,
            subtitle: const Text(
                '\nlas actividades prácticas y teóricas de la asignatura se complementan entre si -'),
            //selectedColor: Colors.white,
            //selected: true,
          ),

          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          ListTile(
            //selectedTileColor: Colors.green,
            subtitle: const Text(
                '\nEn general, esta asignatura cumplio con mis expectativas de calidad -'),
            //selectedColor: Colors.white,
            //selected: true,
          ),

          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),

          ListTile(
            //selectedTileColor: Colors.green,
            subtitle: const Text('\nrecomendarias esta asignatura. -'),
            //selectedColor: Colors.white,
            //selected: true,
          ),
          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "next",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Example3App()));
                  }),
            ],
          ),

          //const FastCheckbox(
          //  name: 'checkbox',
          //  labelText: 'Checkbox',
          //  titleText: 'I accept',
          //  contentPadding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
          //),
          //ElevatedButton(
          //    onPressed: StatelessWidget.submit, child: const Text('SUBMIT'))
          /* ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),*/
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
