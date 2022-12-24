import 'package:smm_apps/feature/login/data/datasource/remote/remote_login_data_source.dart';
import 'package:smm_apps/feature/login/domain/entity/LoginResponseEntity.dart';
import 'package:smm_apps/feature/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteLoginDataSource remoteLoginDataSource;

  LoginRepositoryImpl({required this.remoteLoginDataSource});
  @override
  Future<LoginResponseEntity> login(String username, String password) async {
    final response = await remoteLoginDataSource.login(username, password);
    if (response == null) {
      return LoginResponseEntity(
          status: 'failed', message: 'Internal Server Error', data: null);
    }
    final pivotEntity = PivotEntity(
        customer_id: response.data!.user!.customer!.pivot!.customerId!,
        id: response.data!.user!.customer!.pivot!.id!,
        user_id: response.data!.user!.customer!.pivot!.userId!);

    final customerEntity = CustomerEntity(
        address: response.data!.user!.customer!.address!,
        created_at: response.data!.user!.customer!.createdAt!,
        created_user: response.data!.user!.customer!.createdUser!,
        deleted_at: response.data?.user?.customer?.deletedAt,
        deleted_user: response.data!.user!.customer!.deletedUser!,
        edited_at: response.data?.user?.customer?.editedAt,
        edited_user: response.data!.user!.customer!.editedUser!,
        email: response.data!.user!.customer!.email!,
        id: response.data!.user!.customer!.id!,
        name: response.data!.user!.customer!.name!,
        phone: response.data!.user!.customer!.phone!,
        pivotEntity: pivotEntity);

    final userEntity = UserEntity(
        id: response.data!.user!.id!,
        document_upload_id: response.data!.user!.documentUploadId!,
        name: response.data!.user!.name!,
        username: username,
        email: response.data!.user!.email!,
        email_verified_at: response.data?.user?.emailVerifiedAt,
        address: response.data!.user!.address!,
        phone: response.data!.user!.phone!,
        account_type: response.data!.user!.accountType!,
        created_at: response.data!.user!.createdAt!,
        created_user: response.data!.user!.createdUser!,
        customerEntity: customerEntity,
        deleted_at: response.data?.user?.deletedAt,
        deleted_user: response.data!.user!.deletedUser!,
        edited_at: response.data?.user?.editedAt,
        edited_user: response.data!.user!.editedUser!,
        image_src: response.data!.user!.imageSrc!,
        picture: response.data?.user?.picture);

    final loginDataEntity =
        LoginDataEntity(token: response.data!.token!, user: userEntity);
    return LoginResponseEntity(
        status: response.status!,
        message: response.message!,
        data: loginDataEntity);
  }
}
