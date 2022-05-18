import 'data/repository/repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/remote_datasource.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<RemoteDatasource>(RemoteDatasource());

  getIt.registerSingleton<RepositoryImpl>(RepositoryImpl(
    getIt.get<RemoteDatasource>(),
  ));
}
