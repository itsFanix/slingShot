import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slingshot/components/myButton.dart';
import 'package:slingshot/components/myTextField.dart';
import 'package:slingshot/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
  void signIn()  async {
    //get  the auth service 
    final authService = Provider.of<AuthService>(context, listen: false);

    try{
       await  authService.signInWithEmailAndPassword(
        emailController.text, passwordController.text);
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromARGB(135, 220, 9, 199),
              Color.fromARGB(155, 93, 26, 148),
              Color.fromARGB(151, 135, 1, 97),
              Color.fromARGB(151, 172, 37, 93),
              Color.fromARGB(152, 202, 72, 91),
              Color.fromARGB(151, 225, 107, 92),
              Color.fromARGB(153, 243, 145, 96),
              Color.fromARGB(156, 118, 163, 200),
            ],
            tileMode: TileMode.mirror,
          )),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                // App Name
                Image.asset(
                  'assets/images/hopen_Logotype.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height / 5,
                  width: MediaQuery.sizeOf(context).width / 2,
                ),
                // App Logo
                Image.asset(
                  'assets/images/Hopen-logo.png',
                  height: MediaQuery.sizeOf(context).height / 10,
                  width: MediaQuery.sizeOf(context).width / 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                // Sign In Container
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        MyTextField(
                            controller: emailController,
                            hintText: "email",
                            obscurText: false),
                        MyTextField(
                            controller: passwordController,
                            hintText: "mot de passe",
                            obscurText: true),
                        MyButton(onTap: signIn, text: "se connecter")
                      ]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(30),
                  child: MyButton(onTap: signIn, text: "créer un compte"),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
