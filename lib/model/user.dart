class UserDetail {
  final String username;
  final String password;
  final String dob;
  final String mobileNo;
  final String emailId;

  UserDetail(
      {this.username, this.password, this.dob, this.emailId, this.mobileNo});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['username'] = this.username;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['mobileNo'] = this.mobileNo;
    data['emailId'] = this.emailId;

    return data;
  }
}
