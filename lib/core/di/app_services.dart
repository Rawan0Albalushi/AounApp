import '../network/dio_client.dart';
import '../auth/session_manager.dart';
import '../security/token_storage.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/auth_api_service.dart';
import '../../domain/repositories/auth_repository.dart';

class AppServices {
  AppServices._({required this.authRepository, required this.sessionManager});

  final AuthRepository authRepository;
  final SessionManager sessionManager;

  static AppServices create() {
    final tokenStorage = TokenStorage();
    final sessionManager = SessionManager(tokenStorage: tokenStorage);
    final dio = DioClient(tokenStorage: tokenStorage).dio;
    final authApiService = AuthApiService(dio);
    final authRepository = AuthRepositoryImpl(
      authApiService: authApiService,
      tokenStorage: tokenStorage,
    );
    return AppServices._(
      authRepository: authRepository,
      sessionManager: sessionManager,
    );
  }
}
