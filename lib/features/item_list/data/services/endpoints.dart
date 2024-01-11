abstract class Endpoints{

  static String get serviceAddress => 'https://jsonplaceholder.typicode.com';

  static String getAlbumById(int id){
    return '/albums/$id/photos';
  }

}