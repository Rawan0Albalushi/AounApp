import 'package:flutter/material.dart';

import '../../widgets/app_shimmer.dart';
import '../../widgets/empty_state.dart';

class AsyncStateView extends StatelessWidget {
  const AsyncStateView({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.isEmpty,
    required this.child,
    this.onRetry,
    this.emptyIcon = Icons.inbox_outlined,
    this.emptyTitle,
    this.emptySubtitle,
  });

  final bool isLoading;
  final bool hasError;
  final bool isEmpty;
  final Widget child;
  final VoidCallback? onRetry;
  final IconData emptyIcon;
  final String? emptyTitle;
  final String? emptySubtitle;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const _GenericLoadingSkeleton();
    }

    if (hasError) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 42),
            const SizedBox(height: 12),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      );
    }

    if (isEmpty) {
      return EmptyState(
        icon: emptyIcon,
        title: emptyTitle,
        subtitle: emptySubtitle,
      );
    }
    return child;
  }
}

class _GenericLoadingSkeleton extends StatelessWidget {
  const _GenericLoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: List.generate(
          4,
          (_) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              height: 92,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
