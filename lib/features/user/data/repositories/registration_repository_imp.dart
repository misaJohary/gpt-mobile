import 'package:dartz/dartz.dart';

import 'package:gpt/core/error/failure.dart';
import 'package:gpt/features/user/domain/entities/user.dart';
import 'package:gpt/features/user/domain/repositories/registration_repository.dart';

import '../../../../core/network/network_info.dart';
import '../datasources/datasources.dart';

class RegistrationRepositoryImp implements RegistrationRepository {
  final RegistrationRemoteDatasources remote;
  final RegistrationLocalDatasources local;
  final NetworkInfo network;

  RegistrationRepositoryImp({
    required this.remote,
    required this.local,
    required this.network,
  });

  @override
  Future<Either<Failure, dynamic>> register(User user) async {
    if (await network.isConnected) {
      return Right(await remote.registration(user));
    }
    return const Left(NoConnexionFailure());
  }
}