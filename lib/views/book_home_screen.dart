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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                : const SizedBox
                                    .shrink(); // If not a seller, return an empty widget
                          }),
                    ),
                    BestSeller(),
                    const Text(
                      "Best Sellers",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const Divider(
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Book List",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 325,
                    child: ListView.builder(
                      itemCount: booklist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final book = booklist[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    book.cover,
                                    height: 220,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  SizedBox BestSeller() {
    return const SizedBox(
      height: 15,
    );
  }
}
