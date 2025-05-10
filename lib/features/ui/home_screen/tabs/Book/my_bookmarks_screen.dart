import 'package:flutter/material.dart';
import '../../../../../core/utils/bookmark_card.dart';
import '../../../../../core/utils/bookmark_item.dart';
import 'bookmark_service.dart';

class MyBookmarksScreen extends StatefulWidget {
  const MyBookmarksScreen({super.key});

  @override
  State<MyBookmarksScreen> createState() => _MyBookmarksScreenState();
}

class _MyBookmarksScreenState extends State<MyBookmarksScreen> {
  late Future<List<BookmarkItem>> _futureBookmarks;
  final BookmarkService _bookmarkService = BookmarkService();
  final String userId = 'USER_ID';
  @override
  void initState() {
    super.initState();
    _futureBookmarks = _bookmarkService.fetchBookmarks(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My bookmarks'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(221, 255, 255, 255),
      body: FutureBuilder<List<BookmarkItem>>(
        future: _futureBookmarks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 13, 13, 13)));
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style:
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0))));
          } else if (snapshot.hasData) {
            final bookmarks = snapshot.data!;
            return ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                return BookmarkCard(bookmark: bookmarks[index]);
              },
            );
          } else {
            return const Center(
                child: Text('No bookmarks yet.',
                    style: TextStyle(color: Color.fromARGB(255, 2, 2, 2))));
          }
        },
      ),
    );
  }
}
