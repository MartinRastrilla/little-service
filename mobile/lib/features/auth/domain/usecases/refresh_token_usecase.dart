// TODO(refresh-token): Implement RefreshTokenUseCase in a future iteration.
//
// Purpose:
// - Renew an expired access token using a stored refresh token.
//
// When to invoke:
// - Dio AuthInterceptor on HTTP 401 responses (retry original request).
// - App resume / CheckSessionUseCase when access token is expired but refresh exists.
//
// Dependencies (future):
// - AuthRepository.refreshSession()
// - AuthLocalDataSource to read/write access + refresh tokens
// - Optional AuthBloc event to emit unauthenticated if refresh fails
//
// Flow:
// 1. Read refresh token from secure storage.
// 2. POST /auth/refresh { refreshToken }.
// 3. Persist new access (+ refresh if rotated).
// 4. Return AuthSession or Failure.
//
// This file is intentionally a design stub with no executable code.
