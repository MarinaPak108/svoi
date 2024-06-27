import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svoi/domain/global_settings.dart' as glb;
import 'package:svoi/presentation/pages/home.dart';
import 'package:svoi/presentation/widgets/button.dart';
import 'package:svoi/presentation/widgets/check_box.dart';
import 'package:svoi/presentation/widgets/input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPwdVisible = false;
  bool? canSign = false;
  bool? stayLogged = false;
  bool isButtonActive = false;
  final _controller = TextEditingController();
  final _controllerPwd = TextEditingController();
  late SharedPreferences prefs;

  Future<void> saveAsLogged(bool? stayLoggedUser, String name) async {
    if (stayLoggedUser == true) {
      prefs = await SharedPreferences.getInstance();
      prefs.setBool("isSteySinged", stayLoggedUser!);
      prefs.setString("login", name);
      glb.userId = name;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final isButtonActive =
          _controller.text.isNotEmpty && _controllerPwd.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
    _controllerPwd.addListener(() {
      final isButtonActive =
          _controller.text.isNotEmpty && _controllerPwd.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
    isPwdVisible = true;
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(glb.globalHeight * 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputField(
                label: 'имя',
                ctrl: _controller,
                isLatinOnly: true,
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                label: 'пароль',
                ctrl: _controllerPwd,
                isPwdVisible: isPwdVisible,
                icn: IconButton(
                  icon: Icon(
                      isPwdVisible ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(
                      () {
                        isPwdVisible = !isPwdVisible;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Btn(
                name: "Ввести имя",
                onPressed: isButtonActive
                    ? () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(
                                      'SVOI APP',
                                      title: 'SVOI App',
                                    )));
                        setState(() {});
                      }
                    : null,
              ),
              const SizedBox(
                height: 10,
              ),
              CheckBox(
                value: stayLogged,
                label: "остаться зарегестрированным",
                onChanged: (bool? newVal) {
                  setState(() {});
                  stayLogged = newVal;
                },
              )
            ],
          ),
        ),
      );

  Widget buildDataWidget(context, snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
            text: snapshot.data.name,
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              const TextSpan(text: ' is '),
              TextSpan(
                  text: snapshot.data.gender,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
        ],
      );
}
