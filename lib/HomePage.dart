import 'package:profilepage/Film.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Film>? listfilm = [];

  @override
  void initState() {
    super.initState();
    Film thegooddinosaur = Film("The Good Dinosaur", "2016", "6.7", 'Images/film1.jpeg', "Film anak-anak, Petualangan", "1 j 33 m");
    Film avengerendgame = Film("Avengers: Endgame", "2019", "8.4", 'Images/film2.jpg', "Laga, Fiksi ilmiah", "3 j 1 m");
    Film spideraccrostheverse = Film("Spider-Man: Across the Spider-Verse", "2023", "8.8", 'Images/film3.jpg', "Laga, Comedy, Petualangan", "2 j 20 m");
    Film up = Film("Up", "2009", "8.3", 'Images/film4.png', "Film anak-anak, Petualangan", "1 j 36 m");
    Film angryman = Film("12 Angry Men", "1957", "9", 'Images/film5.jpeg', "Drama, Kejahatan", "1 j 36 m");
    Film theshawshank = Film("The Shawshank Redemption", "1994", "9.3", 'Images/film6.jpeg', "Drama, Kriminal", "2 j 22 m");
    Film amazingspiderman = Film("The Amazing Spider-Man", "2012", "6.9", 'Images/film7.jpg', "Laga, Petualang", "2 j 16 m");
    Film lordofthering = Film("The Lord of the Rings: The Return of the King", "2003", "9", 'Images/film8.jpeg', "Fantasy, Petualangan", "3 j 30 m");
    Film avengerinfinity = Film("Avengers: Infinity War", "2018", "8.4", 'Images/film9.jpg', "Laga, Fantasy", "2 j 29 m");
    Film schindlerlist = Film("Schindler's List", "1993", "9", 'Images/film10.jpeg', "Perang, Drama", "3 j 15 m");
    Film amazingspiderman2 = Film("The Amazing Spider-Man 2", "2014", "6.6", 'Images/film11.jpg', "Laga, Petualangan", "2 j 22 m");
    Film thedarkknight = Film("The Dark Knight", "2008", "9", 'Images/film12.jpg', "Laga, Petualangan", "2 j 32 m");
    listfilm?.add(thegooddinosaur);
    listfilm?.add(avengerinfinity);
    listfilm?.add(spideraccrostheverse);
    listfilm?.add(up);
    listfilm?.add(angryman);
    listfilm?.add(theshawshank);
    listfilm?.add(amazingspiderman);
    listfilm?.add(lordofthering);
    listfilm?.add(avengerendgame);
    listfilm?.add(schindlerlist);
    listfilm?.add(amazingspiderman2);
    listfilm?.add(thedarkknight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Center(
        child: Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: listfilm?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  color: Colors.black, // Set the background color to black
                  child: ListTile(
                    leading: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(listfilm![index].poster),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      listfilm![index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          "Tanggal Rilis : " + listfilm![index].tahunRilis +
                              " | Genre : " + listfilm![index].genre +
                              " | Durasi : " + listfilm![index].durasi +
                              " | Rating " + listfilm![index].rating,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
