import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';

class BooksHome extends StatelessWidget {
  const BooksHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    Icons.book,
                    size: 35,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Text(
                    "Book App",
                    style: TextStyle(fontSize: 30),
                  ))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(children: [
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: booklist.length,
                      itemBuilder: (context, index) {
                        final book = booklist[index];
                        return book.seller
                            ? GestureDetector(
                                onTap: () {
                                  // Handle tap event here
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      book.showImage,
                                      height: 250,
                                      width: 350,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox
                                .shrink(); // If not a seller, return an empty widget
                      }),
                )
              ]),
            )
          ],
        ));
  }
}
