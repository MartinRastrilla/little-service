import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';
import 'package:mobile/features/freelancer_my_work/domain/repositories/freelancer_my_work_repository.dart';

class GetFreelancerJobsParams {
  final FreelancerJobFilter filter;

  const GetFreelancerJobsParams({
    this.filter = FreelancerJobFilter.all,
  });
}

class GetFreelancerJobsUseCase
    implements UseCase<List<FreelancerWorkItem>, GetFreelancerJobsParams> {
  final FreelancerMyWorkRepository repository;

  const GetFreelancerJobsUseCase(this.repository);

  @override
  Future<Either<Failure, List<FreelancerWorkItem>>> call(
    GetFreelancerJobsParams params,
  ) {
    return repository.getJobs(filter: params.filter);
  }
}
