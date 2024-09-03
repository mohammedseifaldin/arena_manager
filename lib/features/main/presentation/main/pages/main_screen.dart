import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/enums.dart';
import 'package:arena_manager/core/utilities/navigators.dart';
import 'package:arena_manager/features/main/presentation/main/widgets/body.dart';
import 'package:arena_manager/features/main/presentation/main/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/main_cubit.dart';
import '../widgets/floating_button.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "Main_screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainCubit mainCubit;
  @override
  void initState() {
    mainCubit = MainCubit()..getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainCubit,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            'home'.translate(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is UpdatingDevice && state.processState == ProcessState.failed) {
              showMessage(state.result, Colors.redAccent);
            }
            if (state is DeleteingDevice && state.processState == ProcessState.failed) {
              showMessage(state.result, Colors.redAccent);
            }
          },
          builder: (context, state) {
            if (state is GettingDevicess) {
              return const CircularProgressIndicator.adaptive();
            }
            if (state is GettingDevicessFailed) {
              return CustomErrorWidget(
                primaryMessage: state.errorMessage ?? "gettingDataError".translate(),
                secondaryMessage: "tryAgain".translate(),
                retryFun: mainCubit.getData,
              );
            }
            return Body(children: mainCubit.devices);
          },
        ),
        floatingActionButton: const FloatingButton(),
      ),
    );
  }
}
