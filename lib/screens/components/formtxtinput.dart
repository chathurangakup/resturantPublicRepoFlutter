import 'package:flutter/material.dart';

class FormTextInput extends StatelessWidget{
  final String lblText;
  final String initialValue;
  final Function validator;
  final bool isenable;
  final TextInputType textinputtype;
  final Function onSave;
  final Function onChange;
  const FormTextInput({
    Key key,
    this.lblText,
    this.textinputtype,
    this.validator,
    this.onSave,
    this.initialValue,
    this.isenable,
    this.onChange
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return   Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 5.0
      ),
      child: TextFormField(
        autofocus: true,
        enabled: isenable,
      //  initialValue: initialValue,
        keyboardType: textinputtype,
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(labelText: lblText,

//            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),

//            contentPadding: const EdgeInsets.only(
//                left: 15,
//                top: 8,
//                right: 15,
//                bottom: 0
//            ),
            labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Colors.red : Colors.black
        )
        ),
        validator: validator,
        onChanged: onChange,

        onSaved: onSave,
      ),
    );
  }

}