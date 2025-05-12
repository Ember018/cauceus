import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access the ViewModel using context.watch() - this rebuilds the widget on changes
    final viewModel = context.watch<LoginViewModel>();
    // OR use Consumer widget for more granular control (optional)

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Wrap with Center if you want vertical centering
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                keyboardType: TextInputType.text,
                // Disable field when loading
                enabled: !viewModel.isLoading,
                onChanged: (_) =>
                    viewModel.clearError(), // Clear error on typing
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                // Disable field when loading
                enabled: !viewModel.isLoading,
                onChanged: (_) =>
                    viewModel.clearError(), // Clear error on typing
              ),
              const SizedBox(height: 20),

              // --- Show Loading Indicator or Error Message ---
              if (viewModel.isLoading)
                const CircularProgressIndicator() // Show spinner when loading
              else if (viewModel.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    viewModel.errorMessage!, // Show error message
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 20),

              // --- Login Button ---
              ElevatedButton(
                // Disable button when loading, call ViewModel's loginUser on press
                onPressed: viewModel.isLoading
                    ? null
                    : () {
                        // Use context.read inside callbacks - doesn't listen for changes
                        final vm = context.read<LoginViewModel>();
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        // Call the ViewModel's login method
                        vm.loginUser(username, password).then((success) {
                          if (success) {
                            // TODO: Navigate to Home Screen on successful login
                            print("Login Successful! (Navigation Pending)");
                          } else {
                            // Error message is already handled by the watcher above
                            print("Login Failed!");
                          }
                        });
                      },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: viewModel.isLoading
                    ? null
                    : () {
                        // TODO Navigate to registration screen
                        print("Navigate to registration");
                      },
                child: const Text("Don't have account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
