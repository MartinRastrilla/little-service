import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app/shell/presentation/app_shell_page.dart';
import 'package:mobile/app/shell/presentation/config/shell_tab_definition.dart';
import 'package:mobile/app/shell/presentation/pages/more_page.dart';
import 'package:mobile/app/shell/presentation/pages/shell_tab_page.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/auth/presentation/pages/login_page.dart';
import 'package:mobile/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/features/service_requests/presentation/pages/create_service_request_page.dart';
import 'package:mobile/features/service_requests/presentation/pages/edit_service_request_page.dart';
import 'package:mobile/features/service_requests/presentation/pages/service_request_contract_page.dart';
import 'package:mobile/features/service_requests/presentation/pages/service_request_detail_page.dart';
import 'package:mobile/features/service_requests/presentation/pages/service_request_applications_page.dart';
import 'package:mobile/features/freelancer_service_request_detail/presentation/pages/freelancer_service_request_detail_page.dart';
import 'package:mobile/features/client_public_profile/presentation/pages/client_public_profile_page.dart';
import 'package:mobile/features/freelancer_public_profile/presentation/pages/freelancer_public_profile_page.dart';
import 'package:mobile/features/chat/presentation/pages/chat_page.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  AppRouter({required AuthBloc authBloc})
    : router = GoRouter(
        initialLocation: '/login',
        refreshListenable: GoRouterRefreshStream(authBloc.stream),
        redirect: (context, state) {
          final authState = authBloc.state;
          final location = state.matchedLocation;
          final isAuthRoute = location == '/login' || location == '/register';
          final isLegacyHome = location == '/home';

          return authState.maybeWhen(
            authenticated: (_) {
              if (isAuthRoute || isLegacyHome) return '/shell/home';
              return null;
            },
            unauthenticated: () => isAuthRoute ? null : '/login',
            orElse: () => null,
          );
        },
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: '/register',
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            path: '/service-requests/create',
            builder: (context, state) => const CreateServiceRequestPage(),
          ),
          GoRoute(
            path: '/freelancer/service-requests/:id',
            builder: (context, state) => FreelancerServiceRequestDetailPage(
              serviceRequestId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: '/freelancer/clients/:clientId',
            builder: (context, state) => ClientPublicProfilePage(
              clientId: state.pathParameters['clientId']!,
              serviceRequestId: state.uri.queryParameters['serviceRequestId'],
            ),
          ),
          GoRoute(
            path: '/clients/freelancers/:freelancerId',
            builder: (context, state) => FreelancerPublicProfilePage(
              freelancerId: state.pathParameters['freelancerId']!,
              serviceRequestId: state.uri.queryParameters['serviceRequestId'],
            ),
          ),
          GoRoute(
            path: '/service-requests/:id/applications',
            builder: (context, state) => ServiceRequestApplicationsPage(
              serviceRequestId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: '/service-requests/:id/contract',
            builder: (context, state) {
              final suggestedAmount = double.tryParse(
                state.uri.queryParameters['suggestedAmount'] ?? '',
              );
              return ServiceRequestContractPage(
                serviceRequestId: state.pathParameters['id']!,
                suggestedAmount: suggestedAmount,
                allowCreate:
                    state.uri.queryParameters['allowCreate'] == 'true',
              );
            },
          ),
          GoRoute(
            path: '/freelancer/jobs/:id/contract',
            builder: (context, state) => ServiceRequestContractPage(
              serviceRequestId: state.pathParameters['id']!,
              allowCreate: false,
            ),
          ),
          GoRoute(
            path: '/service-requests/:id/edit',
            builder: (context, state) => EditServiceRequestPage(
              serviceRequestId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: '/service-requests/:id',
            builder: (context, state) => ServiceRequestDetailPage(
              serviceRequestId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: '/chat/service-requests/:serviceRequestId/with/:withUserId',
            builder: (context, state) => ChatPage(
              serviceRequestId: state.pathParameters['serviceRequestId']!,
              withUserId: state.pathParameters['withUserId'],
              interlocutorName: state.uri.queryParameters['name'],
            ),
          ),
          GoRoute(
            path: '/chat/service-requests/:serviceRequestId',
            builder: (context, state) => ChatPage(
              serviceRequestId: state.pathParameters['serviceRequestId']!,
            ),
          ),
          GoRoute(
            path: '/home',
            redirect: (context, state) => '/shell/home',
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return AppShellPage(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/home',
                    builder: (context, state) =>
                        const ShellTabPage(tabId: ShellTabId.home),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/activity',
                    builder: (context, state) => ShellTabPage(
                      tabId: ShellTabId.activity,
                      initialSection: state.uri.queryParameters['tab'],
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/messages',
                    builder: (context, state) =>
                        const ShellTabPage(tabId: ShellTabId.messages),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/shell/more',
                    builder: (context, state) => const MorePage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  final GoRouter router;
}
