import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _positionAnimation;
  late AnimationController _moveController;
  late Animation<Offset> _moveLeftAnimation;
  late Animation<Offset> _moveCenterAnimation;
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideUpAnimation;
  late String _displayText;
  late Timer _textTimer;
  int _currentIndex = 0;
  bool _isTextDisappearing = false;

  @override
  void initState() {
    super.initState();

    // Inicialização das animações de escalonamento e movimento
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 3.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _positionAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _moveController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _moveLeftAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-0.05, 0),
    ).animate(
      CurvedAnimation(parent: _moveController, curve: Curves.easeInOut),
    );

    // Animação para mover a imagem de volta ao centro (inicial)
    _moveCenterAnimation = Tween<Offset>(
      begin: Offset(-0.05, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _moveController, curve: Curves.easeInOut),
    );

    // Animação de expansão - Diminua a duração para torná-la mais rápida
    _expandController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500), // tempo da animaçãp
    );

    _expandAnimation = Tween<double>(begin: 1.0, end: 47.0).animate(
      CurvedAnimation(parent: _expandController, curve: Curves.easeInOut),
    );

    // Animação de fade out e slide up
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Mantenha conforme necessário
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _slideUpAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -0.5)).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _displayText = '';

    // Iniciar a animação inicial
    _controller.forward().then((_) {
      _startTextEntranceAnimation();
    });

    // Navegar para a tela de login após a animação de expansão
    _expandController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  // Função para animação de entrada das letras
  void _startTextEntranceAnimation() {
    _textTimer = Timer.periodic(Duration(milliseconds: 150), (timer) {
      if (_currentIndex < 'ECOFILMS'.length) {
        setState(() {
          _displayText += 'ECOFILMS'[_currentIndex];
          _currentIndex++;
        });

        if (_currentIndex == 1) {
          _moveController.forward(); // Movimenta levemente à esquerda
        }
      } else {
        timer.cancel();
        _startTextExitAnimation(); // Iniciar a animação de saída ao final da entrada
      }
    });
  }

  // Função para animação de saída das letras
  void _startTextExitAnimation() {
    _isTextDisappearing = false;
    _currentIndex = 0; // Reiniciar o índice para começar a remover as letras

    _fadeController.forward(); // Iniciar a animação de fade e slide

    // Alterar o tempo entre a remoção de cada letra para 100ms
    _textTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_currentIndex < 'ECOFILMS'.length) {
        setState(() {
          _displayText = 'ECOFILMS'.substring(0, 'ECOFILMS'.length - _currentIndex - 1);
          _currentIndex++;
        });
      } else {
        timer.cancel();
        // Mover a logo diretamente para o centro sem animação
        _moveController.stop();
        _moveCenterAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _moveController, curve: Curves.easeInOut),
        );
        _expandController.forward(); // Iniciar a expansão após centralizar
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _moveController.dispose();
    _expandController.dispose();
    _fadeController.dispose();
    _textTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          CustomPaint(
            size: Size.infinite,
            painter: BackgroundPainter(),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SlideTransition(
                  position: _positionAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: AnimatedBuilder(
                      animation: _moveController,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _isTextDisappearing ? _moveCenterAnimation : _moveLeftAnimation,
                          child: AnimatedBuilder(
                            animation: _expandController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _expandAnimation.value,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/img/ICONECOLORIDO.png',
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    // Animação de fade e slide nas letras
                                    if (!_isTextDisappearing) ...[
                                      SizedBox(width: 5),
                                      FadeTransition(
                                        opacity: _fadeAnimation,
                                        child: SlideTransition(
                                          position: _slideUpAnimation,
                                          child: Text(
                                            _displayText,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, size.height * 0.2), Offset(size.width * 0.35, size.height * 0.5), paint);
    canvas.drawLine(Offset(size.width * 0.35, size.height * 0.5), Offset(0, size.height * 0.85), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
