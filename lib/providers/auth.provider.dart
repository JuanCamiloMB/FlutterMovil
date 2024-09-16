import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authServiceProvider = Provider<Auth>((ref) {
  return Auth();
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});