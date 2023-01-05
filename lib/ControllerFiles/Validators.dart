
import 'package:form_field_validator/form_field_validator.dart';

 MultiValidator emailValidator =  MultiValidator([
  EmailValidator(errorText: "Please Enter Valid Email."), RequiredValidator(errorText: "Field Should Not be Empty.")

 ]);
 MultiValidator requiredValidator = MultiValidator([
  RequiredValidator(errorText: "Field Should Not be Empty."),
  PatternValidator(r"^[a-zA-Z]*$", errorText: "Please Enter Valid Text.")
  
 ]);

 MultiValidator passwordValidator = MultiValidator([
  RequiredValidator(errorText: "Please Enter valid password."),
  PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
      errorText: "Please Enter Valid Password.")
 ]);
 
 
 
 
