import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant/features/auth/data/datasource/firebase_datasource.dart';
import 'package:restaurant/features/auth/data/repository/auth_repository.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';
import 'package:restaurant/features/auth/domain/usecases/check_otp.dart';
import 'package:restaurant/features/auth/domain/usecases/send_otp.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/firebase_options.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //blocs
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl(), sl()));

  //usecases
  sl.registerLazySingleton(() => SendOtp(authRepository: sl()));
  sl.registerLazySingleton(() => CheckOtp(authRepository: sl()));

  //repo and ds
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<FirebaseDataSource>(
      () => FirebaseDataSourceImpl(sl()));

  //ext
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
