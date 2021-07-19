import 'package:flutter/material.dart';


class PasswordTextInput extends StatelessWidget{
  final bool passwordVisible;
  final String lblName;
  final Function validation;
  final Function OnPress;
  final Function OnSaved;
  final Function onChange;
  final TextEditingController controller;
  const PasswordTextInput({
    Key key,
    this.passwordVisible,
    this.lblName,
    this.validation,
    this.OnPress,
    this.OnSaved,
    this.onChange,
    this.controller
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 5.0
      ),
      child: TextFormField(
        controller: controller,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Colors.red : Colors.black
            ),
            labelText:lblName,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),

            suffixIcon: IconButton(
                icon: Icon(

                  passwordVisible==false
                      ? Icons.visibility_off

                      :
                  Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed:OnPress
            )
        ),
        validator: validation,
        onChanged: onChange,
        onSaved: OnSaved,

      ),
    );
  }

}


