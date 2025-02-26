import 'package:chat_application/const.dart';
import 'package:chat_application/cubits/register/register_cubit.dart';
import 'package:chat_application/screens/chat_page.dart';
import 'package:chat_application/widget/custom_button.dart';
import 'package:chat_application/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = 'register';
  GlobalKey<FormState> fromkey = GlobalKey();
  String? email;
  String? password;
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoad) {
          isLoad = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoad = false;
        } else {
          ShowSnackBar(context, 'there is problem');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoad,
          child: Form(
            key: fromkey,
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
                      'LOGIN',
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
                        if (fromkey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context)
                              .RegisterUser(email: email!, password: password!);
                        }
                        // if (fromkey.currentState!.validate()) {
                        //   BlocProvider.of<RegisterCubit>(context)
                        //       .RegisterUser(email: email!, password: password!);
                        // }
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
                            '  Login',
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
