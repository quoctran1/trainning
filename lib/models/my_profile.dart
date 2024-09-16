class MyProfile {
  String? firstName;
  String? lastName;
  String? middleName;
  int? age;
  List<String>? listReward;

  MyProfile(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.age,
      this.listReward});

  static List<MyProfile> listProfile() {
    MyProfile profile1 = MyProfile(
      firstName: 'Steve',
      lastName: "Job",
      age: 30,
      listReward: ["Gold medal"],
    );
    MyProfile profile2 = MyProfile(
      firstName: 'May',
      lastName: "Annie",
      listReward: [
        "Gold medal",
        "Sliver medal",
      ],
    );
    MyProfile profile3 = MyProfile(
      middleName: 'Harry',
      lastName: "James",
    );
    MyProfile profile4 = MyProfile(
      firstName: 'Stan',
      middleName: 'Jr.',
      lastName: "Bob",
      age: 60,
      listReward: [
        "Gold medal",
        "Sliver medal",
        "Champion medal",
        "Victory medal",
        "Oval medal",
      ],
    );
    return [
      profile1,
      profile2,
      profile3,
      profile4,
    ];
  }
  /*
  Firstname, Lastname nếu null thì hiển thị Unknown
  FullName= Firstname+ MiddleName+ Lastname
  Age: nếu null thì ẩn đi
  Reward: lấy 5 item đầu tiên trong danh sách, nối nhau bằng dấu phẩy

  Tạo 1 text field, tìm profile dựa theo Firstname, chỉ lấy 1 kết quả đầu tiên, sử dụng UI như trên, nếu không tìm thấy thì tất cả các field sẽ hiện Unknown data

  Sử dụng cấu trúc hàm như sau:
  MyProfile? searchName(String searchText){

    }
  */
}
