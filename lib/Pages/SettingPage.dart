import 'package:flutter/material.dart';
import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/cubit/page_cubit.dart';
import 'package:splashscreen/theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: kRedColor, content: Text(state.error)));
        } else if (state is AuthInitial) {
          context.read<PageCubit>().SetPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/signin', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthFailed) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: CustomButtom(
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            title: 'Sign Out',
            width: 220,
          ),
        );
      },
    );
  }
}
