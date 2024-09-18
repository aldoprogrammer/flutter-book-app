// import 'dart:ffi';

import 'package:book_app/models/book.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
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
                onTap: () {},
                child: const Icon(
                  Icons.favorite,
                  size: 25,
                ),
              )
            ],
          )),
    );
  }
}
