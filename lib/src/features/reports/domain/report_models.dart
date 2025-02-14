import 'package:queue_management_system/src/features/queue/domain/models/person_details.dart';

class ReportModel {
  final int totalQueueItems;
  final int completedQueueItems;
  final double averageWaitingTime;

  ReportModel({
    required this.totalQueueItems,
    required this.completedQueueItems,
    required this.averageWaitingTime,
  });
}

class ReportsState {
  final List<PersonDetails> queueData;
  final ReportModel? report;
  final bool isLoading;
  final String? error;

  ReportsState({
    this.queueData = const [],
    this.report,
    this.isLoading = false,
    this.error,
  });
}
