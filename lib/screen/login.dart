import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(32),
            constraints: const BoxConstraints(
              maxWidth: 350,
            ),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FlutterLogo(size: 100,),
                    _gap(),
                    Text('Wilujeng Sumping dina Iuran Warga',
                    style: Theme.of(context,).textTheme.titleMedium),
                    const SizedBox(height: 8,),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukan Email',
                        prefixIcon: Icon(Icons.email_outlined,),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Email tidak boleh kosong';
                        }
                        final emailRegex =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+/.[a-zA-Z]{2,}$';
                        final emailValid = RegExp(emailRegex).hasMatch(value);
                        if (!emailValid) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      }
                    ),
                    _gap(),
                    TextFormField(
                      obscureText: !_isPasswordVisible,
                       decoration:  InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukan Password',
                        prefixIcon: const Icon(Icons.password_outlined),
                        border: const OutlineInputBorder(),
                        suffixIcon:  IconButton(
                        icon: Icon(
                          _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                            
                        ),
                          onPressed: (){
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          }, 
                        )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }
                        return null;
                      }
                    ),
                    _gap(),
                    SizedBox(width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formkey.currentState?.validate() ?? false) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                        }
                      }, child: const Padding(padding: 
                      EdgeInsets.all(10),
                      child: Text('Masuk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),)),)
                  ],
                ),
              )),
          ),
        ),
      ),
    );
  }
}

Widget _gap() => const SizedBox(height: 16,);