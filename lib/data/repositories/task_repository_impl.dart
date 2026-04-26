import '../../domain/repositories/task_repository.dart';
import '../../models/demo_task_item.dart';
import '../../models/report_item.dart';
import '../demo_data.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<List<DemoTaskItem>> fetchTasks() async {
    return List<DemoTaskItem>.from(DemoData.taskListEntries);
  }

  @override
  Future<void> createTask({
    required String assigneeId,
    required String details,
    required String priority,
  }) async {
    final trimmed = details.trim();
    if (trimmed.isEmpty) {
      throw const TaskSubmissionException('Task details are required.');
    }
    (String id, String nameEn, String nameAr, String deptEn, String deptAr)?
    assignee;
    for (final employee in DemoData.employees) {
      if (employee.$1 == assigneeId) {
        assignee = employee;
        break;
      }
    }
    if (assignee == null) {
      throw const TaskSubmissionException('Assignee was not found.');
    }
    final dueDate = DateTime.now().add(const Duration(days: 7));
    final formattedDue =
        '${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}';
    DemoData.taskListEntries.insert(
      0,
      DemoTaskItem(
        item: ReportItem(
          title: '${_capitalize(priority)} priority task',
          subtitle: 'Assigned to ${assignee.$2} · ${assignee.$4}',
          dateLabel: 'Due $formattedDue',
          titleAr: 'مهمة ${_priorityAr(priority)}',
          subtitleAr: 'مُعيّنة إلى ${assignee.$3} · ${assignee.$5}',
          dateLabelAr: 'مستحق $formattedDue',
        ),
        referenceDate: dueDate,
      ),
    );
  }

  String _capitalize(String value) {
    if (value.isEmpty) return value;
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }

  String _priorityAr(String priority) {
    return switch (priority) {
      'high' => 'عالية',
      'low' => 'منخفضة',
      _ => 'متوسطة',
    };
  }
}

class TaskSubmissionException implements Exception {
  const TaskSubmissionException(this.message);

  final String message;

  @override
  String toString() => message;
}
