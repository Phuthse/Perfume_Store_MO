class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? passwordHash;
  String? role;
  String? phone;
  String? profileUrl;
  String? metadata;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? dateCreated;
  String? lastLogin;
  List<Null>? activityLogs;
  List<Null>? carts;
  List<Null>? feedbacks;
  List<Null>? notificationSentByNavigations;
  List<Null>? notificationUsers;
  List<Null>? orders;

  User(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.passwordHash,
      this.role,
      this.phone,
      this.profileUrl,
      this.metadata,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.dateCreated,
      this.lastLogin,
      this.activityLogs,
      this.carts,
      this.feedbacks,
      this.notificationSentByNavigations,
      this.notificationUsers,
      this.orders});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    role = json['role'];
    phone = json['phone'];
    profileUrl = json['profileUrl'];
    metadata = json['metadata'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dateCreated = json['dateCreated'];
    lastLogin = json['lastLogin'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['passwordHash'] = this.passwordHash;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['profileUrl'] = this.profileUrl;
    data['metadata'] = this.metadata;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['dateCreated'] = this.dateCreated;
    data['lastLogin'] = this.lastLogin;
    
    return data;
  }
}