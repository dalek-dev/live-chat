// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/authentication/login/application/login_service.dart' as _i7;
import '../features/authentication/login/domain/repository/login_repository.dart'
    as _i5;
import '../features/authentication/login/infraestructure/datasources/login_remote_data_sources.dart'
    as _i4;
import '../features/authentication/login/infraestructure/repository/login_repository_impl.dart'
    as _i6;
import '../features/authentication/login/login_store.dart' as _i8;
import '../features/authentication/login/presentation/cubit/auth_cubit.dart'
    as _i16;
import '../features/authentication/signup/application/signup_service.dart'
    as _i13;
import '../features/authentication/signup/domain/repository/signup_repository.dart'
    as _i11;
import '../features/authentication/signup/infraestructure/datasources/signup_remote_data_source.dart'
    as _i10;
import '../features/authentication/signup/infraestructure/repository/signup_repository_impl.dart'
    as _i12;
import '../features/authentication/signup/presentation/cubit/signup_cubit.dart'
    as _i15;
import '../features/authentication/signup/signup_store.dart' as _i14;
import '../features/commons/sockets/presentation/cubit/connect_cubit.dart'
    as _i3;
import '../features/messages/application/message_service.dart' as _i19;
import '../features/messages/domain/repository/message_repository.dart' as _i17;
import '../features/messages/infraestructure/infraestructure/messages_remote_data_source.dart'
    as _i9;
import '../features/messages/infraestructure/repository/message_repository_impl.dart'
    as _i18;
import '../features/messages/presentation/cubit/message_private_cubit.dart'
    as _i21;
import '../features/messages/presentation/cubit/users_cubit.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ConnectCubit>(() => _i3.ConnectCubit());
  gh.lazySingleton<_i4.LoginRemoteDataSources>(
      () => _i4.LoginRemoteDataSourceImpl());
  gh.lazySingleton<_i5.LoginRepository>(() => _i6.LoginRepositoryImpl(
      remoteDataSource: get<_i4.LoginRemoteDataSources>()));
  gh.lazySingleton<_i7.LoginService>(
      () => _i7.LoginService(repository: get<_i5.LoginRepository>()));
  gh.lazySingleton<_i8.LoginStore>(() => _i8.LoginStore());
  gh.lazySingleton<_i9.MessagesRemoteDataSource>(
      () => _i9.MessagesRemoteDataSourceImpl());
  gh.lazySingleton<_i10.SignUpRemoteDataSource>(
      () => _i10.SignUpRemoteDataSourceImpl());
  gh.lazySingleton<_i11.SignUpRepository>(() => _i12.SignUpRepositoryImpl(
      remoteDataSource: get<_i10.SignUpRemoteDataSource>()));
  gh.lazySingleton<_i13.SignUpService>(
      () => _i13.SignUpService(repository: get<_i11.SignUpRepository>()));
  gh.lazySingleton<_i14.SignUpStore>(() => _i14.SignUpStore());
  gh.factory<_i15.SignupCubit>(
      () => _i15.SignupCubit(service: get<_i13.SignUpService>()));
  gh.factory<_i16.AuthCubit>(
      () => _i16.AuthCubit(service: get<_i7.LoginService>()));
  gh.lazySingleton<_i17.MessageRepository>(() => _i18.MessageRepositoryImpl(
      remoteDataSource: get<_i9.MessagesRemoteDataSource>()));
  gh.lazySingleton<_i19.MessageService>(
      () => _i19.MessageService(repository: get<_i17.MessageRepository>()));
  gh.factory<_i20.UsersCubit>(
      () => _i20.UsersCubit(service: get<_i19.MessageService>()));
  gh.factory<_i21.MessagePrivateCubit>(
      () => _i21.MessagePrivateCubit(service: get<_i19.MessageService>()));
  return get;
}
