import 'package:chat_application/bloc/auth_bloc.dart';
import 'package:chat_application/cubits/chat/chat_cubit.dart';
import 'package:chat_application/cubits/login/login_cubit.dart';
import 'package:chat_application/cubits/register/register_cubit.dart';
import 'package:chat_application/cubits/register/register_cubit.dart';
import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/screens/chat_page.dart';
import 'package:chat_application/screens/login_chat.dart';
import 'package:chat_application/screens/register_chat.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) =>  LoginPage(),
          RegisterPage.id: (context) =>  RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
