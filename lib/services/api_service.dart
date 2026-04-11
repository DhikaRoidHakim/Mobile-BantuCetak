import 'package:dio/dio.dart';

import '../models/cetak_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.2.113:8000',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

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
}
