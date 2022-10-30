import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/core/utils/nameRoutes.dart';

class ShareModule extends Module {
  ShareModule();

  @override
  List<Bind> get binds => [
        Bind((_) => NameRoutes(), export: true),
      ];

  List<ModularRoute> get routers => [];
}
