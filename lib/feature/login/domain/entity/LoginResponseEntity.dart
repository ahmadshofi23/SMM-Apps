// ignore: file_names

import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final String status;
  final String message;
  final LoginDataEntity data;

  const LoginResponseEntity(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class LoginDataEntity extends Equatable {
  final String token;
  final UserEntity user;
  const LoginDataEntity({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [token, user];
}

class UserEntity extends Equatable {
  final int id;
  final int document_upload_id;
  final String name;
  final String username;
  final String email;
  final String? email_verified_at;
  final String address;
  final String phone;
  final String account_type;
  final int created_user;
  final String created_at;
  final int edited_user;
  final String? edited_at;
  final int deleted_user;
  final String? deleted_at;
  final String image_src;
  final CustomerEntity customerEntity;
  final String? picture;

  UserEntity({
    required this.id,
    required this.document_upload_id,
    required this.name,
    required this.username,
    required this.email,
    this.email_verified_at,
    required this.address,
    required this.phone,
    required this.account_type,
    required this.created_at,
    required this.created_user,
    required this.customerEntity,
    this.deleted_at,
    required this.deleted_user,
    this.edited_at,
    required this.edited_user,
    required this.image_src,
    this.picture,
  });

  @override
  List<Object?> get props => [
        id,
        document_upload_id,
        name,
        username,
        email,
        email_verified_at,
        address,
        phone,
        account_type,
        created_at,
        created_user,
        customerEntity,
        deleted_at,
        deleted_user,
        edited_at,
        edited_user,
        image_src,
        picture,
      ];
}

class CustomerEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final int created_user;
  final String created_at;
  final int edited_user;
  final String? edited_at;
  final int deleted_user;
  final String? deleted_at;
  final PivotEntity pivotEntity;

  const CustomerEntity(
      {required this.address,
      required this.created_at,
      required this.created_user,
      this.deleted_at,
      required this.deleted_user,
      this.edited_at,
      required this.edited_user,
      required this.email,
      required this.id,
      required this.name,
      required this.phone,
      required this.pivotEntity});

  @override
  List<Object?> get props => throw [
        address,
        created_at,
        created_user,
        deleted_at,
        deleted_user,
        edited_at,
        edited_user,
        email,
        id,
        name,
        phone,
        pivotEntity
      ];
}

class PivotEntity extends Equatable {
  final int id;
  final int user_id;
  final int customer_id;

  const PivotEntity({
    required this.customer_id,
    required this.id,
    required this.user_id,
  });

  @override
  List<Object?> get props => throw [id, user_id, customer_id];
}
