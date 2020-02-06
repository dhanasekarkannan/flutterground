import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';
import '../providers/forms_provider.dart';
import '../data/strings_data.dart';
import '../providers/validator_model.dart';
import '../widgets/drawer_widget.dart';

class FormsScreen extends StatefulWidget {
  static const String routeName = "/forms_screen";

  @override
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final _formKey = GlobalKey<FormState>();
  var _progress = false;
  bool initCall = true;
  UserDetail  _userDetail;

  final _passwordFocusNode = FocusNode();

  final _emailIDFocusNode = FocusNode();

  final _mobileNoFocusNode = FocusNode();

  final _dobFocusNode = FocusNode();

  final _usernameFocusNode = FocusNode();

  void _saveFormInputs() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _progress = true;
      });
      _formKey.currentState.save();
      FormsProvider().submitUserData(_userDetail).then((value) {
        setState(() {
          _progress = false;
        });
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text(StringsData.alertSuccess,),
                  content: Text(StringsData.userDataUploadSuccessMsg),
                  actions: <Widget>[
                    RaisedButton(child: Text(StringsData.raisedButtnOk), onPressed: (){
                      initUserDetails();
                      Navigator.pop(context);

                    },)
                  ],
                ));
      });
    }
  }

  void initUserDetails(){
    setState(() {
                                                
    _userDetail = UserDetail(
    username: "",
    password: "",
    dob: "",
    mobileNo: "",
    emailId: "",
  );
  if(!initCall)
    _formKey.currentState.reset();
  initCall = false ;
    });
  }

  @override
  void initState() {

    super.initState();
    initUserDetails();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forms"),
      ),
      drawer: DrawerWidget(),
      body: _progress
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: StringsData.username,
                          
                        ),
                        initialValue: _userDetail.username,
                        onSaved: (value) {
                          _userDetail = UserDetail(
                              username: value,
                              password: _userDetail.password,
                              dob: _userDetail.dob,
                              mobileNo: _userDetail.mobileNo,
                              emailId: _userDetail.emailId);
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        textInputAction: TextInputAction.next,
                        focusNode: _usernameFocusNode,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: StringsData.password,
                          alignLabelWithHint: true,
                        ),
                        obscureText: true,
                        initialValue: _userDetail.password,
                        inputFormatters: [LengthLimitingTextInputFormatter(8)],
                        focusNode: _passwordFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_mobileNoFocusNode);
                        },
                        onSaved: (value) {
                          _userDetail = UserDetail(
                              username: _userDetail.username,
                              password: value,
                              dob: _userDetail.dob,
                              mobileNo: _userDetail.mobileNo,
                              emailId: _userDetail.emailId);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: StringsData.mobileNo,
                        ),
                        focusNode: _mobileNoFocusNode,
                        initialValue: _userDetail.mobileNo,
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_emailIDFocusNode);
                        },
                        onSaved: (value) {
                          _userDetail = UserDetail(
                              username: _userDetail.username,
                              password: _userDetail.password,
                              dob: _userDetail.dob,
                              mobileNo: value,
                              emailId: _userDetail.emailId);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: StringsData.emailID,
                        ),
                        focusNode: _emailIDFocusNode,
                        initialValue: _userDetail.emailId,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_dobFocusNode);
                        },
                        onSaved: (value) {
                          _userDetail = UserDetail(
                              username: _userDetail.username,
                              password: _userDetail.password,
                              dob: _userDetail.dob,
                              mobileNo: _userDetail.mobileNo,
                              emailId: value);
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
                        initialValue: _userDetail.dob,
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.done,
                        onSaved: (value) {
                          _userDetail = UserDetail(
                              username: _userDetail.username,
                              password: _userDetail.password,
                              dob: value,
                              mobileNo: _userDetail.mobileNo,
                              emailId: _userDetail.emailId);
                        },
                        onFieldSubmitted: (_) {
                          _saveFormInputs();
                        },
                      ),
                      RaisedButton(
                        child: Text("Save"),
                        onPressed: _saveFormInputs,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
