import 'package:trainning/utils/env.dart';

enum Flavor { dev, prod }

class FlavorValues {
  late String baseUrl;

  factory FlavorValues(Flavor flavor) {
    return FlavorValues.fromJson(env[flavor]!);
  }

  FlavorValues.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'];
  }
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;
  static FlavorConfig? instance;

  factory FlavorConfig({required Flavor flavor}) {
    instance ??= FlavorConfig._internal(flavor, FlavorValues(flavor));
    return instance!;
  }

  FlavorConfig._internal(this.flavor, this.values);
}
