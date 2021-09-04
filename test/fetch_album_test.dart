import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:test_practice/fetch_data.dart';
import 'package:test_practice/model/album.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){

  group('Fetch Album', (){
    test('returns an album if the http call is successful', () async{

      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
      .thenAnswer((_) async => http.Response('{"userId" : 1, "id" : 2, "title": "mock"}', 200));
      
      expect(await fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call failed', (){

      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(
          client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
      .thenAnswer((_) async => http.Response('Not Found', 404));
      
      expect(fetchAlbum(client), throwsException);
    });
  });
}