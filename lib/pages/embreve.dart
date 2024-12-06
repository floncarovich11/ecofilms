import 'package:flutter/material.dart';

class Embreve extends StatefulWidget {
  @override
  State<Embreve> createState() => _EmbreveState();
}

class _EmbreveState extends State<Embreve> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _items = [
    {
      'title': 'Moana 2 (31/12/2024)',
      'image': 'assets/img/moana2.jpg',
    },
    {
      'title': 'Glatiator 2 (25/02/2025)',
      'image': 'assets/img/gladiator2.jpg',

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