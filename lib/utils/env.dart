import 'package:trainning/utils/flavor_configs.dart';

Map<Flavor, Map<String, dynamic>> env = {
  Flavor.dev: <String, dynamic>{
    'baseUrl': 'https://www.google.com',
  },
  Flavor.prod: <String, dynamic>{
    'baseUrl': 'https://www.apple.com/vn/store',
  },
};
