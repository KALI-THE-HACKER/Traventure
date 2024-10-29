// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//Flutter App designed by Luckylinux as a Assignment for Flutter-Bootcamp-Project-2024, on 27 October, 2024.

//Author: Luckylinux [luckyverma05657@gmail.com]


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

List<String> cityname = ['Rome', 'Phuket', 'Istanbul', 'Cancun', 'Barcelona', 'Kyoto', 'Paris', 'Maui', 'Capetown', 'New York'];
List<String> imageURLs = ['https://www.fodors.com/wp-content/uploads/2018/10/HERO_UltimateRome_Hero_shutterstock789412159.jpg',
'https://www.fivestars-thailand.com/images/article/display/a_1709046726.jpg', 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/507000/507836-istanbul.jpg',
'https://mexicodave.com/wp-content/uploads/2022/02/cancun-day-trips-tours-attractions.jpeg',
'https://bucket-files.city-sightseeing.com/blog/2023/02/sagradafamilia-barcelona.jpg',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Pk1pfOZlwl4bjyRCktrj2oogSIDqEhNEkA&s',
'https://cdn.britannica.com/31/255531-050-B7E07090/eiffel-tower-paris-france-champ-de-mars-view.jpg',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlABjyfk1HuiQPIV9w9STaKy-KuEykBDOQQg&s',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7DC3Ra87r86OFEiCyuppijD2QKBnTde3Oow&s',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqkHQzKBXmlqCdnAtI3wvfLcy1eUaPEC1aRw&s'];

List<String> description = ['Historic landmarks, vibrant streets, and timeless charm in every corner',
'Tropical beaches, vibrant nightlife, and the best of Thai culture',
'Historic mosques, bustling bazaars, and where Europe meets Asia beautifully',
'Turquoise waters, white sands, and adventure await in this paradise',
'Gaudí’s wonders, sunny beaches, and a rich Catalan vibe throughout',
'Tranquil temples, cherry blossoms, and a taste of traditional Japanese culture',
'Romantic streets, world-class museums, and the iconic Eiffel Tower',
'Hawaiian paradise with volcanic landscapes, sandy beaches, and lush rainforests',
'Scenic coastlines, Table Mountain views, and a melting pot of cultures',
'Bustling streets, iconic skyscrapers, and endless entertainment in the city that never sleeps'];

List<int> rating = [5, 4, 5, 4, 5, 5, 5, 4, 4, 5];

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traventure',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title:  "Traventure",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(120, 255, 255, 255),
        title: Text(widget.title, style: GoogleFonts.pacifico(fontSize: 34,),),
        
      ),
      body:

        ListView.builder(
          itemCount: cityname.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
          return Container(
            height: 190,
            margin: EdgeInsets.only(top: 15, left: 15,right: 15),
            padding: EdgeInsets.only(left: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0
                )
              ],
              color: const Color.fromARGB(100, 229, 251, 232),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Row(
                  children: [
                    Spacer(),
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: [0.4, 0.9],
                        colors: [
                          Colors.white,
                          const Color.fromARGB(0, 255, 255, 255),
                        ]
                        ).createShader(bounds);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(imageURLs[index],
                        fit: BoxFit.cover,),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Padding(padding: EdgeInsets.only(top: 10)),
                    Text(cityname[index],
                      style:
                        GoogleFonts.montserratAlternates(
                          fontSize: 26,
                        ),),
                    SizedBox(
                      width: 180,
                      height: 90,
                      child: Text(description[index],
                      style: GoogleFonts.openSans(
                        fontSize: 14
                      ),),
                    ),
                    Row(children: 
                      List.generate(
                      rating[index],
                      (index) => Icon(
                        Icons.star, color: const Color.fromARGB(255, 255, 193, 7),
                        size: 15,),
                    ),
                    ),                 
                  ],
                )
              ],
            )
          );
        },),
    );
  }
}