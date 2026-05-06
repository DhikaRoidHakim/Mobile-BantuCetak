import 'package:dev_bantucetak/models/detail_model.dart';
import 'package:dev_bantucetak/services/api_service.dart';
import 'package:dev_bantucetak/utils/printer_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ApiService _apiService = ApiService();

  bool _isLoading = true;
  String? _errorMessage;
  Data? _detailData;

  @override
  void initState() {
    super.initState();
    _fetchDetail();
  }

  Future<void> _fetchDetail() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await _apiService.getTransactionDetail(widget.id);
      if (response.data == null) {
        throw 'Data transaksi tidak ditemukan.';
      }
      setState(() {
        _detailData = response.data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });

      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text(
              'Informasi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(e.toString().replaceAll('Exception: ', '')),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/');
                  }
                },
                child: const Text(
                  'OKE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Detail Struk',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildBody(currencyFormat),
    );
  }

  Widget _buildBody(NumberFormat currencyFormat) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.blueAccent),
      );
    }

    if (_errorMessage != null || _detailData == null) {
      return const Center(child: SizedBox.shrink());
    }

    final doc = _detailData!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logo/logo_polos.png',
                            height: 50,
                            errorBuilder: (context, error, stackTrace) =>
                                const Text(
                                  'BPR BANGUNARTA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "PT BPR Bangunarta",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const Text(
                            'Jl. H. Iksan No.89 Mulyasari,',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, height: 1.3),
                          ),
                          const Text(
                            'Pamanukan',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, height: 1.3),
                          ),
                          const Text(
                            'Telepon: (0260) 550888',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, height: 1.3),
                          ),
                          const Text(
                            'www.bprbangunarta.co.id',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, height: 1.3),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        '--------------------------------------------------------------------------------',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                      ),
                    ),
                    _buildRow(
                      'Tanggal',
                      doc.created_at != null
                          ? DateFormat(
                              'dd MMM yyyy, HH:mm',
                            ).format(doc.created_at!)
                          : '-',
                    ),
                    const SizedBox(height: 4),
                    _buildRow('No.', doc.number),
                    const SizedBox(height: 4),
                    _buildRow('Referensi', doc.refid ?? '-'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        '--------------------------------------------------------------------------------',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            doc.name.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            doc.destination,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        '--------------------------------------------------------------------------------',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                      ),
                    ),
                    _buildRow('Keterangan', 'Nominal', isBold: true),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        '--------------------------------------------------------------------------------',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                      ),
                    ),
                    _buildRow(
                      'Saldo Tabungan',
                      currencyFormat.format(doc.previous_balance),
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'Jumlah Setoran',
                      currencyFormat.format(doc.amount),
                    ),
                    const SizedBox(height: 8),
                    _buildRow('Biaya Admin', 'Rp0'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        '--------------------------------------------------------------------------------',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                      ),
                    ),
                    _buildRow(
                      'Saldo Akhir',
                      currencyFormat.format(doc.ending_balance),
                      isBold: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        '--------------------------------------------------------------------------------',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Apabila terjadi ketidaksesuaian, harap segera menghubungi kami untuk penyelesaian. Terima kasih atas perhatian Anda.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, height: 1.4),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text('*********************************'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                try {
                  // 1. Hit API untuk mencatat transaksi sudah dicetak & cek kuota
                  await _apiService.printTransaction(doc.id.toString());

                  // 2. Cetak struk via printer jika API sukses
                  await PrinterHelper.printReceipt(doc);

                  if (!mounted) return;

                  // 3. Tampilkan modal sukses & kembali ke home
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Berhasil',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Text('Struk berhasil dicetak!'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop(); // Tutup dialog
                            if (context.canPop()) {
                              context.pop(); // Kembali ke halaman sebelumnya
                            } else {
                              context.go('/'); // Fallback
                            }
                          },
                          child: const Text(
                            'OKE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Error: ${e.toString().replaceAll('Exception: ', '')}',
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.print),
              label: const Text(
                'CETAK STRUK',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String left, String right, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            left,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            right,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
