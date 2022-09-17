import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tr_app/model/file_model.dart';
import 'package:tr_app/res/components/download.dart';
import 'package:tr_app/res/color.dart';

class File_tile extends StatefulWidget {
  final ModelFile filelist;
  const File_tile(this.filelist);

  @override
  State<File_tile> createState() => _File_tileState();
}

class _File_tileState extends State<File_tile> {
  bool a = false;

  @override
  Future<String> getFilePath(String filname) async {
    final dir = await getExternalStorageDirectory();
    dir!.create();
    return "${dir.path}/$filname";
  }

  Future<bool> chick() async {
    String path = await getFilePath(widget.filelist.file);
    bool chick = await File(path).exists();
    return chick;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Container(
      height: 70,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: Text(widget.filelist.fileName,
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  color: primaryColorS)
              ),
            ),
            // const SizedBox(
            //   width: 30,
            // ),
            Expanded(
              flex: 1,
              child: Text(widget.filelist.file.substring(11),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColorS)
              ),
            ),
            // const SizedBox(
            //   width: 18,
            // ),
            Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () async {
                    if (a) {
                      a = await chick();
                      String path = await getFilePath(widget.filelist.file);
                      OpenFile.open(path);
                    } else {
                      Get.to(() => Downloadfile(),
                          arguments: widget.filelist.file.toString());
                    }
                    setState(() {
                      a = a == true ? a : !a;
                    });
                  },
                  child: Icon(
                      color: a ? primaryColorS : const Color.fromARGB(255, 10, 48, 112),
                      a ? Icons.open_in_new : Icons.download),
                ),
            ),
          ],
      ),
    ));
  }
}
