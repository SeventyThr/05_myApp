import 'package:flutter/material.dart';
import './page/manage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '肥洁app',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SevenThr_app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => login();
}



class login extends State<MyHomePage> {
  TextEditingController unameController = TextEditingController();
  TextEditingController mimaController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;
  GlobalKey _formKey = GlobalKey<FormState>();
  String _path = "images/hua.jpg";
  int _counter=0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      _path = "images/hua.jpg";
    });
  }

  void _clearCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _reduceCounter() {
    setState(() {
      _counter--;
    });
  }

  void _changePic() {
    setState(() {
      _path = _path == "images/hua.jpg"
          ? "images/yue.jpg"
          : "images/meigui.jpg";
    });
  }
  @override
  Widget build(BuildContext context) {
    String userName;
    String mima;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: unameController, //设置controller
              focusNode: focusNode1,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              focusNode: focusNode2,
              controller: mimaController,
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("登录"),
                      ),
                      onPressed: () {
                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        userName = unameController.text;
                        mima = mimaController.text;
                        if (userName == '2653048570' && mima == 'kjfkjfkjf0') {
                          //验证通过提交数据
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => manage()),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.back_hand_sharp),
              label: const Text("返回"),
              onPressed: () {
                Navigator.pop(context); //从第二个界面返回
              },
            ),
            Builder(
              builder: (ctx) {
                return Column(
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("移动焦点"),
                      onPressed: () {
                        //将焦点从第一个TextField移到第二个TextField
                        // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                        // 这是第二种写法
                        if (null == focusScopeNode) {
                          focusScopeNode = FocusScope.of(context);
                        }
                        focusScopeNode?.requestFocus(focusNode2);
                      },
                    ),
                    ElevatedButton(
                      child: Text("隐藏键盘"),
                      onPressed: () {
                        // 当所有编辑框都失去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                    Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Image.network("$_path", width: 100, height: 100),
            ),
            Column(
              children: [
                const Text(
                  'You have pushed the button this many times: ',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                    onPressed: _clearCounter,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Return Zero",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                  child: ElevatedButton(
                    onPressed: _reduceCounter,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Reduce a count",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                  child: ElevatedButton(
                    onPressed: _changePic,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Change a picture",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              ],
            )
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void initState() {
    //监听输入改变
    unameController.addListener(() {
      print(unameController.text);
    });
  }
}

