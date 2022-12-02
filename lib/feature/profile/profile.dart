import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:smm_apps/feature/profile/presentation/ui/profile_main_screen.dart';

class FeatureProfileModule extends Module {
  final _namedRoutes = Modular.get<NameRoutes>();

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          _namedRoutes.mainProfileScreen,
          child: (context, args) => BlocProvider(
            create: (context) => ProfileBloc(
                // useCase: Modular.get<ForecastUseCase>(),
                ),
            child: const ProfileMainScreen(),
          ),
        ),
      ];
}
