import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> filmes = [
    {
  'title': 'Gente Grande 2',
  'year': '2013',
  'ageRating': '12',
  'duration': '1h 41m',
  'description': 'Lenny e seus amigos decidem retornar à cidade onde cresceram para oferecer uma vida mais simples para suas famílias. No entanto, a rotina pacata é interrompida por situações imprevisíveis e cômicas, como festas caóticas, reencontros emocionantes e novos desafios que testam sua amizade e habilidades como pais. O filme traz uma mistura de nostalgia, risadas e lições sobre amadurecimento e companheirismo.',
  'image': 'assets/img/gentegrande2.png',
  'reproducaoImage': 'assets/img/gentegrande2reproducao.jpg',
},
{
  'title': 'Gigantes de Aço',
  'year': '2011',
  'ageRating': '12',
  'duration': '2h 7m',
  'description': 'Ambientado em um futuro onde humanos foram substituídos por robôs no boxe, o ex-lutador Charlie Kenton luta para encontrar propósito. Com a ajuda de seu filho Max, ele descobre um robô sucateado chamado Atom, que parece ter um espírito de luta surpreendente. Juntos, pai e filho embarcam em uma jornada emocional e eletrizante, enfrentando adversários gigantes em arenas espetaculares enquanto reconectam seus laços familiares.',
  'image': 'assets/img/gigantesdeaço.png',
  'reproducaoImage': 'assets/img/gigantesdeaçoreproducao.jpeg',
},
{
  'title': 'Jumanji',
  'year': '1995',
  'ageRating': '10',
  'duration': '1h 44m',
  'description': 'Quando duas crianças descobrem um antigo jogo de tabuleiro chamado Jumanji, elas inadvertidamente libertam Alan Parrish, um homem preso no jogo por 26 anos. À medida que continuam a jogar, perigos selvagens como animais exóticos e desastres naturais começam a invadir o mundo real. Agora, eles devem unir forças para terminar o jogo e restaurar a normalidade, enfrentando mistérios, perigos e lições sobre coragem e trabalho em equipe.',
  'image': 'assets/img/jumanji.png',
  'reproducaoImage': 'assets/img/jumanjireproducao.jpg',
},
{
  'title': 'Coringa',
  'year': '2019',
  'ageRating': '16',
  'duration': '2h 2m',
  'description': 'Arthur Fleck, um comediante de rua lutando com problemas psicológicos e uma vida marcada por rejeições, é empurrado para os limites em uma Gotham City decadente. À medida que sua sanidade se deteriora, ele se transforma no icônico Coringa, um símbolo de revolta para os marginalizados. O filme explora temas profundos como desigualdade social, saúde mental e o impacto de uma sociedade que negligencia os vulneráveis, criando uma história intensa e perturbadora.',
  'image': 'assets/img/joker.jpg',
  'reproducaoImage': 'assets/img/jokerreproducao.jpg',
},
{
  'title': 'Rocky',
  'year': '1976',
  'ageRating': '12',
  'duration': '2h',
  'description': 'Rocky Balboa, um boxeador amador da Filadélfia, recebe uma oportunidade inesperada de desafiar o campeão mundial Apollo Creed em uma luta pelo título. Enfrentando descrença e dificuldades, Rocky embarca em um intenso treinamento físico e emocional com o objetivo de provar seu valor. O filme é uma inspiradora história de superação, determinação e autodescoberta, mostrando que o verdadeiro valor não está apenas na vitória, mas na coragem de lutar.',
  'image': 'assets/img/rocky.jpg',
  'reproducaoImage': 'assets/img/rockyreproducao.png',
},
{
  'title': 'Titanic',
  'year': '1997',
  'ageRating': '12',
  'duration': '3h 15m',
  'description': 'Em 1912, o Titanic, o maior e mais luxuoso navio de sua época, parte em sua viagem inaugural. A bordo, Rose, uma jovem de família aristocrática, encontra Jack, um artista aventureiro de origem humilde. Apesar das barreiras sociais, os dois se apaixonam intensamente. No entanto, seu amor é testado pela tragédia quando o Titanic colide com um iceberg. O filme combina romance, drama e ação, capturando a magnitude da tragédia histórica e o poder transformador do amor.',
  'image': 'assets/img/titanic.jpg',
  'reproducaoImage': 'assets/img/titanicreproducao.jpg',
},
{
  'title': 'Jurassic Park',
  'year': '1993',
  'ageRating': '10',
  'duration': '2h 7m',
  'description': 'Um bilionário visionário cria um parque temático inovador onde dinossauros geneticamente recriados vivem em um habitat controlado. Porém, quando o sistema de segurança falha, os visitantes do parque se veem em uma luta desesperada pela sobrevivência contra criaturas pré-históricas ferozes. Com efeitos visuais impressionantes e um enredo emocionante, o filme explora os perigos da ciência sem limites e a eterna fascinação humana pelo desconhecido.',
  'image': 'assets/img/jurassicpark.jpg',
  'reproducaoImage': 'assets/img/jurassicparkreproducao.jpg',
},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo com degradê
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Imagem de fundo
                      Positioned.fill(
                        child: Image.asset(
                          'assets/img/prisionbreak.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Degradê sobre a imagem
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
                      // Foto pequena para escolher perfil
                      Positioned(
                        top: 40,
                        left: 340,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/perfil'); // Tela de escolha de perfil
                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage('assets/img/perfil.jpg'), // Altere para sua imagem
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
                                    final prisonBreakData = {
                                      'title': 'Prison Break',
                                      'year': '2005',
                                      'ageRating': '16',
                                      'duration': '4 temporadas',
                                      'description': 'Michael Scofield é um homem desesperado...',
                                      'image': 'assets/img/prisionbreak.png',
                                      'reproducaoImage': 'assets/img/prisionbreakreproducao.jpg',
                                    };

                                    Navigator.pushNamed(
                                      context,
                                      '/reproducao',
                                      arguments: prisonBreakData,
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
                                      Icon(Icons.info_outline, color: Colors.white),
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
              Navigator.pushReplacementNamed(context, '/home'); // Início
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/pesquisa'); // Pesquisa
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/embreve'); // Em Breve
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/baixados'); // Baixados
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

  PreviewCard({required this.imageUrl, required this.onTap});

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
