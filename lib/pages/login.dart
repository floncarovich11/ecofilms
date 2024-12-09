import 'package:ecofilms/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance; 
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Perfil(),
        ),
      );
    } catch (e) {
      _showSnackBar('Usuário ou senha incorretos', Colors.red);
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

  bool _showPassword = false;
  String? _errorMessage;

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/img/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "ECOFILMS",
                    style: TextStyle(
                      fontFamily: 'Antonio',
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 16),
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
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "Email ou número de telefone",
                              hintStyle: TextStyle(
                                fontFamily: 'Antonio',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFAEA0A0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, insira um email";
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return "Insira um email válido";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              hintText: "Senha",
                              hintStyle: TextStyle(
                                fontFamily: 'Antonio',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFAEA0A0),
                              ),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, insira sua senha";
                              }
                              if (value.length < 6) {
                                return "A senha deve ter pelo menos 6 caracteres";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 12),
                          Center(
                            child: ElevatedButton(
                              onPressed: _login,
                              child: Text("Entrar"),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(120, 50),
                                backgroundColor: Color(0xFF65DC65),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_errorMessage != null)
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: TextStyle(color: Colors.red),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/redefinirsenha');
                                },
                                child: Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(
                                    fontFamily: 'Antonio',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text('ou',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                  ),
                                ],
                              ),
                          SizedBox(height: 16), 
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                    GoogleSignIn googleSignIn = GoogleSignIn();

                                    try {
                                      GoogleSignInAccount? googleUser =
                                          await googleSignIn.signIn();

                                      if (googleUser == null) {
                                        _showSnackBar(
                                            'Login cancelado pelo usuário.',
                                            Colors.red);
                                        return;
                                      }

                                      GoogleSignInAuthentication googleAuth =
                                          await googleUser.authentication;

                                      OAuthCredential credential =
                                          GoogleAuthProvider.credential(
                                        accessToken: googleAuth.accessToken,
                                        idToken: googleAuth.idToken,
                                      );

                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithCredential(credential);

                                      User? user = userCredential.user;
                                      if (user != null) {
                                        print(
                                            'Usuário autenticado: ${user.displayName}');
                                        _showSnackBar(
                                            'Bem-vindo, ${user.displayName}!',
                                            Color(0XFF65DC65));

                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Perfil()),
                                        );
                                      }
                                    } catch (e) {
                                      _showSnackBar('Erro ao fazer login: $e',
                                          Colors.red);
                                    }
                                  },
                              icon: Image.asset(
                                'assets/img/google_logo.png',
                                height: 22,
                                width: 22,
                              ),
                              label: Text(
                                "Login com Google",
                                style: TextStyle(
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Novo por aqui? ',
                                style: TextStyle(
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color(0xFFAEA0A0),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, ('/cadastro'));
                                },
                                child: Text(
                                  "Cadastrar-se",
                                  style: TextStyle(
                                    fontFamily: 'Antonio',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
