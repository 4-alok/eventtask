import '../datasource/remote_datasource.dart';
import 'api_repository.dart';

class RepositoryImpl implements ApiRepository {
  final RemoteDatasource remoteDatasource;
  RepositoryImpl(this.remoteDatasource);

  @override
  Future createEvent(Map<String, dynamic> data) {
    return remoteDatasource.createEvent(data);
  }

  @override
  Future updateEvent(Map<String, dynamic> data) {
    return remoteDatasource.updateEvent(data);
  }
  
  @override
  Future uploadImage(Map<String, dynamic> data) {
    return remoteDatasource.uploadImage(data);
  }
}
