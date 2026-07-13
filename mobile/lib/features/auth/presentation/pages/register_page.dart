import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/theme_context.dart';
import 'package:mobile/core/utils/validators.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:mobile/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:mobile/features/auth/presentation/widgets/login_brand_header.dart';
import 'package:mobile/features/auth/presentation/widgets/login_top_decoration.dart';
import 'package:mobile/features/auth/presentation/widgets/register_role_card.dart';
import 'package:mobile/features/auth/presentation/widgets/register_role_info_banner.dart';
import 'package:mobile/features/auth/presentation/widgets/register_security_banner.dart';
import 'package:mobile/features/auth/presentation/widgets/register_step_indicator.dart';
import 'package:mobile/features/auth/presentation/widgets/terms_and_conditions_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const _clientRole = 'Client';
  static const _freelancerRole = 'Freelancer';

  final _formKeyStep1 = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  int _currentStep = 0;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptedTerms = false;
  String? _rolesError;
  String? _termsError;
  final Set<String> _selectedRoles = {};

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _goToStep(int step) {
    setState(() {
      _currentStep = step;
      if (step == 0) {
        _rolesError = null;
        _termsError = null;
      }
    });
  }

  void _continueToStep2() {
    if (!_formKeyStep1.currentState!.validate()) {
      return;
    }
    _goToStep(1);
  }

  void _toggleRole(String role) {
    setState(() {
      if (_selectedRoles.contains(role)) {
        _selectedRoles.remove(role);
      } else {
        _selectedRoles.add(role);
      }
      _rolesError = null;
    });
  }

  bool _validateStep2() {
    var isValid = true;

    final rolesError = validateRoles(_selectedRoles.toList());
    if (rolesError != null) {
      _rolesError = rolesError.message;
      isValid = false;
    } else {
      _rolesError = null;
    }

    if (!_acceptedTerms) {
      _termsError = 'Debes aceptar los términos y condiciones';
      isValid = false;
    } else {
      _termsError = null;
    }

    setState(() {});
    return isValid;
  }

  void _submitRegistration() {
    if (!_validateStep2()) {
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.registerRequested(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        roles: _selectedRoles.toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _currentStep == 1
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => _goToStep(0),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : null,
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
                          child: _currentStep == 0
                              ? _buildStep1(isLoading)
                              : _buildStep2(isLoading),
                        ),
                      ),
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

  Widget _buildStep1(bool isLoading) {
    return Form(
      key: _formKeyStep1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const RegisterStepIndicator(currentStep: 0),
          const SizedBox(height: 24),
          const LoginBrandHeader(),
          const SizedBox(height: 32),
          Text(
            'Crear cuenta',
            style: context.text.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Completa tus datos para continuar',
            style: context.text.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          AuthFormField(
            controller: _nameController,
            label: 'Nombre completo',
            hintText: 'Ingresa tu nombre completo',
            prefixIcon: Icon(
              Icons.person_outline,
              color: context.colors.onSurfaceVariant,
            ),
            validator: (value) => validateName(value)?.message,
          ),
          const SizedBox(height: 16),
          AuthFormField(
            controller: _emailController,
            label: 'Email',
            hintText: 'Ingresa tu email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.mail_outline,
              color: context.colors.onSurfaceVariant,
            ),
            validator: (value) => validateEmail(value)?.message,
          ),
          const SizedBox(height: 16),
          AuthFormField(
            controller: _passwordController,
            label: 'Contraseña',
            hintText: 'Crea una contraseña',
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
                setState(() => _obscurePassword = !_obscurePassword);
              },
            ),
            validator: (value) => validatePasswordStrength(value)?.message,
          ),
          const SizedBox(height: 6),
          Text(
            passwordRequirementsHint,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          AuthFormField(
            controller: _confirmPasswordController,
            label: 'Confirmar contraseña',
            hintText: 'Confirma tu contraseña',
            obscureText: _obscureConfirmPassword,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: context.colors.onSurfaceVariant,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: context.colors.onSurfaceVariant,
              ),
              onPressed: () {
                setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword,
                );
              },
            ),
            validator: (value) => validateConfirmPassword(
              value,
              password: _passwordController.text,
            )?.message,
          ),
          const SizedBox(height: 6),
          Text(
            'Las contraseñas deben coincidir',
            style: context.text.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          const RegisterSecurityBanner(),
          const SizedBox(height: 24),
          AuthSubmitButton(
            label: 'Continuar',
            isLoading: false,
            onPressed: isLoading ? null : _continueToStep2,
          ),
          const SizedBox(height: 24),
          Center(
            child: RichText(
              text: TextSpan(
                style: context.text.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
                children: [
                  const TextSpan(text: '¿Ya tienes una cuenta? '),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GestureDetector(
                      onTap: () => context.go('/login'),
                      child: Text(
                        'Inicia sesión',
                        style: context.text.bodyMedium?.copyWith(
                          color: context.colors.secondary,
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
    );
  }

  Widget _buildStep2(bool isLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        const RegisterStepIndicator(currentStep: 1),
        const SizedBox(height: 32),
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: context.colors.primaryContainer.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 40,
                  color: context.colors.primary,
                ),
                Positioned(
                  right: 12,
                  bottom: 12,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: context.colors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 14,
                      color: context.colors.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: context.text.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.onSurface,
            ),
            children: [
              const TextSpan(text: '¿Cómo usarás '),
              TextSpan(
                text: 'Little ',
                style: TextStyle(color: context.colors.primary),
              ),
              TextSpan(
                text: 'Service',
                style: TextStyle(color: context.colors.secondary),
              ),
              const TextSpan(text: '?'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Selecciona una o ambas opciones. Podrás cambiar esto más adelante.',
          style: context.text.bodyMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        RegisterRoleCard(
          icon: Icons.person_search_outlined,
          title: 'Buscar profesionales',
          description: 'Quiero contratar personas para realizar servicios.',
          highlight:
              'Podrás publicar pedidos y encontrar profesionales calificados.',
          isSelected: _selectedRoles.contains(_clientRole),
          onTap: isLoading ? () {} : () => _toggleRole(_clientRole),
        ),
        const SizedBox(height: 16),
        RegisterRoleCard(
          icon: Icons.work_outline,
          title: 'Ofrecer mis servicios',
          description:
              'Quiero ofrecer mis habilidades y recibir solicitudes de clientes.',
          highlight:
              'Podrás crear tu perfil profesional, mostrar tus servicios y conseguir clientes.',
          isSelected: _selectedRoles.contains(_freelancerRole),
          onTap: isLoading ? () {} : () => _toggleRole(_freelancerRole),
        ),
        if (_rolesError != null) ...[
          const SizedBox(height: 8),
          Text(
            _rolesError!,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
        const SizedBox(height: 16),
        const RegisterRoleInfoBanner(),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _acceptedTerms,
                onChanged: isLoading
                    ? null
                    : (value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                          _termsError = null;
                        });
                      },
                activeColor: context.colors.primary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Acepto los ',
                    style: context.text.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showTermsAndConditionsDialog(context),
                    child: Text(
                      'términos y condiciones',
                      style: context.text.bodySmall?.copyWith(
                        color: context.colors.secondary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (_termsError != null) ...[
          const SizedBox(height: 8),
          Text(
            _termsError!,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
        const SizedBox(height: 24),
        AuthSubmitButton(
          label: 'Crear cuenta',
          isLoading: isLoading,
          onPressed: isLoading ? null : _submitRegistration,
        ),
        const SizedBox(height: 16),
        Center(
          child: TextButton(
            onPressed: isLoading ? null : () => _goToStep(0),
            style: TextButton.styleFrom(
              foregroundColor: context.colors.secondary,
            ),
            child: const Text('Volver al paso anterior'),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
