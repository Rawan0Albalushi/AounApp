import 'package:flutter_test/flutter_test.dart';

import 'package:aoun_app/domain/repositories/task_repository.dart';
import 'package:aoun_app/features/tasks/presentation/providers/task_provider.dart';
import 'package:aoun_app/models/demo_task_item.dart';
import 'package:aoun_app/models/report_item.dart';

class _FakeTaskRepository implements TaskRepository {
  List<DemoTaskItem> _items = [
    DemoTaskItem(
      item: const ReportItem(
        title: 'Initial',
        subtitle: 'seed',
        dateLabel: 'today',
      ),
      referenceDate: DateTime(2026, 4, 26),
    ),
  ];

  bool shouldThrow = false;

  @override
  Future<void> createTask({
    required String assigneeId,
    required String details,
    required String priority,
  }) async {
    if (shouldThrow) {
      throw Exception('cannot create');
    }
    _items = [
      DemoTaskItem(
        item: ReportItem(
          title: details,
          subtitle: assigneeId,
          dateLabel: priority,
        ),
        referenceDate: DateTime(2026, 4, 27),
      ),
      ..._items,
    ];
  }

  @override
  Future<List<DemoTaskItem>> fetchTasks() async => _items;
}

void main() {
  test('TaskProvider loads and creates tasks successfully', () async {
    final repo = _FakeTaskRepository();
    final provider = TaskProvider(taskRepository: repo);

    await provider.loadTasks();
    expect(provider.tasks.length, 1);

    final ok = await provider.createTask(
      assigneeId: 'e1',
      details: 'New task',
      priority: 'high',
    );
    expect(ok, isTrue);
    expect(provider.tasks.length, 2);
    expect(provider.hasError, isFalse);
  });

  test('TaskProvider surfaces repository errors', () async {
    final repo = _FakeTaskRepository()..shouldThrow = true;
    final provider = TaskProvider(taskRepository: repo);

    final ok = await provider.createTask(
      assigneeId: 'e1',
      details: 'New task',
      priority: 'high',
    );
    expect(ok, isFalse);
    expect(provider.hasError, isTrue);
  });
}
