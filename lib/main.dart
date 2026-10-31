import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MovieApp());
}

const Color bgColor = Color(0xFF080808);
const Color redColor = Color(0xFFFF1717);

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Streaming',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        colorScheme: const ColorScheme.dark(primary: redColor),
      ),
      home: const HomeScreen(),
    );
  }
}

class Movie {
  final String title;
  final String image;

  const Movie(this.title, this.image);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Movie> nowPlaying = const [
    Movie(
      'Deadpool & Wolverine',
      'https://image.tmdb.org/t/p/w780/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    ),
    Movie(
      'Inside Out 2',
      'https://image.tmdb.org/t/p/w780/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg',
    ),
    Movie(
      'The Batman',
      'https://image.tmdb.org/t/p/w780/74xTEgt7R36Fpooo50r9T25onhq.jpg',
    ),
  ];

  final List<Movie> trending = const [
    Movie(
      'Bad Boys',
      'https://image.tmdb.org/t/p/w500/oGythE98MYleE6mZlGs5oBGkux1.jpg',
    ),
    Movie(
      'Inside Out 2',
      'https://image.tmdb.org/t/p/w500/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg',
    ),
    Movie(
      'Deadpool',
      'https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    ),
    Movie(
      'The Batman',
      'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
    ),
  ];

  final List<Movie> popular = const [
    Movie(
      'The Marvels',
      'https://image.tmdb.org/t/p/w500/9GBhzXMFjgcZ3FdR9w3bUMMTps5.jpg',
    ),
    Movie(
      'The Fall Guy',
      'https://image.tmdb.org/t/p/w500/tSz1qsmSJon0rqjHBxXZmrotuse.jpg',
    ),
    Movie(
      'Aquaman',
      'https://image.tmdb.org/t/p/w500/8xV47NDrjdZDpkVcCFqkdHa3T0C.jpg',
    ),
    Movie(
      'The Batman',
      'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
    ),
  ];

  final List<Movie> topRated = const [
    Movie(
      'Oppenheimer',
      'https://image.tmdb.org/t/p/w500/ptpr0kGAckfQkJeJIt8st5dglvd.jpg',
    ),
    Movie(
      'The Godfather',
      'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
    ),
    Movie(
      'Interstellar',
      'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    ),
    Movie(
      'The Dark Knight',
      'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOW PLAYING
              Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 8),
                decoration: BoxDecoration(
                  border: Border.all(color: redColor, width: 2),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'Now Playing',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: nowPlaying.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = nowPlaying[index];

                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            MovieImage(url: movie.image),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black87],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              right: 12,
                              bottom: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Action  •  Adventure  •  Comedy',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Enjoy the latest movies and discover '
                                    'your favorite stories.',
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 48,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: 230,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                      ),
                    ),
                  ],
                ),
              ),

              // MOVIE SECTIONS
              MovieSection(title: 'Trending', movies: trending),
              MovieSection(title: 'Popular', movies: popular),
              MovieSection(title: 'Top Rated', movies: topRated),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION - tampilan saja
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF111111),
          border: Border(top: BorderSide(color: Colors.white12)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF111111),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 9,
          unselectedFontSize: 9,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 17),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view, size: 17),
              label: 'Genre',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 17),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }
}

class MovieSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const MovieSection({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 3, 10, 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const Text(
                'More',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 135,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              final movie = movies[index];

              return Container(
                width: 88,
                margin: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SizedBox(
                          width: 88,
                          child: MovieImage(url: movie.image),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}

class MovieImage extends StatelessWidget {
  final String url;

  const MovieImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFF292929),
          child: const Center(
            child: Icon(Icons.movie, color: Colors.white38, size: 30),
          ),
        );
      },
    );
  }
}
