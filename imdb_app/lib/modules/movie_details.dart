import 'package:flutter/material.dart';
import '../data/models/actors.dart';

class MovieDetails extends StatelessWidget {
  // This widget is the root of your application.

  static List<Actor> actors = [
    Actor('Mathew McConnagay', 'Cooper', 'assets/images/actor1.png'),
    Actor('Anne Hathaway', 'Brand', 'assets/images/actor2.png'),
    Actor('Jessica Chastain', 'Murph', 'assets/images/actor3.png')
  ];

  @override
  Widget build(BuildContext context) {
    Widget headerSection = Container(
      padding: const EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      height: 80,
      width: double.infinity,
      color: Color(0xFF393939),
      child: Image.asset('assets/images/imbd.png', width: 100, height: 60),
    );

    Widget titleSection = Text(
      'Interstellar',
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 36, color: Color(0xFFFFFFFF)),
    );

    Widget tagLabel(String text) {
      return Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color(0xFF909090)),
      );
    }

    Widget tagsSection = Row(children: [
      tagLabel('2014 | '),
      tagLabel('PG-13 | '),
      tagLabel('2h 49min | '),
      tagLabel('Adventure,Drama,Sci-fi')
    ]);

    Widget movieDescription(String text) {
      return Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        maxLines: 20,
        style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Color(0xFFFFFFFF)),
      );
    }

    Widget movieImage =
        Image.asset('assets/images/interstellar.png', width: 125, height: 250);

    Widget ratingsText(String text) {
      return Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white));
    }

    Widget ratingSubText(String text) {
      return Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: Color(0xFF909090)));
    }

    Widget descriptionSection = Container(
      alignment: Alignment.centerLeft,
      height: 300,
      width: double.infinity,
      child: Row(children: [
        movieImage,
        SizedBox(width: 10),
        Expanded(
            child: movieDescription(
                'A team of explorers travel through a wormhole in space in attempt to ensure humanity s survival'))
      ]),
    );

    Widget globalRatingsContainer = Container(
      alignment: Alignment.topCenter,
      height: 75,
      width: 75,
      child: Column(children: [
        Image.asset('assets/images/rating-star.png', width: 25, height: 25),
        SizedBox(height: 5),
        ratingsText('8.6/10'),
        ratingSubText('1.1M')
      ]),
    );

    Widget userRatingContainer = Container(
      alignment: Alignment.topCenter,
      height: 75,
      width: 75,
      child: Column(children: [
        Image.asset('assets/images/empty-star.png', width: 25, height: 25),
        SizedBox(height: 5),
        ratingsText('Rate this'),
      ]),
    );

    Widget metascoreRatingContainer = Container(
      padding: const EdgeInsets.only(top: 5),
      alignment: Alignment.topCenter,
      height: 75,
      width: 125,
      child: Column(children: [
        Text('72',
            style: const TextStyle(
                backgroundColor: Color(0xFF00E676),
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        ratingsText('Metascore'),
        ratingSubText('critic reviews')
      ]),
    );

    Widget ratingsContainer = Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 75,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        globalRatingsContainer,
        userRatingContainer,
        metascoreRatingContainer,
      ]),
    );

    Widget spacingContainer = Container(
      height: 20,
      width: double.infinity,
      color: Colors.black,
    );

    Widget bodySection = Container(
      padding: const EdgeInsets.all(10),
      // alignment: Alignment.centerLeft,
      height: 460,
      width: double.infinity,
      color: Color(0xFF212121),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        titleSection,
        tagsSection,
        descriptionSection,
        ratingsContainer,
      ]),
    );

    Widget actorsTitlesContainer = Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: 40,
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Top Billed Cast',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {},
          child: const Text('SEE ALL'),
        ),
      ]),
    );

    Widget actorTile(BuildContext context, Actor actor) {
      Widget actorNames = Container(
        width: 225,
        height: 50,
        alignment: Alignment.center,
        color: Color(0xFF393939),
        child: Column(children: [
          Text(actor.fullName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white)),
          Text(
            actor.characterName,
            style: const TextStyle(fontSize: 16, color: Color(0xFF909090)),
          )
        ]),
      );

      return Container(
        child: Column(children: [
          SizedBox(
              height: 375,
              child: Image.asset(actor.imageUrl, width: 225, height: 375)),
          SizedBox(height: 50, child: actorNames)
        ]),
      );
    }

    Widget actorsListView = ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];

          return actorTile(context, actor);
        });

    Widget actorsContainer = Container(
      alignment: Alignment.centerLeft,
      height: 650,
      width: double.infinity,
      color: Color(0xFF212121),
      child: Column(children: [
        actorsTitlesContainer,
        Expanded(child: SizedBox(height: 425, child: actorsListView))
      ]),
    );

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Interstellar'),
            backgroundColor: Color(0xFF303030),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                headerSection,
                bodySection,
                spacingContainer,
                actorsContainer,
              ],
            ),
          ))),
    );
  }
}
