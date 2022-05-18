abstract class ApiRepository {
  Future uploadImage(Map<String, dynamic> data);
  Future createEvent(Map<String, dynamic> data);
  Future updateEvent(Map<String, dynamic> data);
}
