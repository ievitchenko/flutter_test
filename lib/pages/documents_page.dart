import 'package:flutter/material.dart';
import 'package:test_doc/consts/colors.dart';

class Document {
  final String fileName;
  final String fileDate;
  final String userName;

  Document(
      {required this.fileName, required this.fileDate, required this.userName});
}

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  List<Document> files = [
    Document(
      fileName: 'Vastuvõtuakt ja lõpudokumendid',
      fileDate: '18.10.2021 14:35',
      userName: 'Uuendas Margus Pärn',
    ),
    Document(
      fileName: 'Akt 1.docx',
      fileDate: '17.10.2021 12:53',
      userName: 'Uuendas Risto Kukk',
    ),
    Document(
      fileName: 'Akt 2.docx',
      fileDate: '16.10.2021 11:33',
      userName: 'Uuendas Kalle Kuusik',
    ),
    Document(
      fileName: 'Akt 3.docx',
      fileDate: '16.10.2021 11:33',
      userName: 'Uuendas Margus Pärn',
    ),
    Document(
      fileName: 'TestFile 1.docx',
      fileDate: '16.10.2021 11:33',
      userName: 'Uuendas Margus Pärn',
    ),
    Document(
      fileName: 'TestFile.docx',
      fileDate: '16.10.2021 11:33',
      userName: 'Uuendas Margus Pärn',
    ),
    Document(
      fileName: 'Lõpudokument.pdf',
      fileDate: '18.10.2021 14:35',
      userName: 'Uuendas Margus Pärn',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color1,
        appBar: AppBar(
          toolbarHeight: 44,
          centerTitle: false,
          leadingWidth: 100,
          leading: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    splashRadius: 16,
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: Icon(Icons.arrow_back_outlined,
                        color: AppColors.color3)),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.color2),
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.color2),
                  width: 22,
                  height: 22,
                  child: const Center(child: Text('V')),
                )
              ]),
          elevation: 0,
          backgroundColor: AppColors.color1,
          actions: [
            IconButton(
                splashRadius: 16,
                icon: Icon(
                  Icons.more_horiz,
                  color: AppColors.color3,
                ),
                onPressed: () {})
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.color2,
            child: const Icon(
              Icons.add,
              size: 26,
            )),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Vastuvõtuakt ja lõpudokumendid',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.color3),
                )),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 16),
                      child: TextButton.icon(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(2),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.color1),
                              minimumSize:
                                  MaterialStateProperty.all<Size>(Size.zero),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.color5),
                                    borderRadius: BorderRadius.circular(18.0)),
                              )),
                          onPressed: () {},
                          icon: Icon(Icons.sort,
                              color: AppColors.color3, size: 14),
                          label: Text('Sorteeri',
                              style: TextStyle(
                                  color: AppColors.color3, fontSize: 14))),
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: false,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14, height: 20 / 14),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.color6,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        prefixIcon: Icon(Icons.search, color: AppColors.color3),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 25,
                          minHeight: 25,
                        ),
                        suffixIcon: Icon(
                          Icons.cancel,
                          color: AppColors.color7,
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 25,
                          minHeight: 25,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.color5, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14))),
                        hintText: 'Enter a search term',
                      ),
                    )),
                  ],
                )),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 60),
              itemCount: files.length,
              itemBuilder: (context, index) {
                return documentTile(
                  context,
                  files[index],
                  index,
                );
              },
            )),
          ],
        ));
  }
}

Widget documentTile(BuildContext context, Document file, int index) {
  return Container(
    decoration: index != 0
        ? BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.color5)))
        : null,
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(mainAxisSize: MainAxisSize.max, children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.file_copy,
                  color: AppColors.color2,
                )),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.fileName,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  '${file.userName} \u2022 ${file.fileDate}',
                  style: TextStyle(fontSize: 14, color: AppColors.color4),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            )),
          ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 28,
                  ),
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.25,
                          child: bottomDrawerContainer(),
                        );
                      }))),
        ]),
  );
}

Widget bottomDrawerContainer() {
  return Column(
    children: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 10),
        width: 30,
        height: 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: AppColors.color7),
      ),
      const SizedBox(height: 15),
      Text(
        'Toimingud',
        style: TextStyle(
            fontSize: 17, color: AppColors.color3, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          actionButton(Icons.draw, 'Allkirjasta', () {}),
          actionButton(Icons.drive_file_rename_outline, 'Muuda', () {}),
          actionButton(Icons.download, 'Lae alla', () {}),
        ],
      )
    ],
  );
}

Widget actionButton(IconData icon, String title, void Function() onTap) {
  return SizedBox(
      width: 70,
      child: Column(children: [
        Material(
            child: Ink(
                width: 42,
                height: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.color1,
                    border: Border.all(width: 1, color: AppColors.color5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.color7,
                        blurRadius: .4,
                        offset: const Offset(0, 1),
                      ),
                    ]),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: onTap,
                  child: Icon(
                    icon,
                    size: 25,
                  ),
                ))),
        const SizedBox(
          height: 8,
        ),
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))
      ]));
}
