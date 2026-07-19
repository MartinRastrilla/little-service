import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/freelancer_my_work/domain/entities/freelancer_work_item.dart';

abstract class FreelancerMyWorkRepository {
  Future<Either<Failure, List<FreelancerWorkItem>>> getApplications({
    FreelancerApplicationFilter filter = FreelancerApplicationFilter.all,
  });

  Future<Either<Failure, List<FreelancerWorkItem>>> getJobs({
    FreelancerJobFilter filter = FreelancerJobFilter.all,
  });
}
