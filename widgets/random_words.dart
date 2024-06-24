import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _images = <String>[
    "https://medias.timeout.co.il/www/uploads/2023/10/GettyImages-1756860710-2000x1125.jpg",
    "https://ynet-pic1.yit.co.il/cdn-cgi/image/f=auto,w=740,q=75/picserver5/crop_images/2023/12/18/yk13723234/yk13723234_0_68_1050_591_0_x-large.jpg",
    "https://images.kikar.co.il/cdn-cgi/image/format=webp,fit=contain,width=900/2023/12/19/6a993770-9e5c-11ee-9459-55d14bf8bd70__h483_w724.jpg",
    "https://www.yesh-din.org/wp-content/uploads/2022/05/ActiveStills1403035366b24l5-1_wo_750_500_wo_750_500.jpg",
    "https://static.timesofisrael.com/www/uploads/2023/10/AP23292437174567.jpg?_gl=1*1asd9bq*_ga*MTc0OTU1OTAzNi4xNzE4ODk3MTc1*_ga_RJR2XWQR34*MTcxODg5NzE3Ni4xLjAuMTcxODg5NzE3Ni4wLjAuMA",
    "https://winners-auctions.com/wp-content/uploads/2021/05/3-139.jpg",
    "https://ynet-pic1.yit.co.il/cdn-cgi/image/f=auto,w=740,q=75/picserver5/crop_images/2024/03/17/yk13844889/yk13844889_0_0_589_589_0_x-large.jpg",
  ];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return Dismissible(
                background: Container(
                  color:  Color.fromARGB(255, 84, 115, 90),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Delete Suggestion",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                confirmDismiss: (direction) async {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Deletion is not implemented yet")));
                  return false;
                },
                key: ValueKey(pair),
                child: ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  void _pushLogin() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                      "Welcome to Startup Names Generator, please log in!"),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Login is not implemented yet")));
                      },
                      child: const Text("Log in"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('פעילות מבצעית דצמבר'), actions: [
        IconButton(
          icon: const Icon(Icons.star),
          onPressed: _pushSaved,
          tooltip: 'Saved Suggestions',
        ),
        IconButton(
          icon: const Icon(Icons.login),
          onPressed: _pushLogin,
          tooltip: 'Login',
        ),
      ]),
      body: ListView.separated(
        itemCount: _images.length,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, i) {
          return ListTile(
            title: Image.network(_images[i]),
          );
        },
      ),
    );
  }
}
