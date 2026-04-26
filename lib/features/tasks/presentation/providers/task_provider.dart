import 'package:flutter/foundation.dart';

import '../../../../domain/repositories/task_repository.dart';
import '../../../../models/demo_task_item.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;

  final TaskRepository _taskRepository;

  List<DemoTaskItem> _tasks = const [];
  bool _isLoading = false;
  bool _isSaving = false;
  String? _errorMessage;

  List<DemoTaskItem> get tasks => _tasks;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  Future<void> loadTasks() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      _tasks = await _taskRepository.fetchTasks();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createTask({
    required String assigneeId,
    required String details,
    required String priority,
  }) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await _taskRepository.createTask(
        assigneeId: assigneeId,
        details: details,
        priority: priority,
      );
      _tasks = await _taskRepository.fetchTasks();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }
}
