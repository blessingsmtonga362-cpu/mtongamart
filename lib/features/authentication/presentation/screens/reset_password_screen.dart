import 'package:flutter/material.dart';
import '../../../../core/network/api_exceptions.dart';
import '../../data/services/auth_api_service.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/password_field.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String token;

  const ResetPasswordScreen({
    super.key,
    required this.token,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tokenController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authApiService = AuthApiService();

  bool _isLoading = false;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    if (widget.token.isNotEmpty) {
      _tokenController.text = widget.token;
    }
  }

  @override
  void dispose() {
    _tokenController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    final token = _tokenController.text.trim();
    if (token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter or paste your reset token."),
          backgroundColor: Colors.orangeAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await _authApiService.resetPassword(
        token: token,
        newPassword: _newPasswordController.text,
      );

      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _isSuccess = true;
      });

      final message = response['message'] ??
          'Password reset successfully. Please sign in again.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: const Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Reset failed: ${e.toString()}"),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF0F172A),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Lock Check Icon Banner
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: _isSuccess
                        ? const Color(0xFFECFDF5)
                        : const Color(0xFFEFF6FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _isSuccess
                        ? Icons.check_circle_outline
                        : Icons.security_outlined,
                    size: 48,
                    color: _isSuccess
                        ? const Color(0xFF10B981)
                        : const Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(height: 24),

                Text(
                  _isSuccess ? "Password Reset Successful!" : "Reset Your Password",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  _isSuccess
                      ? "Your password has been updated successfully. All previous sessions have been revoked for your security."
                      : "Enter your reset token and set a new password for your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),

                if (!_isSuccess) ...[
                  // Token Input
                  AuthTextField(
                    label: "Reset Token",
                    hintText: "Enter or paste your reset token",
                    controller: _tokenController,
                    prefixIcon: Icons.key_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter the reset token";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // New Password Input with Strength Meter
                  PasswordField(
                    label: "New Password",
                    hintText: "Min. 12 characters",
                    controller: _newPasswordController,
                    showStrengthMeter: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a new password";
                      }
                      if (value.length < 12) {
                        return "Password must be at least 12 characters long";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Confirm New Password Input
                  PasswordField(
                    label: "Confirm New Password",
                    hintText: "Re-enter your new password",
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your new password";
                      }
                      if (value != _newPasswordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 28),

                  // Submit Button
                  AuthButton(
                    text: "Reset Password",
                    isLoading: _isLoading,
                    onPressed: _handleResetPassword,
                  ),
                ] else ...[
                  const SizedBox(height: 16),
                  AuthButton(
                    text: "Proceed to Sign In",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],

                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Back to Sign In",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
