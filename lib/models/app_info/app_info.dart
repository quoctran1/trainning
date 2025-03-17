class AppInfo {
  Info? info;

  AppInfo(this.info);

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(Info.fromJson(json));
  }
}

class Info {
  String? name;

  Info(this.name);

  factory Info.fromJson(Map<String, dynamic> json) => Info(json['name']);
}
