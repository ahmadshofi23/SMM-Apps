import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/forecast/data/repository_impl/forecast_repository_impl.dart';
import 'package:smm_apps/feature/forecast/domain/repository/forecast_repository.dart';
import 'package:smm_apps/feature/forecast/domain/usecase/forecast_usecase.dart';
import 'package:smm_apps/feature/login/data/datasource/remote/remote_login_data_source.dart';
import 'package:smm_apps/feature/login/data/repository_impl/login_repository_impl.dart';
import 'package:smm_apps/feature/login/domain/repository/login_repository.dart';
import 'package:smm_apps/feature/login/domain/usecase/login_usecase.dart';
import 'package:smm_apps/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:smm_apps/feature/login/presentation/ui/login_screen.dart';
import 'package:smm_apps/feature/product/data/repository_impl/product_repository_impl.dart';
import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';
import 'package:smm_apps/feature/product/presentation/bloc/bloc/product_bloc.dart';
import 'package:smm_apps/feature/product/presentation/ui/search_screen.dart';

class FeatureLoginModule extends Module {
  final _namedRoutes = Modular.get<NameRoutes>();

  @override
  List<Bind> get binds => [
        Bind((_) => NameRoutes(), export: true),
        Bind((_) => RemoteLoginDataSourceImpl()),
        Bind((_) => LoginRepositoryImpl(
            remoteLoginDataSource: Modular.get<RemoteLoginDataSource>())),
        Bind((_) =>
            LoginUseCaseImpl(loginRepository: Modular.get<LoginRepository>())),
        Bind(
          (_) => ProductRepositoryImpl(),
        ),
        Bind(
          (_) => ProductUseCaseImpl(
            productRepository: Modular.get<ProductRepository>(),
          ),
        ),
        Bind((_) => ForeCastRepositoryImpl()),
        Bind((_) => ForeCastUseCaseImpl(
            forecastRepository: Modular.get<ForecastRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => BlocProvider(
            create: (context) =>
                LoginBloc(useCase: Modular.get<LoginUseCase>()),
            child: const LoginScreen(),
          ),
        ),
        ChildRoute(
          _namedRoutes.mainProdcutScreen,
          child: (context, args) => BlocProvider(
            create: (context) => ProductBloc(
              useCase: Modular.get<ProductUseCase>(),
            ),
            child: const SearchScreen(),
          ),
        ),
      ];
}
