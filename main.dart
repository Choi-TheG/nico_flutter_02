import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

// StatefulWidget은 Life cycle을 가지고 있다 !
class _MyLargeTitleState extends State<MyLargeTitle> {
  // API에서 구독을 업데이트하는 등의 경우에만 사용
  @override
  void initState() {
    super.initState();
    print('initState!');
  }

  // Widget(위젯)이 스크린에서 제거될 때 호출되는 메서드.
  // API 업데이트나 이벤트 리스너로부터 구독을 취소하거나 form의 리스너로부터 벗어나고 싶을 때
  // -> 무언가를 취소하는 것
  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
