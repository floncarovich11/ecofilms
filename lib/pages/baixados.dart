import 'package:flutter/material.dart';

class Baixados extends StatefulWidget {
  @override
  State<Baixados> createState() => _BaixadosState();
}

class _BaixadosState extends State<Baixados> {
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
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          SizedBox(height: 50),
          Text(
            'Em breve',
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