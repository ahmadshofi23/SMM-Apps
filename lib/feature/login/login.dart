import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/nameRoutes.dart';
import 'package:smm_apps/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:smm_apps/feature/login/presentation/ui/login_screen.dart';
import 'package:smm_apps/feature/product/data/repository_impl/product_repository_impl.dart';
import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';

class FeatureLoginModule extends Module {
  final _namedRoutes = Modular.get<NameRoutes>();

  @override
  List<Bind> get binds => [
        Bind((_) => NameRoutes(), export: true),
        Bind(
          (_) => ProductRepositoryImpl(),
        ),
        Bind(
          (_) => ProductUseCaseImpl(
            productRepository: Modular.get<ProductRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginScreen(),
          ),
        )
      ];
}
