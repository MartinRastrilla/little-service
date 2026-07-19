import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_my_work/data/datasources/freelancer_my_work_remote_datasource.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';
import 'package:mobile/features/freelancer_my_work/domain/repositories/freelancer_my_work_repository.dart';

class FreelancerMyWorkRepositoryImpl implements FreelancerMyWorkRepository {
  final FreelancerMyWorkRemoteDataSource remote;

  const FreelancerMyWorkRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<FreelancerWorkItem>>> getApplications({
    FreelancerApplicationFilter filter = FreelancerApplicationFilter.all,
  }) async {
    try {
      final models = await remote.getApplications(filter: filter);
      return Right(models.map((model) => model.toEntity()).toList());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, List<FreelancerWorkItem>>> getJobs({
    FreelancerJobFilter filter = FreelancerJobFilter.all,
  }) async {
    try {
      final models = await remote.getJobs(filter: filter);
      return Right(models.map((model) => model.toEntity()).toList());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
