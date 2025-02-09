import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:queue_management_system/src/features/auth/data/auth_repository.dart';

class QueueServices {
  Future<String?> getAdminEmailFromAuth(WidgetRef ref) async {
    try {
      final adminEmail =
          await ref.read(authRepositoryProvider).getLoggedInAdminEmail();

      if (adminEmail != null) {
        return adminEmail;
      } else {
        print('No admin is logged in');
        return null;
      }
    } catch (e) {
      print('Error fetching admin email: $e');
      return null;
    }
  }
}

// Define the provider for QueueServices
final queueServicesProvider = Provider<QueueServices>((ref) {
  return QueueServices();
});
