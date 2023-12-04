import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r5/features/home/data/data_sources/home_data_source.dart';
import 'package:r5/features/home/data/repositories/home_repository_impl.dart';
import 'package:r5/features/home/domain/repositories/home_auth_repository.dart';
import 'package:r5/features/home/domain/usecases/get_task_list_use_case.dart';
import 'package:r5/features/home/presentation/cubit/home_cubit.dart';
import 'package:r5/features/login/data/data_sources/login_data_source.dart';
import 'package:r5/features/login/data/repositories/login_repository_impl.dart';
import 'package:r5/features/login/domain/repositories/login_repository.dart';
import 'package:r5/features/login/domain/usecases/sign_in_email_password_use_case.dart';
import 'package:r5/features/login/presentation/cubit/login_cubit.dart';
import 'package:r5/features/register/data/data_sources/register_data_source.dart';
import 'package:r5/features/register/data/repositories/register_repository_impl.dart';
import 'package:r5/features/register/domain/repositories/social_auth_repository.dart';
import 'package:r5/features/register/domain/usecases/register_use_case.dart';
import 'package:r5/features/register/presentation/cubit/register_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //cubit
    ..registerFactory<HomeCubit>(() => HomeCubit(getTaskListUseCase: sl()))
    ..registerFactory<RegisterCubit>(() => RegisterCubit(registerUseCase: sl()))
    ..registerFactory<LoginCubit>(
        () => LoginCubit(signInEmailPasswordUseCase: sl()))

    //user Case
    ..registerFactory<SignInEmailPasswordUseCase>(
      () => SignInEmailPasswordUseCase(loginRepository: sl()),
    )
    ..registerFactory<RegisterUseCase>(
      () => RegisterUseCase(registerRepository: sl()),
    )
    ..registerFactory<GetTaskListUseCase>(
      () => GetTaskListUseCase(homeRepository: sl()),
    )

    //Repository
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()),
    )
    ..registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSource: sl()),
    )
    ..registerFactory<RegisterRepository>(
      () => RegisterRepositoryImpl(registerDataSource: sl()),
    )
    //Dara source
    ..registerFactory<HomeDataSource>(() => HomeDataSourceImpl(db: sl()))
    ..registerFactory<LoginDataSource>(
      () => LoginDataSourceImpl(db: sl(), auth: sl()),
    )
    ..registerFactory<RegisterDataSource>(
      () => RegisterDataSourceImpl(firestore: sl(), auth: sl()),
    )
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
