import 'package:flutter/material.dart';
import 'features/authentication/presentation/providers/auth_provider.dart';
import 'landingscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthProvider _authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _authProvider,
      builder: (context, child) {
        if (_authProvider.isInitializing) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: const Color(0xFFF8FAFC),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo2.png',
                      width: 140,
                      height: 90,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.shopping_bag_outlined,
                        size: 60,
                        color: Color(0xFF10B981),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(
                      color: Color(0xFF10B981),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Landingscreen(),
        );
      },
    );
  }
}
