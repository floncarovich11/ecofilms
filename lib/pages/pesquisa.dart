import 'package:flutter/material.dart';

class Pesquisa extends StatefulWidget {
  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _items = [
    {
      'title': '365 Dias Finais',
      'image': 'assets/img/365_dias_finais.png',
      'reproducaoImage': 'assets/img/365diasreproducao.jpeg',
      'description': 'A história segue Laura, uma jovem que é sequestrada pelo mafioso Massimo durante uma viagem à Sicília. Ele lhe dá 365 dias para que ela se apaixone por ele.',
      'year': '2021',
      'ageRating': 'A18',
      'duration': '1 hr e 40 min',
    },
    {
      'title': 'De repente 30',
      'image': 'assets/img/de_repente_30.png',
      'reproducaoImage': 'assets/img/derepente30reproducao.jpg',
      'description': 'Uma adolescente de 13 anos faz um pedido de aniversário e acorda 17 anos depois no corpo de uma mulher de 30.',
      'year': '2004',
      'ageRating': 'L',
      'duration': '1 hr e 38 min',
    },
    {
      'title': 'Barbie Dolphin Magic',
      'image': 'assets/img/barbie_dolphin_magic.png',
      'reproducaoImage': 'assets/img/barbiedolphinmagicreproducao.jpg',
      'description': 'Barbie e suas irmãs vão em uma aventura para salvar golfinhos e proteger o habitat marinho.',
      'year': '2017',
      'ageRating': 'L',
      'duration': '1 hr',
    },
    {
      'title': 'Carandiru',
      'image': 'assets/img/carandiru.png',
      'reproducaoImage': 'assets/img/carandirureproducao.jpg',
      'description': 'História baseada em fatos reais sobre a vida e os desafios no presídio Carandiru em São Paulo.',
      'year': '2003',
      'ageRating': 'A16',
      'duration': '2 hr e 25 min',
    },
    {
      'title': 'O Mal que Nos Habita',
      'image': 'assets/img/o_mal_que_nos_habita.png',
      'reproducaoImage': 'assets/img/omalquenoshabitareproducao.jpg',
      'description': 'Uma história de horror onde uma jovem luta para sobreviver a uma entidade maléfica em sua casa.',
      'year': '2019',
      'ageRating': 'A18',
      'duration': '1 hr e 30 min',
    },
    {
      'title': 'Mama',
      'image': 'assets/img/mama.png',
      'reproducaoImage': 'assets/img/mamareproducao.jpg',
      'description': 'Duas meninas que desapareceram na floresta são encontradas anos depois sob os cuidados de uma entidade sobrenatural.',
      'year': '2013',
      'ageRating': 'A14',
      'duration': '1 hr e 40 min',
    },
    {
      'title': 'A Comédia dos Pecados',
      'image': 'assets/img/a_comedia_dos_pecados.png',
      'reproducaoImage': 'assets/img/acomediadospecadosreproducao.jpg',
      'description': 'Comédia que explora situações inusitadas com personagens enfrentando dilemas morais.',
      'year': '2018',
      'ageRating': 'A12',
      'duration': '1 hr e 30 min',
    },
  ];
  List<Map<String, String>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _items.where((item) {
        final title = item['title']!.toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  void _navigateToMovieScreen(Map<String, String> movieData) {
    Navigator.pushNamed(
      context,
      '/reproducao',
      arguments: movieData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Color(0XFF65DC65),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.black),
              SizedBox(width: 1.0),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    hintStyle: TextStyle(color: Color.fromARGB(137, 0, 0, 0)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    _searchController.clear();
                    _filterItems();
                  },
                ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Text(
            'Séries e Filmes recomendados',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ..._filteredItems.map((item) => buildListItem(item)).toList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0XFF65DC65),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Mais',
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
              Navigator.pushReplacementNamed(context, '/pesquisa');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/pesquisa');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/pesquisa');
              break;
          }
        },
      ),
    );
  }

  Widget buildListItem(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            item['image']!,
            width: 140,
            height: 70,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              item['title']!,
              style: TextStyle(color: Colors.white, fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(Icons.play_circle_outline, color: Colors.white, size: 30),
            onPressed: () {
              _navigateToMovieScreen(item);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }
}  