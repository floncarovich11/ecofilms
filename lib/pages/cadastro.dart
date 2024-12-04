import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _showPassword = false;
  String? _errorMessage;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        await userCredential.user!.updateDisplayName(_usernameController.text.trim());
        await userCredential.user!.reload();
        _auth.currentUser;

        _showSnackBar('Cadastro realizado com sucesso!', Colors.green);
        Navigator.pop(context);
      } catch (e) {
        _showSnackBar('Erro no cadastro: ${e.toString()}', Colors.red);
      }
    }
  }

  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 50, 48, 48).withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/img/fundologin.jfif',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/img/logo.png',
                  height: 70,
                  width: 70,
                ),
                Text(
                  "ECOFILMS",
                  style: TextStyle(
                    fontFamily: 'Antonio',
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Cadastro",
                          style: TextStyle(
                            fontFamily: 'Antonio',
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 16),
                        
                        // Campo Nome
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: "Nome",
                            hintStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 20,
                              color: Color(0xFFAEA0A0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, insira seu nome.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Campo CPF
                        TextFormField(
                          controller: _cpfController,
                          decoration: InputDecoration(
                            hintText: "CPF",
                            hintStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 20,
                              color: Color(0xFFAEA0A0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, insira seu CPF.";
                            } else if (value.length != 11 || !RegExp(r'^\d+$').hasMatch(value)) {
                              return "CPF inválido. Deve ter 11 dígitos numéricos.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Campo Email
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 20,
                              color: Color(0xFFAEA0A0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, insira um email válido.";
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return "Email inválido.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Campo Celular
                        TextFormField(
                          controller: _celularController,
                          decoration: InputDecoration(
                            hintText: "Celular",
                            hintStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 20,
                              color: Color(0xFFAEA0A0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, insira seu celular.";
                            } else if (value.length < 10 || value.length > 11 || !RegExp(r'^\d+$').hasMatch(value)) {
                              return "Celular inválido.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Campo Senha
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            hintText: "Senha",
                            hintStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 20,
                              color: Color(0xFFAEA0A0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: GestureDetector(
                              child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, insira uma senha.";
                            } else if (value.length < 6) {
                              return "A senha deve ter no mínimo 6 caracteres.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Campo Confirmar Senha
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            hintText: "Confirmar senha",
                            hintStyle: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 20,
                              color: Color(0xFFAEA0A0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, confirme sua senha.";
                            } else if (value != _passwordController.text) {
                              return "As senhas não coincidem.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        Center(
                          child: ElevatedButton(
                            onPressed: _register,
                            child: Text(
                              "Cadastrar-se",
                              style: TextStyle(
                                fontFamily: 'Antonio',
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(300, 45),
                              backgroundColor: Color(0xFF65DC65),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
