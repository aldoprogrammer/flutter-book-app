import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookDetails extends StatefulWidget {
  final Book book;
  const BookDetails({super.key, required this.book});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool isFavorite = false;
  bool isChart = false; // Manage this state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerParts(context),
      body: isChart ? buildChartView() : buildListView(),
    );
  }

  PreferredSize headerParts(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              )),
          actions: [
            const Icon(
              Icons.file_upload,
              color: Colors.black,
              size: 25,
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
                size: 25,
              ),
            ),
            const SizedBox(width: 25),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       isChart = !isChart;
            //     });
            //   },
            //   child: Icon(
            //     isChart ? Icons.view_list : Icons.show_chart,
            //     color: Colors.black,
            //     size: 25,
            //   ),
            // ),
            const SizedBox(width: 25)
          ],
        ));
  }

  Widget buildListView() {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    widget.book.cover,
                    fit: BoxFit.fill,
                    height: 260,
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          widget.book.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black45,
                          ),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                              widget.book.authorImg,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.book.author,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: widget.book.rating
                                .toDouble(), // Ensure the rating is a double
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.book.rating.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  height: 110,
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Row(
                          children: [
                            Image.network(
                              "",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }

  Widget buildChartView() {
    // Replace this with your chart view implementation
    return const Center(
      child: Text('Chart View Not Implemented'),
    );
  }
}
