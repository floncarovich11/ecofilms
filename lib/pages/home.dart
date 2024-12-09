import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? perfilImagePath;

  final List<Map<String, String>> filmes = [
    {
      'title': 'Gente Grande 2',
      'year': '2013',
      'ageRating': '12',
      'duration': '1h 41m',
      'description':
          'Lenny e seus amigos decidem retornar à cidade onde cresceram...',
      'image': 'assets/img/gentegrande2.png',
      'reproducaoImage': 'assets/img/gentegrande2reproducao.jpg',
    },
    {
      'title': 'Gigantes de Aço',
      'year': '2011',
      'ageRating': '12',
      'duration': '2h 7m',
      'description':
          'Ambientado em um futuro onde humanos foram substituídos por robôs...',
      'image': 'assets/img/gigantesdeaço.png',
      'reproducaoImage': 'assets/img/gigantesdeaçoreproducao.jpeg',
    },
    {
      'title': 'Jumanji',
      'year': '1995',
      'ageRating': '10',
      'duration': '1h 44m',
      'description':
          'Quando duas crianças descobrem um antigo jogo de tabuleiro...',
      'image': 'assets/img/jumanji.png',
      'reproducaoImage': 'assets/img/jumanjireproducao.jpg',
    },
    {
      'title': 'Coringa',
      'year': '2019',
      'ageRating': '16',
      'duration': '2h 2m',
      'description':
          'Arthur Fleck, um comediante de rua lutando com problemas psicológicos...',
      'image': 'assets/img/joker.jpg',
      'reproducaoImage': 'assets/img/jokerreproducao.jpg',
    },
    {
      'title': 'Rocky',
      'year': '1976',
      'ageRating': '12',
      'duration': '2h',
      'description': 'Rocky Balboa, um boxeador amador da Filadélfia...',
      'image': 'assets/img/rocky.jpg',
      'reproducaoImage': 'assets/img/rockyreproducao.png',
    },
    {
      'title': 'Titanic',
      'year': '1997',
      'ageRating': '12',
      'duration': '3h 15m',
      'description': 'Em 1912, o Titanic parte em sua viagem inaugural...',
      'image': 'assets/img/titanic.jpg',
      'reproducaoImage': 'assets/img/titanicreproducao.jpg',
    },
    {
      'title': 'Jurassic Park',
      'year': '1993',
      'ageRating': '10',
      'duration': '2h 7m',
      'description':
          'Um bilionário cria um parque onde dinossauros geneticamente recriados vivem...',
      'image': 'assets/img/jurassicpark.jpg',
      'reproducaoImage': 'assets/img/jurassicparkreproducao.jpg',
    },
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) {
      setState(() {
        perfilImagePath = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/img/prisionbreak.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                              stops: [0.5, 1],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60, 
                        left: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/perfil');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF65DC65),
                                width: 1.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 20, 
                              backgroundImage: AssetImage(
                                perfilImagePath ??
                                    'assets/img/padrao.png', 
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 13,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/logo.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'S É R I E',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 165),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add, color: Colors.white),
                                      SizedBox(height: 5),
                                      Text(
                                        'Minha Lista',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/reproducao',
                                      arguments: filmes[0],
                                    );
                                  },
                                  icon: Icon(Icons.play_arrow),
                                  label: Text(
                                    'Assistir',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.info_outline,
                                          color: Colors.white),
                                      SizedBox(height: 5),
                                      Text(
                                        'Detalhes',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.black,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filmes.length,
                    itemBuilder: (context, index) {
                      final filme = filmes[index];
                      return PreviewCard(
                        imageUrl: filme['image']!,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/reproducao',
                            arguments: filme,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF65DC65),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'Em Breve',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Baixados',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/pesquisa');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/embreve');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/baixados');
              break;
          }
        },
      ),
    );
  }
}

class PreviewCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const PreviewCard({required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
