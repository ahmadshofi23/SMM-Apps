import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smm_apps/core/utils/share_module.dart';
import 'package:smm_apps/feature/login/login.dart';
import 'package:smm_apps/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';
import 'package:smm_apps/feature/product/presentation/bloc/bloc/product_bloc.dart';
// import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';
// import 'package:smm_apps/feature/product/presentation/bloc/bloc/product_bloc.dart';
import 'package:smm_apps/feature/product/product.dart';
import 'package:smm_apps/core/utils/common.dart';

void main() async {
  await runZonedGuarded(() async {
    runApp(
      ModularApp(module: AppModule(), child: SmmApps()),
    );
  }, ((error, stack) {
    print(error.toString());
    print(stack.toString());
  }));
}

class AppModule extends Module {
  @override
  List<Module> get imports => [
        ShareModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind((_) => NameRoutes(), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.get<NameRoutes>().loginScreen,
          module: FeatureLoginModule(),
        ),
        ModuleRoute(
          Modular.get<NameRoutes>().mainProdcutScreen,
          module: FeatureProductModule(),
        ),
      ];
}

class SmmApps extends StatefulWidget {
  const SmmApps({Key? key}) : super(key: key);

  @override
  State<SmmApps> createState() => _SmmAppsState();
}

class _SmmAppsState extends State<SmmApps> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    Modular.setInitialRoute(Modular.get<NameRoutes>().loginScreen);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            useCase: Modular.get<ProductUseCase>(),
          ),
        ),
      ],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: GoogleFonts.manrope().fontFamily,
              // primarySwatch: Colors.blue,
            ),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        },
      ),
    );
  }
}
