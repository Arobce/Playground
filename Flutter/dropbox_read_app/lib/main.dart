import 'dart:io';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';

void main() => runApp(Downloader());

class Downloader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "File Downloader",
        debugShowCheckedModeBanner: false,
        home: FileDownloader(),
        theme: ThemeData(primarySwatch: Colors.blue),
      );
}

class FileDownloader extends StatefulWidget {
  @override
  _FileDownloaderState createState() => _FileDownloaderState();
}

class _FileDownloaderState extends State<FileDownloader> {
  final dropBoxUrl = "https://content.dropboxapi.com/2/files/download";
  bool downloading = false;
  var progress = "";
  var path = "No Data";
  var platformVersion = "Unknown";
  var _onPressed;
  static final Random random = Random();
  Directory externalDir;

  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();
    var token = "<token>";
    var checkPermission1 = await Permission.storage.status;
    if (checkPermission1.isUndetermined) {
      checkPermission1 = await Permission.storage.request();
    }
    if (checkPermission1.isGranted) {
      String dirloc = "";
      String fileName = "/scene.png";

      dirloc = (await getApplicationDocumentsDirectory()).path;

      var randid = random.nextInt(10000);

      try {
        await dio.download(dropBoxUrl, dirloc +  "/"+randid.toString() + ".png",
            options: Options(headers: {
              'Content-Type': 'application/octet-stream; charset=utf-8',
              'Authorization': 'Bearer $token',
              'Dropbox-API-Arg': '{ "path": "$fileName" }'
            }), onReceiveProgress: (receivedBytes, totalBytes) {
          setState(() {
            downloading = true;
            progress =
                ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
          });
        });
      } on DioError catch (e) {
        if (e.response != null) {
          print(e.response.data);
          print(e.response.headers);
          print(e.response.request);
        } else {
          print(e.request);
          print(e.message);
        }
      }

      setState(() {
        downloading = false;
        progress = "Download Completed.";
        path = dirloc +  "/"+randid.toString() + ".png";
      });
    } else {
      setState(() {
        progress = "Permission Denied!";
        _onPressed = () {
          downloadFile();
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('File Downloader'),
      ),
      body: Center(
          child: downloading
              ? Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Downloading File: $progress',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(path),
                    MaterialButton(
                      child: Text('Request Permission Again.'),
                      onPressed: _onPressed,
                      disabledColor: Colors.blueGrey,
                      color: Colors.pink,
                      textColor: Colors.white,
                      height: 40.0,
                      minWidth: 100.0,
                    ),
                  ],
                )));
}
