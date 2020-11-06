import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guess_it_app/screens/admin-code-page/admin-code-page.dart';
import 'package:guess_it_app/screens/admin-panel-page/admin-panel-page.dart';

class LandingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('images/logo.jpg'),
              ),
            ),
            SizedBox(height: 40),
            Container(
              child: Text(
                'GuessIt',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              child: RaisedButton(
                onPressed: () => {},
                color: Colors.white,
                textColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                elevation: 5,
                colorBrightness: Brightness.dark,
                child: Text(
                    'PLAY',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),
                ),
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminCode()),
                  );
                },
                child: Text(
                    'Enter as Admin',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      decoration: TextDecoration.underline
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(134, 232, 214, 1.0),
    );
  }
}