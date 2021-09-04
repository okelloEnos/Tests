import 'package:flutter/material.dart';
import 'package:test_practice/fetch_data.dart';
import 'package:test_practice/model/album.dart';
import 'package:http/http.dart' as http;

class AlbumDisplay extends StatefulWidget {
  const AlbumDisplay({Key? key}) : super(key: key);

  @override
  _AlbumDisplayState createState() => _AlbumDisplayState();
}

class _AlbumDisplayState extends State<AlbumDisplay> {

  late Future<Album> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      futureAlbum = fetchAlbum(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Albums'),
      ),
      body: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
