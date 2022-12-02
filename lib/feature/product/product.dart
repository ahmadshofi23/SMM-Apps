import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/forecast/data/repository_impl/forecast_repository_impl.dart';
import 'package:smm_apps/feature/forecast/domain/repository/forecast_repository.dart';
import 'package:smm_apps/feature/forecast/domain/usecase/forecast_usecase.dart';
import 'package:smm_apps/feature/forecast/presentation/bloc/bloc/forecast_bloc.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/forecast_chart_screen.dart';
import 'package:smm_apps/feature/product/data/remote/remote_product_dataSource.dart';
import 'package:smm_apps/feature/product/data/repository_impl/product_repository_impl.dart';
import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';
import 'package:smm_apps/feature/product/presentation/bloc/product_bloc.dart';

import 'presentation/ui/search_screen.dart';

class FeatureProductModule extends Module {
  final _namedRoutes = Modular.get<NameRoutes>();

  @override
  List<Bind> get binds => [
        Bind((_) => RemoteProductDataSourceImpl()),
        Bind(
          (_) => ProductRepositoryImpl(
            remoteProductDataSource: Modular.get<RemoteProductDataSource>(),
          ),
        ),
        Bind(
          (_) => ProductUseCaseImpl(
            productRepository: Modular.get<ProductRepository>(),
          ),
        ),
        Bind(
          (_) => ForeCastRepositoryImpl(),
        ),
        Bind(
          (_) => ForeCastUseCaseImpl(
              forecastRepository: Modular.get<ForecastRepository>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          _namedRoutes.detailProduct,
          child: (context, args) => BlocProvider(
            create: (context) => ForecastBloc(
              useCase: Modular.get<ForecastUseCase>(),
            ),
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
        ChildRoute(
          _namedRoutes.forecastList,
          child: (context, args) => BlocProvider(
            create: (context) => ForecastBloc(
              useCase: Modular.get<ForecastUseCase>(),
            ),
            child: const ForecastChartScreen(),
          ),
        ),
      ];
}
