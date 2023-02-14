import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:one_work/view/style/style.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import 'home_page.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<Widget> mainPages = [
    const HomePage(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<AuthController>().currentIndex,
        children: mainPages,
      ),
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeViewColor: Style.primaryColor,
        // selectedItemColor: Style.primaryColor,
        unselectedItemColor: Style.greyColor90,
        currentIndex: context.watch<AuthController>().currentIndex,
        onTap: (value) {
          context.read<AuthController>().setIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.email)),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark)),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded)),
        ],
      ),
    );
  }
}
