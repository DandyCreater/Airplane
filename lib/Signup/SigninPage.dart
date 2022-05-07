import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/Widget/CustomTextFromField.dart';
import 'package:splashscreen/cubit/auth_cubit.dart';
import 'package:splashscreen/theme.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget Title() => Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            "Sign In With a \nExciting Account",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        );

    Widget inputSection() {
      Widget emailInput() => CustomTextFromField(
            controller: emailController,
            title: "Email Address",
            hintText: 'Your Email Address',
          );

      Widget passwordInput() => CustomTextFromField(
            controller: passwordController,
            title: "Password",
            hintText: 'Your Password',
            obsecureText: true,
          );

      Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: kRedColor, content: Text(state.error)));
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CustomButtom(
                title: 'Sign In',
                onPressed: () {
                  context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text);
                },
                margin: EdgeInsets.only(top: 20),
              );
            },
          );

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget TacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/signup');
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 73,
            ),
            child: Text(
              'Dont have an Account ? Sign Up',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.purple,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Title(),
            inputSection(),
            TacButton(),
          ],
        ),
      ),
    );
  }
}
