import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'models/cow_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => CowNotifier(), child: MonCattleApp()));

class MonCattleApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<bool> checkLoginValue() async {
    SharedPreferences loginCheck = await SharedPreferences.getInstance();
    return loginCheck.getBool("login");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moncattle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
          future: checkLoginValue(),
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == null || snapshot.data == false) {
              return HomePage(title: 'Moncattle');
            } else {
              return Dashboard();
            }
          }),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  onApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _status = prefs.getBool('login');
    _status = true;
    prefs.setBool('login', _status);
  }

  outApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', false);
  }

  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'OpenSans', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: userController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black87,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (userController.text == 'ufrpe' &&
              passwordController.text == 'ufrpe') {
            onApp();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
              (Route<dynamic> route) => false,
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: ListTile(
                  title: Text("Validação dos dados"),
                  subtitle: Text("Usuário não cadastrado ou senha inválida"),
                ),
                actions: <Widget>[
                  FlatButton(
                      child: Text("OK"),
                      onPressed: () => Navigator.of(context).pop())
                ],
              ),
            );
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  //color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
