import '../../models/demo_task_item.dart';

abstract class TaskRepository {
  Future<List<DemoTaskItem>> fetchTasks();

  Future<void> createTask({
    required String assigneeId,
    required String details,
    required String priority,
  });
}
