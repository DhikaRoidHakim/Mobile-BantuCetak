import 'package:dio/dio.dart';

import '../models/cetak_model.dart';
import '../models/detail_model.dart';
import '../models/auth_model.dart';
import '../models/me_model.dart';
import '../models/list_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://codex.pba.co.id',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Helper method to get the token
  Future<String?> _getToken() async {
    return await _secureStorage.read(key: 'jwt_token');
  }

  Future<CetakDocument> getDocument(String nodokumen) async {
    try {
      final response = await _dio.get('/cetak/$nodokumen');
      if (response.statusCode == 200) {
        return CetakDocument.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to fetch document: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw 'Dokumen tidak ditemukan (404). Silakan periksa kembali nomor dokumen Anda.';
        } else if (e.response!.statusCode! >= 500) {
          throw 'Terjadi gangguan pada server (500). Silakan coba beberapa saat lagi.';
        }
        throw 'Gagal mengambil data: ${e.response!.statusCode}';
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw 'Koneksi terputus. Periksa jaringan internet Anda.';
      } else {
        throw 'Tidak dapat terhubung ke server. Pastikan server aktif dan di jaringan yang sama.';
      }
    }
  }

  Future<AuthRespone> login({
    required String username,
    required String password,
    required String deviceIdentifier,
    required String deviceName,
    required String deviceOs,
    String fmcToken = "",
  }) async {
    try {
      final response = await _dio.post(
        '/api/jwt/auth',
        data: {
          "username": username,
          "password": password,
          "device_identifier": deviceIdentifier,
          "device_name": deviceName,
          "device_os": deviceOs,
          "fmc_token": fmcToken,
        },
      );

      if (response.statusCode == 200) {
        final authResponse = AuthRespone.fromJson(response.data);
        
        // Simpan token JWT ke dalam secure storage
        if (authResponse.data?.access_token != null) {
          await _secureStorage.write(
            key: 'jwt_token', 
            value: authResponse.data!.access_token,
          );
        }
        
        return authResponse;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to login: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw 'Gagal login: ${e.response?.data['message'] ?? e.response!.statusCode}';
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw 'Koneksi terputus. Periksa jaringan internet Anda.';
      } else {
        throw 'Tidak dapat terhubung ke server. Pastikan server aktif.';
      }
    }
  }

  Future<MeResponseModel> getMe() async {
    try {
      final token = await _getToken();
      final response = await _dio.get(
        '/api/jwt/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return MeResponseModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to get me: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw 'Gagal mendapatkan data user: ${e.response?.statusCode}';
    }
  }

  Future<ListResponse> getTransactions(String id) async {
    try {
      final token = await _getToken();
      final response = await _dio.get(
        '/api/transaction/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ListResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to fetch transactions: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw 'Gagal mengambil data transaksi: ${e.response?.statusCode}';
    }
  }

  Future<DetailResponse> getTransactionDetail(String id) async {
    try {
      final token = await _getToken();
      final response = await _dio.get(
        '/api/transaction/detail/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return DetailResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to fetch detail: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw 'Detail tidak ditemukan (404).';
        } else if (e.response!.statusCode! >= 500) {
          throw 'Terjadi gangguan pada server (500). Silakan coba beberapa saat lagi.';
        }
        throw 'Gagal mengambil data detail: ${e.response!.statusCode}';
      }
      throw 'Gagal mengambil data detail transaksi.';
    }
  }

  Future<void> printTransaction(String id) async {
    try {
      final token = await _getToken();
      final response = await _dio.get(
        '/api/transaction/print/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map && data['success'] == false) {
          throw data['message'] ?? 'Gagal mencetak transaksi.';
        }
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to print: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response!.data;
        if (data is Map && data['message'] != null) {
          throw data['message'];
        }
        throw 'Gagal mencetak transaksi: ${e.response!.statusCode}';
      }
      throw 'Gagal mencetak transaksi.';
    } catch (e) {
      rethrow;
    }
  }
}
