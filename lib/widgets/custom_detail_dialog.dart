import 'package:flutter/material.dart';
import 'package:webui/app_constant.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/models/inputan_data.dart';

class CustomDetailDialog extends StatelessWidget {
  const CustomDetailDialog({
    super.key,
    required this.contentTheme,
    required this.title,
    required this.inputan,
  });

  final ContentTheme contentTheme;
  final String title;
  final Map<String, dynamic> inputan;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // titlePadding: MySpacing.xy(16, 12),
      insetPadding: MySpacing.xy(50, 50),
      // actionsAlignment: MainAxisAlignment.end,
      // actionsPadding: MySpacing.xy(250, 16),
      // contentPadding: MySpacing.x(16),
      child: SizedBox(
        width: 500,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: contentTheme.primary.withOpacity(0.08),
              padding: MySpacing.xy(16, 12),
              child: Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: contentTheme.primary,
                    size: 16,
                  ),
                  MySpacing.width(12),
                  MyText.titleMedium(
                    "Detail Order".tr(),
                    fontWeight: 600,
                    color: contentTheme.primary,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  padding: MySpacing.y(24),
                  child: DataTable(
                    showBottomBorder: true,
                    headingRowHeight: 0,
                    columns: const [
                      DataColumn(label: Text("")),
                      DataColumn(label: Text("")),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            MyText.labelMedium('Nama Inputer'),
                          ),
                          DataCell(MyText.bodyMedium(inputan['nama']))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            MyText.labelMedium('Tanggal Input'),
                          ),
                          DataCell(MyText.bodyMedium(dateTimeFormatter
                              .format(DateTime.parse(inputan['createdAt']))))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            MyText.labelMedium('No SC'),
                          ),
                          DataCell(MyText.bodyMedium(inputan['nosc']))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            MyText.labelMedium('Status SC'),
                          ),
                          DataCell(MyText.bodyMedium(inputan['paket']))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            MyText.labelMedium('Nama Perusahaan'),
                          ),
                          DataCell(MyText.bodyMedium(inputan['namaperusahaan']))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            MyText.labelMedium('Paket'),
                          ),
                          DataCell(MyText.bodyMedium(inputan['paket']))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            MyText.labelMedium('Datel'),
                          ),
                          DataCell(MyText.bodyMedium(inputan['datel']))
                        ],
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton.rounded(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    padding: MySpacing.xy(20, 16),
                    backgroundColor: contentTheme.secondary,
                    child: MyText.labelMedium(
                      "close".tr(),
                      color: contentTheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
