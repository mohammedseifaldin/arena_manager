import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main/controller/main_cubit.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "Main_screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainCubit mainBloc;
  @override
  void initState() {
    mainBloc = MainCubit()..getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => mainBloc,
        child: const SizedBox(),
      ),
    );
  }
}
