import 'package:flutter/material.dart';

import '../data/strings_data.dart';
import '../model/validator_model.dart';
import '../widgets/drawer_widget.dart';

class FormsScreen extends StatelessWidget {
  static const String routeName = "/forms_screen";

  final _formKey = GlobalKey<FormState>();

  final _passwordFocusNode = FocusNode();
  final _emailIDFocusNode = FocusNode();
  final _mobileNoFocusNode = FocusNode();
  final _dobFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();

  void _saveFormInputs(){

    _formKey.currentState.validate();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forms"),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            autovalidate: true,
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: StringsData.username,
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: _usernameFocusNode,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: StringsData.password,
                  ),
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_mobileNoFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: StringsData.mobileNo,
                  ),
                  focusNode: _mobileNoFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailIDFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: StringsData.emailID,
                  ),
                  focusNode: _emailIDFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_dobFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    return ValidatorModel().validateEmail(value);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: StringsData.dob,
                  ),
                  focusNode: _dobFocusNode,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_){_saveFormInputs();},

                ),

                RaisedButton(child: Text("Save"),onPressed: _saveFormInputs,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
