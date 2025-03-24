import '../models/user_model.dart';
import 'auth_service.dart';

class UserService {
  final AuthService _authService = AuthService();

  // Update user profile
  Future<bool> updateUserProfile(UserModel updatedUser) async {
    try {
      // Get current user
      final currentUser = await _authService.getCurrentUser();
      if (currentUser == null) return false;

      // Merge current user with updated fields
      final mergedUser = currentUser.copyWith(
        firstName: updatedUser.firstName ?? currentUser.firstName,
        lastName: updatedUser.lastName ?? currentUser.lastName,
        email: updatedUser.email ?? currentUser.email,
        profession: updatedUser.profession ?? currentUser.profession,
        workExperience: updatedUser.workExperience ?? currentUser.workExperience,
        hourlyRate: updatedUser.hourlyRate ?? currentUser.hourlyRate,
        shopNumber: updatedUser.shopNumber ?? currentUser.shopNumber,
        profilePhotoUrl: updatedUser.profilePhotoUrl ?? currentUser.profilePhotoUrl,
        isWorker: updatedUser.isWorker,
      );

      // Save updated user
      return await _authService.saveUser(mergedUser);
    } catch (e) {
      print('Error updating user profile: $e');
      return false;
    }
  }

  // Get worker list (mock)
  Future<List<UserModel>> getWorkers() async {
    // This would normally fetch data from an API
    await Future.delayed(const Duration(seconds: 1));

    return [
      UserModel(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        profession: 'Plumber',
        workExperience: '5 years',
        hourlyRate: '25',
        isWorker: true,
      ),
      UserModel(
        id: '2',
        firstName: 'Jane',
        lastName: 'Smith',
        profession: 'Electrician',
        workExperience: '7 years',
        hourlyRate: '30',
        isWorker: true,
      ),
      UserModel(
        id: '3',
        firstName: 'Mike',
        lastName: 'Johnson',
        profession: 'Carpenter',
        workExperience: '3 years',
        hourlyRate: '22',
        isWorker: true,
      ),
    ];
  }

  // Search workers by keyword (mock)
  Future<List<UserModel>> searchWorkers(String keyword) async {
    final allWorkers = await getWorkers();

    if (keyword.isEmpty) return allWorkers;

    return allWorkers.where((worker) {
      final fullName = '${worker.firstName} ${worker.lastName}'.toLowerCase();
      final profession = worker.profession?.toLowerCase() ?? '';
      return fullName.contains(keyword.toLowerCase()) ||
             profession.contains(keyword.toLowerCase());
    }).toList();
  }
}
