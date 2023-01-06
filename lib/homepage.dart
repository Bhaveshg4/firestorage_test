import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:women_safe_1/storage_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("WomenSafe")),
          body: Column(
            children: [
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        final results = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['png', 'jpg'],
                        );
                        if (results == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No file uploded'),
                            ),
                          );
                          return null;
                        }
                        final Path = results.files.single.path!;
                        final fileName = results.files.single.name;

                        storage
                            .uploadFile(Path, fileName)
                            .then((value) => print("Done!"));
                      },
                      child: Text("Uplode Image")))
            ],
          ),
        ));
  }
}
