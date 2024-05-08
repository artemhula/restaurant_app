import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant/features/auth/data/datasource/firebase_auth_datasource.dart';
import 'package:restaurant/features/auth/data/datasource/firestore_datasource.dart';
import 'package:restaurant/features/auth/data/datasource/local_datasource.dart';
import 'package:restaurant/features/auth/data/repository/auth_repository.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';
import 'package:restaurant/features/auth/domain/usecases/check_otp.dart';
import 'package:restaurant/features/auth/domain/usecases/check_user.dart';
import 'package:restaurant/features/auth/domain/usecases/get_user.dart';
import 'package:restaurant/features/auth/domain/usecases/leave_user.dart';
import 'package:restaurant/features/auth/domain/usecases/register_user.dart';
import 'package:restaurant/features/auth/domain/usecases/send_otp.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/menu/data/datasource/remote_datasource.dart';
import 'package:restaurant/features/menu/data/repository/product_repository.dart';
import 'package:restaurant/features/menu/domain/repository/product_repository.dart';
import 'package:restaurant/features/menu/domain/usecases/get_products.dart';
import 'package:restaurant/features/menu/presentation/bloc/product_cubit/product_cubit.dart';
import 'package:restaurant/utils/firebase_options.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //blocs
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl(), sl()));
  sl.registerFactory<RegistrationCubit>(
      () => RegistrationCubit(sl(), sl(), sl()));
  sl.registerFactory<UserCubit>(() => UserCubit(sl(), sl()));
  sl.registerFactory<ProductCubit>(() => ProductCubit(sl()));

  //usecases
  sl.registerLazySingleton(() => SendOtp(authRepository: sl()));
  sl.registerLazySingleton(() => CheckOtp(authRepository: sl()));
  sl.registerLazySingleton(() => CheckUser(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUser(authRepository: sl()));
  sl.registerLazySingleton(() => GetUser(authRepository: sl()));
  sl.registerLazySingleton(() => LeaveUser(authRepository: sl()));
  sl.registerLazySingleton(() => GetProducts(productRepository: sl()));

  //repo and ds
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<FirebaseAuthDataSource>(
      () => FirebaseAuthDataSourceImpl(sl()));
  sl.registerLazySingleton<FireStoreDataSource>(
      () => FireStoreDataSourceImpl(sl()));
  sl.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImpl
      (box: sl(instanceName: 'userBox')));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(dio: sl()));

  //ext
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  await Hive.initFlutter();
  await Hive.openBox('usfe');
  sl.registerLazySingleton(() => Hive.box('usfe'), instanceName: 'userBox');
  sl.registerLazySingleton(() => Dio());
}
