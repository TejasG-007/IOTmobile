
import 'package:form_field_validator/form_field_validator.dart';

 MultiValidator emailValidator =  MultiValidator([
  EmailValidator(errorText: "Please Enter Valid Email."), RequiredValidator(errorText: "Field Should Not be Empty.")

 ]);
 RequiredValidator requiredValidator = RequiredValidator(errorText: "Field Should Not be Empty.");
