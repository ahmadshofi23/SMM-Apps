import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smm_apps/core/utils/share_module.dart';
import 'package:smm_apps/feature/forecast/domain/usecase/forecast_usecase.dart';
import 'package:smm_apps/feature/forecast/forecast.dart';
import 'package:smm_apps/feature/forecast/presentation/bloc/bloc/forecast_bloc.dart';
import 'package:smm_apps/feature/login/data/datasource/local/authentication_preferences.dart';
import 'package:smm_apps/feature/login/domain/usecase/login_usecase.dart';
import 'package:smm_apps/feature/login/login.dart';
import 'package:smm_apps/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';
import 'package:smm_apps/feature/product/presentation/bloc/product_bloc.dart';
import 'package:smm_apps/feature/product/product.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
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
        Bind((_) => AuthenticationPreferences(
            sharedPreferences: Modular.get<SharedPreferences>())),
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
        ModuleRoute(
          Modular.get<NameRoutes>().detailProduct,
          module: ForeCastModule(),
        ),
        ModuleRoute(
          Modular.get<NameRoutes>().mainProfileScreen,
          module: FeatureProfileModule(),
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
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            useCase: Modular.get<LoginUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            useCase: Modular.get<ProductUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ForecastBloc(
            useCase: Modular.get<ForecastUseCase>(),
          ),
        ),
      ],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: Size(375, 812),
            builder: (context, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: GoogleFonts.manrope().fontFamily,
                // primarySwatch: Colors.blue,
              ),
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
            ),
          );
        },
      ),
    );
  }
}
