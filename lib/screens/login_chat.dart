import 'package:chat_application/const.dart';
import 'package:chat_application/cubits/chat/chat_cubit.dart';
import 'package:chat_application/cubits/login/login_cubit.dart';
import 'package:chat_application/screens/chat_page.dart';
import 'package:chat_application/screens/register_chat.dart';
import 'package:chat_application/widget/custom_button.dart';
import 'package:chat_application/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = 'loginpage';
  GlobalKey<FormState> formkey = GlobalKey();
  String? email;
  String? password;
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoad) {
          isLoad = true;
        } else if (state is LoginSucess) {
          isLoad = false;
          Navigator.pushNamed(context, ChatPage.id);
        } else {
          isLoad = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoad,
          child: Form(
            key: formkey,
            child: Scaffold(
              backgroundColor: kColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 100,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Scholar Chat',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    TextFromField(
                      onchan: (data) {
                        email = data;
                      },
                      text: 'email',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFromField(
                      onchan: (data) {
                        password = data;
                      },
                      text: 'password',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      ontap: () async {
                        BlocProvider.of<LoginCubit>(context)
                            .LoginUser(email: email!, password: password!);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Dont\'t have an account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterPage();
                            }));
                          },
                          child: const Text(
                            '  Register',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 172, 157)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
