import 'package:freezed_annotation/freezed_annotation.dart';

//ptf
part 'user.freezed.dart';
//pts
part 'user.g.dart';

// fdataclass
@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
