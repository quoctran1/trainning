import 'package:trainning/utils/flavor_configs.dart';

Map<Flavor, Map<String, dynamic>> env = {
  Flavor.dev: <String, dynamic>{
    'baseUrl': 'https://www.dev.faceboook.com',
  },
  Flavor.prod: <String, dynamic>{
    'baseUrl': 'https://www.faceboook.com',
  },
};
