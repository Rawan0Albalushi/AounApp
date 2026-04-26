import '../network/dio_client.dart';
import '../auth/session_manager.dart';
import '../auth/token_refresher.dart';
import '../security/token_storage.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../data/services/auth_api_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/task_repository.dart';

class AppServices {
  AppServices._({
    required this.authRepository,
    required this.sessionManager,
    required this.taskRepository,
  });

  final AuthRepository authRepository;
  final SessionManager sessionManager;
  final TaskRepository taskRepository;

  static AppServices create() {
    final tokenStorage = TokenStorage();
    final sessionManager = SessionManager(tokenStorage: tokenStorage);
    final tokenRefresher = TokenRefresher(tokenStorage: tokenStorage);
    final dio = DioClient(
      tokenStorage: tokenStorage,
      tokenRefresher: tokenRefresher,
    ).dio;
    final authApiService = AuthApiService(dio);
    final authRepository = AuthRepositoryImpl(
      authApiService: authApiService,
      tokenStorage: tokenStorage,
    );
    return AppServices._(
      authRepository: authRepository,
      sessionManager: sessionManager,
      taskRepository: TaskRepositoryImpl(),
    );
  }
}
