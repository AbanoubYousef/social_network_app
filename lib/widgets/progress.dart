

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container circularProgress(context) {
  return Container(
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
    ),
  );
}

Container linearProgress(context) {
  return Container(
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.center,
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
    ),
  );
}
