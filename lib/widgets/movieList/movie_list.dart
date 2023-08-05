import 'package:flutter/material.dart';

class Movie {
  final String imageName;
  final String title;
  final String date;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.date,
    required this.description,
  });
}

class MovieList extends StatefulWidget {
  MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _movieList = [
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Oppenheimer',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Mortal Combat',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Interstellar',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Mission Impossible',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Memento',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Hero',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Free',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
    Movie(
      imageName: 'assets/images/Oppenheimer.jpg',
      title: 'Doom',
      date: '19 July 2023',
      description:
          'Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they\'ve ever faced: A terrifying threat emerging from the shadows of the past who\'s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.',
    ),
  ];
  var fillteredMovies = <Movie>[];
  final _searchController = TextEditingController();
  void searchMovies() {
    if (_searchController.text.isNotEmpty) {
      fillteredMovies = _movieList.where((Movie movie) {
        return movie.title
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    } else {
      fillteredMovies = _movieList;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fillteredMovies = _movieList;
    _searchController.addListener(searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70),
          itemCount: fillteredMovies.length,
          itemExtent: 200,
          itemBuilder: (context, index) {
            final movie = fillteredMovies[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image.asset(
                          movie.imageName,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  movie.date,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    movie.description,
                                    style: TextStyle(fontSize: 18),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => print('11'),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  labelText: 'Search',
                  filled: true,
                  fillColor: Colors.white.withAlpha(235),
                  border: OutlineInputBorder())),
        )
      ],
    );
  }
}
