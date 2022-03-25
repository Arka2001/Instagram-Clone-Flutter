import 'package:flutter/widgets.dart';
import 'package:instagram_clone/src/services/services.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final _authServices = AuthServices();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authServices.getUserDetails();

    _user = user;
    notifyListeners();
  }
}
