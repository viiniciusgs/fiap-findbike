import 'package:findbike_app/components/custom_divider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 32.0),
                child: Text(
                  'Find Bike',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira seu e-mail',
                  label: Text('E-mail'),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: _obscurePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: 'Insira sua senha',
                  label: const Text('Senha'),
                ),
              ),
              const SizedBox(height: 24.0),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size.fromWidth(MediaQuery.of(context).size.width),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Entrar'),
                ),
              ),
              const CustomDivider(),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size.fromWidth(MediaQuery.of(context).size.width),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Crie uma conta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
