import 'package:intl/intl.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

import '../models/detail_model.dart';

class PrinterHelper {
  static Future<void> printReceipt(Data doc) async {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    // Header Logo
    try {
      // await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
      // final ByteData data = await rootBundle.load(
      //   'assets/images/logo/logo_polos.png',
      // );
      // final Uint8List originalBytes = data.buffer.asUint8List();

      // final ui.Codec codec = await ui.instantiateImageCodec(
      //   originalBytes,
      //   targetWidth: 100,
      // );
      // final ui.FrameInfo frameInfo = await codec.getNextFrame();
      // final ByteData? resizedByteData = await frameInfo.image.toByteData(
      //   format: ui.ImageByteFormat.png,
      // );
      // final Uint8List resizedBytes = resizedByteData!.buffer.asUint8List();
      // await SunmiPrinter.printImage(resizedBytes);

      await SunmiPrinter.printText(
        'BPR BANGUNARTA',
        style: SunmiTextStyle(
          bold: true,
          fontSize: 32,
          align: SunmiPrintAlign.CENTER,
        ),
      );
    } catch (e) {
      // Fallback if image fails
      await SunmiPrinter.printText(
        'BPR BANGUNARTA',
        style: SunmiTextStyle(
          bold: true,
          fontSize: 32,
          align: SunmiPrintAlign.CENTER,
        ),
      );
    }

    await SunmiPrinter.printText(
      'Jl. H. Iksan No.89 Mulyasari,\nPamanukan\nTelepon: (0260) 550888\nwww.bprbangunarta.co.id',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 22),
    );

    await SunmiPrinter.printText(
      '--------------------------------',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    // Info section Header
    await _printKeyValueRow('Tanggal', doc.created_at != null ? DateFormat('dd MMM yyyy, HH:mm').format(doc.created_at!) : '-');
    await _printKeyValueRow('No.', doc.number);
    await _printKeyValueRow('Referensi', doc.refid ?? '-');

    await SunmiPrinter.printText(
      '--------------------------------',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    // User Info
    await SunmiPrinter.printText(
      doc.name.toUpperCase(),
      style: SunmiTextStyle(
        bold: true,
        align: SunmiPrintAlign.CENTER,
        fontSize: 26,
      ),
    );
    await SunmiPrinter.printText(
      doc.destination,
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    await SunmiPrinter.printText(
      '--------------------------------',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    // Keterangan Header
    await SunmiPrinter.printRow(
      cols: [
        SunmiColumn(
          text: 'Keterangan',
          width: 7,
          style: SunmiTextStyle(bold: true, fontSize: 24),
        ),
        SunmiColumn(
          text: 'Nominal',
          width: 5,
          style: SunmiTextStyle(
            bold: true,
            align: SunmiPrintAlign.RIGHT,
            fontSize: 24,
          ),
        ),
      ],
    );

    await SunmiPrinter.printText(
      '--------------------------------',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    // Balances
    await _printKeyValueRow(
      'Saldo Tabungan',
      currencyFormat.format(doc.previous_balance),
    );
    await _printKeyValueRow(
      'Jumlah Setoran',
      currencyFormat.format(doc.amount),
    );
    await _printKeyValueRow('Biaya Admin', 'Rp0');

    await SunmiPrinter.printText(
      '--------------------------------',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    // Final Balance
    await _printKeyValueRow(
      'Saldo Akhir',
      currencyFormat.format(doc.ending_balance),
      bold: true,
    );

    await SunmiPrinter.printText(
      '--------------------------------',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    await SunmiPrinter.printText(
      'Apabila terjadi ketidaksesuaian, harap\nsegera menghubungi kami untuk\npenyelesaian. Terima kasih atas perhatian\nAnda.',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 22),
    );

    await SunmiPrinter.printText(
      '********************************',
      style: SunmiTextStyle(align: SunmiPrintAlign.CENTER, fontSize: 24),
    );

    await SunmiPrinter.lineWrap(3);
  }

  static Future<void> _printKeyValueRow(
    String key,
    String value, {
    bool bold = false,
  }) async {
    await SunmiPrinter.printRow(
      cols: [
        SunmiColumn(
          text: key,
          width: 7,
          style: SunmiTextStyle(fontSize: 18, bold: bold),
        ),
        SunmiColumn(
          text: value,
          width: 5,
          style: SunmiTextStyle(
            bold: true,
            align: SunmiPrintAlign.RIGHT,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
