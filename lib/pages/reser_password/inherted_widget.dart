import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class UserInherit extends InheritedWidget {
  const UserInherit(this.user, {
    super.key,
    required super.child,
  });
  final User user;

  static UserInherit of(BuildContext context) {
    final UserInherit? result =
        context.dependOnInheritedWidgetOfExactType<UserInherit>();
    assert(result != null, 'No UserInherit found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserInherit oldWidget) {
    return false;
  }
}
