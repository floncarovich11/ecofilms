import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  List<Map<String, String>> profiles = [
    {'name': 'Felipe', 'imagePath': 'assets/img/felipe.png'},
    {'name': 'Guilherme', 'imagePath': 'assets/img/guilherme.png'},
    {'name': 'Tomás', 'imagePath': 'assets/img/tomas.png'},
  ];

  // Define o limite máximo de perfis
  final int maxProfiles = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo como imagem
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/img/logo.png', // Substitua pelo caminho correto da imagem da logo
                height: 90,
              ),
            ),
            // Texto "Quem está assistindo?"
            Text(
              'Quem está assistindo?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            // Perfis
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                children: [
                  // Perfis dinâmicos
                  ...profiles.map((profile) {
                    return _buildProfile(profile['name']!, profile['imagePath']!, context);
                  }).toList(),
                  // Botão de adicionar perfil, só é exibido se o limite não foi atingido
                  if (profiles.length < maxProfiles)
                    GestureDetector(
                      onTap: () => _showAddProfileDialog(context),
                      child: _buildAddProfileButton(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para criar um perfil individual com bordas levemente arredondadas
  Widget _buildProfile(String name, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega para a tela Home ao clicar no perfil, enviando a imagem como argumento
        Navigator.pushNamed(context, '/home', arguments: imagePath);
      },
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Bordas levemente arredondadas
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Função para o botão de adicionar perfil
  Widget _buildAddProfileButton() {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Adicionar perfil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  // Função para exibir o diálogo de adição de perfil
  void _showAddProfileDialog(BuildContext context) {
    if (profiles.length >= maxProfiles) {
      // Mostra uma mensagem informando que o limite foi atingido
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Limite de perfis atingido.')),
      );
      return;
    }

    String newProfileName = '';
    String newProfileImage = 'assets/img/padrao.png'; // Caminho de uma imagem padrão

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Perfil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newProfileName = value;
                },
                decoration: InputDecoration(labelText: 'Nome do Perfil'),
              ),
              SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                if (newProfileName.isNotEmpty) {
                  setState(() {
                    profiles.add({
                      'name': newProfileName,
                      'imagePath': newProfileImage,
                    });
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
