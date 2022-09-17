import 'dart:io';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

Widget buildf(List<PlatformFile> files) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return buildFile(file);
      }
    ),
  );
}

Widget buildFile(PlatformFile file) {
  final kb = file.size / 1024;
  final mb = kb / 1024;
  final size = (mb >= 1)
      ? '${mb.toStringAsFixed(2)} MB'
      : '${kb.toStringAsFixed(2)} KB';
  return InkWell(
    onTap: () => viewFile(file),
    child: ListTile(
      leading: (file.extension == 'jpg' || file.extension == 'png')
          ? Image.file(
              File(file.path.toString()),
              width: 80,
              height: 80,
            )
          : const SizedBox(
              width: 80,
              height: 80,
            ),
      title: Text(file.name),
      subtitle: Text('${file.extension}'),
      trailing: Text(
        size,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Future<List<PlatformFile>?> pickFiles(var controller) async {
  controller.result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'pdf',
        'docx',
        'pptx',
        'zip',
        'rar'
      ],
      allowMultiple: true);
  if (controller.result == null) {
    return null;
  } else {
    return controller.result!.files;
  }
}

// open the picked file
void viewFile(PlatformFile file) {
  OpenFile.open(file.path);
}
