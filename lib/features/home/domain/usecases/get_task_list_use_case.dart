import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/base/base_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r5/features/home/domain/repositories/home_auth_repository.dart';

class GetTaskListUseCase extends BaseUseCase<Stream<QuerySnapshot>, NoParams> {
  GetTaskListUseCase({required this.homeRepository});

  final HomeRepository homeRepository;
  @override
  Future<Either<Failure, Stream<QuerySnapshot>>> call(NoParams params) =>
      homeRepository.getListTask();
}
