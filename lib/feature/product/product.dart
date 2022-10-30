import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/product/data/repository_impl/product_repository_impl.dart';
import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';
import 'package:smm_apps/feature/product/presentation/bloc/bloc/product_bloc.dart';

import 'presentation/ui/search_screen.dart';

class FeatureProductModule extends Module {
  final _namedRoutes = Modular.get<NameRoutes>();

  @override
  List<Bind> get binds => [
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
