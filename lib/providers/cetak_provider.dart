import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import '../models/cetak_model.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final documentProvider = FutureProvider.family<CetakDocument, String>((ref, nodokumen) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getDocument(nodokumen);
});
