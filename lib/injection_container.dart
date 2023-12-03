import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //cubit
    /*..registerFactory<HomeCubit>(() => HomeCubit(getCoinListUseCase: sl()))
    ..registerFactory<RegisterCubit>(() => RegisterCubit(registerUseCase: sl()))
    ..registerFactory<LoginCubit>(
        () => LoginCubit(signInEmailPasswordUseCase: sl()))*/

    //user Case
    /*..registerFactory<SignInEmailPasswordUseCase>(
      () => SignInEmailPasswordUseCase(loginRepository: sl()),
    )
    ..registerFactory<RegisterUseCase>(
      () => RegisterUseCase(registerRepository: sl()),
    )
    ..registerFactory<GetCoinListUseCase>(
      () => GetCoinListUseCase(homeRepository: sl()),
    )*/

    //Repository
    /*..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()),
    )
    ..registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSource: sl()),
    )
    ..registerFactory<RegisterRepository>(
      () => RegisterRepositoryImpl(registerDataSource: sl()),
    )*/
    //Dara source
    /*..registerFactory<HomeDataSource>(() => HomeDataSourceImpl(db: sl()))
    ..registerFactory<LoginDataSource>(
      () => LoginDataSourceImpl(db: sl(), auth: sl()),
    )
    ..registerFactory<RegisterDataSource>(
      () => RegisterDataSourceImpl(firestore: sl(), auth: sl()),
    )*/
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
