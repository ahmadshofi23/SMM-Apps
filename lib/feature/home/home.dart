import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:smm_apps/feature/home/presentation/ui/home_screen.dart';

class HomeModule extends Module {
  final _namedRoutes = Modular.get<NameRoutes>();
  @override
  List<Bind> get binds => [
        // Bind(
        //   (_) => ProductRepositoryImpl(),
        // ),
        // Bind(
        //   (_) => ProductUseCaseImpl(
        //     productRepository: Modular.get<ProductRepository>(),
        //   ),
        // ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          _namedRoutes.homeScreen,
          child: (context, args) => BlocProvider(
            create: (context) => HomeBloc(
                // useCase: Modular.get<ProductUseCase>(),
                ),
            child: const HomeScreen(),
          ),
        ),
      ];
}
