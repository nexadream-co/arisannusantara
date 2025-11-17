import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../features/groups/domain/entities/history_entity.dart';

Future<void> downloadHistoryExcel(HistoryEntity history) async {
  await Permission.storage.request();

  final excel = Excel.createExcel();
  final sheet = excel['Riwayat'];

  // Header
  sheet.appendRow([TextCellValue('Informasi'), TextCellValue('Detail')]);

  // Main info
  final groupName = history.group?.name ?? '-';
  final date = history.date?.toIso8601String() ?? '-';
  final reward = history.reward ?? '-';
  final notes = history.notes ?? '-';
  final amount = history.amount ?? 0;

  sheet.appendRow([TextCellValue('Nama Grup'), TextCellValue(groupName)]);
  sheet.appendRow([TextCellValue('Tanggal'), TextCellValue(date)]);
  sheet.appendRow([TextCellValue('Total Iuran'), IntCellValue(amount)]);
  sheet.appendRow([TextCellValue('Reward'), TextCellValue(reward)]);
  sheet.appendRow([TextCellValue('Catatan'), TextCellValue(notes)]);

  sheet.appendRow([TextCellValue(''), TextCellValue('')]);
  sheet.appendRow([TextCellValue('Daftar Pemenang'), TextCellValue('')]);

  // Winners
  for (final w in history.winners ?? []) {
    sheet.appendRow([
      TextCellValue(w.user?.name ?? '-'),
      TextCellValue(w.user?.email ?? '-'),
    ]);
  }

  sheet.appendRow([TextCellValue(''), TextCellValue('')]);
  sheet.appendRow([
    TextCellValue('Daftar Anggota'),
    TextCellValue('Status Pembayaran'),
  ]);

  // Members
  for (final m in history.members ?? []) {
    sheet.appendRow([
      TextCellValue(m.user?.name ?? '-'),
      TextCellValue(m.statusPayment ?? '-'),
    ]);
  }

  // Save file
  final bytes = excel.encode()!;
  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/riwayat_${history.id}.xlsx';

  final file = File(path)
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes);

  // Share file
  final params = ShareParams(files: [XFile(file.path)]);

  SharePlus.instance.share(params);
}
