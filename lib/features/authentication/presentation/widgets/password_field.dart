import 'package:flutter/material.dart';
import 'auth_text_field.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool showStrengthMeter;

  const PasswordField({
    super.key,
    this.label = "Password",
    this.hintText = "Enter your password",
    required this.controller,
    this.validator,
    this.showStrengthMeter = false,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  double _strength = 0;
  String _strengthText = '';
  Color _strengthColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_evaluateStrength);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_evaluateStrength);
    super.dispose();
  }

  void _evaluateStrength() {
    if (!widget.showStrengthMeter) return;
    final pwd = widget.controller.text;

    if (pwd.isEmpty) {
      setState(() {
        _strength = 0;
        _strengthText = '';
        _strengthColor = Colors.grey;
      });
      return;
    }

    double score = 0;
    if (pwd.length >= 12) score += 0.35;
    if (pwd.contains(RegExp(r'[A-Z]'))) score += 0.2;
    if (pwd.contains(RegExp(r'[a-z]'))) score += 0.15;
    if (pwd.contains(RegExp(r'[0-9]'))) score += 0.15;
    if (pwd.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score += 0.15;

    setState(() {
      _strength = score.clamp(0.0, 1.0);
      if (_strength < 0.35) {
        _strengthText = 'Weak (Needs min 12 characters)';
        _strengthColor = Colors.redAccent;
      } else if (_strength < 0.6) {
        _strengthText = 'Fair';
        _strengthColor = Colors.orangeAccent;
      } else if (_strength < 0.8) {
        _strengthText = 'Good';
        _strengthColor = Colors.blueAccent;
      } else {
        _strengthText = 'Strong';
        _strengthColor = const Color(0xFF10B981);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthTextField(
          label: widget.label,
          hintText: widget.hintText,
          controller: widget.controller,
          prefixIcon: Icons.lock_outline,
          obscureText: _obscureText,
          validator: widget.validator,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: Colors.grey.shade600,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        if (widget.showStrengthMeter && widget.controller.text.isNotEmpty) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: _strength,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(_strengthColor),
                    minHeight: 5,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _strengthText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _strengthColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Backend requires at least 12 characters",
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ],
    );
  }
}
