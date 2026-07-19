import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';
import 'package:mobile/features/freelancer_my_work/domain/repositories/freelancer_my_work_repository.dart';

class GetFreelancerApplicationsParams {
  final FreelancerApplicationFilter filter;

  const GetFreelancerApplicationsParams({
    this.filter = FreelancerApplicationFilter.all,
  });
}

class GetFreelancerApplicationsUseCase
    implements UseCase<List<FreelancerWorkItem>, GetFreelancerApplicationsParams> {
  final FreelancerMyWorkRepository repository;

  const GetFreelancerApplicationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<FreelancerWorkItem>>> call(
    GetFreelancerApplicationsParams params,
  ) {
    return repository.getApplications(filter: params.filter);
  }
}
