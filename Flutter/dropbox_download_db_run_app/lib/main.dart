import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_utils/file_utils.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';

import 'secret.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dropBoxUrl = "https://content.dropboxapi.com/2/files/download";
  bool downloading = false;
  var progress = "";
  var path = "No Data";
  var platformVersion = "Unknown";
  var _onPressed;
  static final Random random = Random();
  Directory externalDir;

  Future<void> downloadFile() async {
    Dio dio = Dio();
    var token = Secret.dropBoxToken;
    var checkPermission1 = await Permission.storage.status;
    print(checkPermission1);
    if (checkPermission1.isUndetermined) {
      checkPermission1 = await Permission.storage.request();
    }
    if (checkPermission1.isGranted) {
      String dirloc = "";
      String fileName = "sqlite.db";

      dirloc = (await getApplicationDocumentsDirectory()).path;

      String fullPath = dirloc + "/" + fileName;

      try {
        FileUtils.mkdir([dirloc]);

        await dio.download(dropBoxUrl, fullPath,
            options: Options(headers: {
              'Content-Type': 'application/octet-stream; charset=utf-8',
              'Authorization': 'Bearer $token',
              'Dropbox-API-Arg': '{ "path": "/$fileName" }'
            }), onReceiveProgress: (receivedBytes, totalBytes) {
          print(receivedBytes);
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
        path = fullPath;
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Get database"),
                onPressed: () {
                  downloadFile();
                },
              ),
              Text(path),
              Text(
                'Downloading File: $progress',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ));
  }
}
