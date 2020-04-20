import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class TextFieldPage extends StatefulWidget {
  final String title = 'Login';

  @override
  State<StatefulWidget> createState() => TextFieldPageState();
}

class TextFieldPageState extends State<TextFieldPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Section section = arguments['section'];
    return Scaffold(
      appBar: HYAppBar(
        title: widget.title,
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10 * vWidth),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'UserName',
                  hintText: 'UserName/E-mail',
                  prefixIcon: Icon(Icons.person)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10 * vWidth),
            child: TextField(
              autofocus: true,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Your Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: HYIconButton(
                    icon: obscurePassword ? HYIcon.eyeClosed : HYIcon.eye,
                    onPressed: () {
                      setState(() => obscurePassword = !obscurePassword);
                    }),
              ),
              obscureText: obscurePassword,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10 * vWidth),
            child: RaisedButton(
              onPressed: () {
                final String name = nameController.text;
                final String password = passwordController.text;
                if (name != '' && password != '') {
                  showAlertDialog(context,
                      title: 'Alert',
                      content: 'UserName: $name \nPassword: $password');
                }
              },
              child: HYText.center(title: 'Login', textColor: Colors.white),
              color: Colors.lightGreen,
            ),
          )
        ],
      ),
    );
  }
}

class TextFormFieldPage extends StatefulWidget {
  final String title = 'Login';

  @override
  State<StatefulWidget> createState() => TextFormFieldPageState();
}

class TextFormFieldPageState extends State<TextFormFieldPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Section section = arguments['section'];
    return Scaffold(
      appBar: HYAppBar(
        title: widget.title,
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Form(
        autovalidate: true,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10 * vWidth),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'UserName',
                    hintText: 'UserName/E-mail',
                    prefixIcon: Icon(Icons.person)),
                validator: (v) =>
                    v.trim().length > 0 ? null : 'UserName Can Not Be Empty',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10 * vWidth),
              child: TextFormField(
                autofocus: true,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Your Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: HYIconButton(
                      icon: obscurePassword ? HYIcon.eyeClosed : HYIcon.eye,
                      onPressed: () {
                        setState(() => obscurePassword = !obscurePassword);
                      }),
                ),
                obscureText: obscurePassword,
                validator: (v) => v.trim().length > 7
                    ? null
                    : 'Password Is Less Than 7 Characters',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10 * vWidth),
              child: Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () {
                    final String name = nameController.text;
                    final String password = passwordController.text;
                    if (Form.of(context).validate()) {
                      showAlertDialog(context,
                          title: 'Alert',
                          content: 'UserName: $name \nPassword: $password');
                    }
                  },
                  child: HYText.center(title: 'Login', textColor: Colors.white),
                  color: Colors.lightGreen,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
