import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/forecast/data/repository_impl/forecast_repository_impl.dart';
import 'package:smm_apps/feature/forecast/domain/repository/forecast_repository.dart';
import 'package:smm_apps/feature/forecast/domain/usecase/forecast_usecase.dart';
import 'package:smm_apps/feature/forecast/presentation/bloc/bloc/forecast_bloc.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/forecast_chart_screen.dart';
import 'package:smm_apps/feature/product/presentation/ui/detail_product_screen.dart';

class ForeCastModule extends Module {
  final _namedRoutes = Modular.get<NameRoutes>();

  @override
  List<Bind> get binds => [
        Bind(
          (_) => ForeCastRepositoryImpl(),
        ),
        Bind(
          (_) => ForeCastUseCaseImpl(
            forecastRepository: Modular.get<ForecastRepository>(),
          ),
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
            child: const DetailProductScreen(),
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
        // ChildRoute(
        //   _namedRoutes.forecastList,
        //   child: (context, args) => BlocProvider(
        //     create: (context) => ForecastBloc(
        //       useCase: Modular.get<ForecastUseCase>(),
        //     ),
        //     child: ,
        //   ),
        // ),
      ];
}
