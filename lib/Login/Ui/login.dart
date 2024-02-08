import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suyogstore/Login/bloc/loginauth_bloc.dart';
import 'package:suyogstore/home/ui/Home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginauthBloc loginauthBloc = LoginauthBloc();

  // void initState()
  // {
  //   loginauthBloc.add(HomeInitialEvent());
  //   super.initState();

  // }
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    loginauthBloc.add(LoginEvent(
                        username: _usernameController.text,
                        password: _passwordController.text));

                  },
                  child: Text('Login'),
                ),
                BlocConsumer<LoginauthBloc, AuthState>(
                  bloc: loginauthBloc,
                  listener: (context, state) {
                    if(state is AuthAuthenticated)
                    {
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home()), );
  
                    }
                   

                    
                  },
               builder: (context, state) {
    if (state is AuthLoadingState) {
      return Column(
        children: [
          SizedBox(height: 20),
          CircularProgressIndicator(),
        ],
      );
    } else if (State is AuthUnauthenticated) 
    {
      return Column(
        children: [
          Text("Invalid Credentials")
        ],
      );
    }
    {
  
      return Container();
    }
  },
)

              ],
            ),
          ),
        );
      }
  } 
