import 'package:flutter/material.dart';

class Article {
  final String title;
  final String author;
  final String date;
  final String image;
  final String body;

  Article({
    required this.title,
    required this.author,
    required this.date,
    required this.image,
    required this.body,
  });
}

class ArticleListPage extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: 'Heart Health',
      author: 'John Doe',
      date: 'January 1, 2023',
      image: 'assets/Article1.png',
      body:
          'Regular physical activity improves cardiovascular health, strengthens the heart, and reduces the risk of heart diseases.',
    ),
    Article(
      title: 'Bone Health',
      author: 'Jane Smith',
      date: 'February 15, 2023',
      image: 'assets/Article2.jpg',
      body:
          'Weight-bearing exercises contribute to bone health, maintaining density and reducing the risk of osteoporosis.',
    ),
    Article(
      title: 'Increased Energy Levels',
      author: 'Jone Kale',
      date: 'June 2, 2023',
      image: 'assets/Article3.jpg',
      body:
          'Exercise boosts energy levels, improving cardiovascular efficiency and overall stamina.',
    ),
    Article(
      title: 'Improved Sleep',
      author: 'Harry Swith',
      date: 'February 20, 2023',
      image: 'assets/Article4.png',
      body:
          'Regular physical activity helps regulate sleep cycles, offering a non-pharmacological approach to managing sleep disorders.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Articles',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(article: articles[index]);
        },
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            child: Image.asset(
              article.image,
              width: 120.0,
              height: 180.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'By ${article.author} | ${article.date}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        article.body,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
