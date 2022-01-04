import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'model/app_model.dart';
import 'dart:async';

void initAppConfig() {
  registerSingletons();
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<AppModel>(() => AppModel());
}

Future<bool> authenticateWithBiometrics() async {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  bool isBiometricSupported = await localAuthentication.isDeviceSupported();
  bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

  bool isAuthenticated = false;

  if (isBiometricSupported && canCheckBiometrics) {
    isAuthenticated = await localAuthentication.authenticate(
      localizedReason: 'Desbloqueie seu app.',
      biometricOnly: true,
      stickyAuth: true,
    );
  }

  return isAuthenticated;
}
