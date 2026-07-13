import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/validators.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:mobile/features/auth/presentation/widgets/auth_section_divider.dart';
import 'package:mobile/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:mobile/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:mobile/features/auth/presentation/widgets/login_brand_header.dart';
import 'package:mobile/features/auth/presentation/widgets/login_top_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.loginRequested(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            const LoginTopDecoration(),
            SafeArea(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  state.maybeWhen(
                    authenticated: (_) => context.go('/shell/home'),
                    failure: (message, _) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(message)));
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );

                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 24),
                                const LoginBrandHeader(),
                                const SizedBox(height: 32),
                                Text(
                                  'Iniciar sesión',
                                  style: context.text.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.colors.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Ingresa tus credenciales para continuar',
                                  style: context.text.bodyMedium?.copyWith(
                                    color: context.colors.onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                AuthFormField(
                                  controller: _emailController,
                                  label: 'Email',
                                  hintText: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: context.colors.onSurfaceVariant,
                                  ),
                                  validator:
                                      (value) => validateEmail(value)?.message,
                                ),
                                const SizedBox(height: 16),
                                AuthFormField(
                                  controller: _passwordController,
                                  label: 'Contraseña',
                                  hintText: 'Contraseña',
                                  obscureText: _obscurePassword,
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: context.colors.onSurfaceVariant,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: context.colors.onSurfaceVariant,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                  validator:
                                      (value) =>
                                          validatePassword(value)?.message,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Checkbox(
                                        value: _rememberMe,
                                        onChanged: (value) {
                                          setState(() {
                                            _rememberMe = value ?? false;
                                          });
                                        },
                                        activeColor: context.colors.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Recordarme',
                                      style: context.text.bodySmall?.copyWith(
                                        color: context.colors.onSurfaceVariant,
                                      ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            context.colors.secondary,
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        '¿Olvidaste tu contraseña?',
                                        style: context.text.bodySmall?.copyWith(
                                          color: context.colors.secondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                AuthSubmitButton(
                                  label: 'Ingresar',
                                  isLoading: isLoading,
                                  onPressed: _submit,
                                ),
                                const SizedBox(height: 24),
                                const AuthSectionDivider(
                                  label: 'o continúa con',
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AuthSocialButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.google,
                                          size: 18,
                                          color: context.colors.onSurface,
                                        ),
                                        label: 'Google',
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: AuthSocialButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.github,
                                          size: 18,
                                          color: context.colors.onSurface,
                                        ),
                                        label: 'GitHub',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: context.text.bodyMedium?.copyWith(
                                        color: context.colors.onSurfaceVariant,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: '¿No tienes una cuenta? ',
                                        ),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.baseline,
                                          baseline: TextBaseline.alphabetic,
                                          child: GestureDetector(
                                            onTap: () => context.go('/register'),
                                            child: Text(
                                              'Regístrate',
                                              style: context.text.bodyMedium
                                                  ?.copyWith(
                                                    color:
                                                        context
                                                            .colors
                                                            .secondary,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                      ),
                      /* Image.asset(
                        AppAssets.landscape,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ), */
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
