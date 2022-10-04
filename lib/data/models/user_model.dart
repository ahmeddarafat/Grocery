class UserModel {
  String? name;
  String? email;
  dynamic phone;
  String? accessToken;
  String? tokenType;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.accessToken,
    this.tokenType,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}


  // UserModel copyWith({
  //   String? name,
  //   String? email,
  //   String? phone,
  //   String? accessToken,
  //   String? tokenType,
  // }) {
  //   return UserModel(
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     phone: phone ?? this.phone,
  //     accessToken: accessToken ?? this.accessToken,
  //     tokenType: tokenType ?? this.tokenType,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'access_token': accessToken,
  //     'token_type': tokenType,
  //   };
  // }

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     name: map['name'] as String,
  //     email: map['email'] as String,
  //     phone: map['phone'] as String,
  //     accessToken: map['access_token'] as String,
  //     tokenType: map['token_type'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'UserModel(name: $name, email: $email, phone: $phone, accessToken: $accessToken, tokenType: $tokenType)';
  // }

  // @override
  // bool operator ==(covariant UserModel other) {
  //   if (identical(this, other)) return true;

  //   return
  //     other.name == name &&
  //     other.email == email &&
  //     other.phone == phone &&
  //     other.accessToken == accessToken &&
  //     other.tokenType == tokenType;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //     email.hashCode ^
  //     phone.hashCode ^
  //     accessToken.hashCode ^
  //     tokenType.hashCode;
  // }
// }
