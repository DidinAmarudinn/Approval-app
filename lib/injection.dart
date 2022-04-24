import 'package:approval_app/data/datasource/approval_local_datasource.dart';
import 'package:approval_app/data/datasource/approval_remote_datasource.dart';
import 'package:approval_app/data/repositories/approval_repositories_impl.dart';
import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:approval_app/domain/usecases/do_login.dart';
import 'package:approval_app/domain/usecases/get_data_login.dart';
import 'package:approval_app/domain/usecases/get_detail_approval.dart';
import 'package:approval_app/domain/usecases/get_list_approval.dart';
import 'package:approval_app/domain/usecases/get_module.dart';
import 'package:approval_app/presentation/provider/approval_notifier.dart';
import 'package:approval_app/presentation/provider/detail_approval_notifier.dart';
import 'package:approval_app/presentation/provider/login_notifier.dart';
import 'package:approval_app/presentation/provider/main_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // provider
  locator.registerFactory(
    () => LoginNotifier(
      doLogin: locator(),
    ),
  );
  locator.registerFactory(
    () => MainNotifier(getDataLogin: locator(), getModele: locator()),
  );
  locator.registerFactory(
    () => ApprovalNotfier(getListApproval: locator()),
  );
  locator.registerFactory(
      () => DetailApprovalNotfier(getDetailApproval: locator()));

  // use case
  locator.registerLazySingleton(() => DoLogin(locator()));
  locator.registerLazySingleton(() => GetDataLogin(repository: locator()));
  locator.registerLazySingleton(() => GetModele(locator()));
  locator.registerLazySingleton(() => GetListApproval(locator()));
  locator.registerLazySingleton(() => GetDetailApproval(locator()));
  // repository
  locator.registerLazySingleton<ApprovalRepository>(
    () => ApprovalRepositoryImpl(
        remoteDataSource: locator(), localDataSource: locator()),
  );

  // datasource
  locator.registerLazySingleton<ApprovalRemoteDataSource>(
    () => ApprovalRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<ApprovalLocalDataSource>(
    () => ApprovalLocalDataSourceImpl(
      sharedPreferences: locator(),
    ),
  );

  //external
  locator.registerLazySingleton(() => http.Client());
  await _initSharedPref();
}

Future<void> _initSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPref);
}
