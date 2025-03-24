import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import 'dart:convert';

class AuthService {
  static const String _userKey = 'user_data';
  static const String _authTokenKey = 'auth_token';

  // Save user data
  Future<bool> saveUser(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userKey, jsonEncode(user.toJson()));
      return true;
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  // Get current user
  Future<UserModel?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);
      if (userData != null) {
        return UserModel.fromJson(jsonDecode(userData));
      }
      return null;
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  // Save auth token
  Future<bool> saveAuthToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_authTokenKey, token);
      return true;
    } catch (e) {
      print('Error saving token: $e');
      return false;
    }
  }

  // Get auth token
  Future<String?> getAuthToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_authTokenKey);
    } catch (e) {
      print('Error getting token: $e');
      return null;
    }
  }

  // Logout
  Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
      await prefs.remove(_authTokenKey);
      return true;
    } catch (e) {
      print('Error logging out: $e');
      return false;
    }
  }

  // Verify phone number (mock)
  Future<bool> verifyPhoneNumber(String phoneNumber) async {
    // This would normally send an SMS and return success/failure
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  // Verify OTP code (mock)
  Future<bool> verifyOTP(String phoneNumber, String code) async {
    // This would normally verify the OTP and return success/failure
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
