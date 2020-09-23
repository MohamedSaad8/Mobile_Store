import 'package:flutter/cupertino.dart';

class UiMode extends ChangeNotifier
{
  bool loginMode = true ;
  changeLoginMode ()
  {
    loginMode = !loginMode ;
    notifyListeners();
    return loginMode ;
  }


}