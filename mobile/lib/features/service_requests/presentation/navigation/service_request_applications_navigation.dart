import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> navigateToServiceRequestApplications(
  BuildContext context, {
  required String serviceRequestId,
}) {
  return context.push<bool>(
    '/service-requests/$serviceRequestId/applications',
  );
}
