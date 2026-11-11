import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/network/api_exceptions.dart';
import '../../data/services/auth_api_service.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import 'login_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  final String? initialToken;

  const VerifyEmailScreen({
    super.key,
    required this.email,
    this.initialToken,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _tokenController = TextEditingController();
  final _authApiService = AuthApiService();

  bool _isVerifying = false;
  bool _isResending = false;
  int _cooldownSeconds = 0;
  Timer? _cooldownTimer;
  String? _statusMessage;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialToken != null && widget.initialToken!.isNotEmpty) {
      _tokenController.text = widget.initialToken!;
      _handleVerifyToken(widget.initialToken!);
    }
  }

  @override
  void dispose() {
    _tokenController.dispose();
    _cooldownTimer?.cancel();
    super.dispose();
  }

  void _startCooldown() {
    setState(() => _cooldownSeconds = 60);
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldownSeconds <= 1) {
        timer.cancel();
        setState(() => _cooldownSeconds = 0);
      } else {
        setState(() => _cooldownSeconds--);
      }
    });
  }

  Future<void> _handleVerifyToken(String token) async {
    if (token.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter or paste your verification token"),
          backgroundColor: Colors.orangeAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _isVerifying = true;
      _statusMessage = null;
    });

    try {
      final response = await _authApiService.verifyEmail(token: token.trim());
      if (!mounted) return;

      setState(() {
        _isVerifying = false;
        _isSuccess = true;
        _statusMessage = response['message'] ?? 'Email verified successfully!';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_statusMessage!),
          backgroundColor: const Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _isVerifying = false;
        _statusMessage = e.message;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isVerifying = false;
        _statusMessage = 'Verification failed: ${e.toString()}';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verification failed: ${e.toString()}'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _handleResendEmail() async {
    if (_cooldownSeconds > 0) return;

    setState(() => _isResending = true);

    try {
      final response = await _authApiService.resendVerification(email: widget.email);
      if (!mounted) return;

      setState(() => _isResending = false);
      _startCooldown();

      final message = response['message'] ??
          'If verification is needed, a new email will be sent.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: const Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _isResending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isResending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Resend failed: ${e.toString()}'),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Email Envelope Icon Banner
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
                      : Icons.mark_email_unread_outlined,
                  size: 48,
                  color: _isSuccess
                      ? const Color(0xFF10B981)
                      : const Color(0xFF3B82F6),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                _isSuccess ? "Email Verified!" : "Verify Your Email",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 12),

              Text(
                _isSuccess
                    ? "Your email has been successfully verified. You can now sign in to your MtongaMart account."
                    : "We have sent a verification email to:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 6),

              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 16),

              if (!_isSuccess) ...[
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue.shade600, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Click the link in the email, or copy the token from your email link to verify below.",
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Manual Token Input Option
                AuthTextField(
                  label: "Verification Token (Optional)",
                  hintText: "Paste token from email link",
                  controller: _tokenController,
                  prefixIcon: Icons.vpn_key_outlined,
                ),
                const SizedBox(height: 16),

                AuthButton(
                  text: "Verify Account",
                  isLoading: _isVerifying,
                  onPressed: () => _handleVerifyToken(_tokenController.text),
                ),
                const SizedBox(height: 24),

                // Resend Button with Cooldown Timer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the email? ",
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    _isResending
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : GestureDetector(
                            onTap: _cooldownSeconds > 0 ? null : _handleResendEmail,
                            child: Text(
                              _cooldownSeconds > 0
                                  ? "Resend in ${_cooldownSeconds}s"
                                  : "Resend Email",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _cooldownSeconds > 0
                                    ? Colors.grey
                                    : const Color(0xFF10B981),
                              ),
                            ),
                          ),
                  ],
                ),
              ] else ...[
                const SizedBox(height: 32),
                AuthButton(
                  text: "Proceed to Sign In",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
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
    );
  }
}
