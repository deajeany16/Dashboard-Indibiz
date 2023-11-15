import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/re_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class REScreen extends StatefulWidget {
  const REScreen({super.key});

  @override
  State<REScreen> createState() => _REScreenState();
}

class _REScreenState extends State<REScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late REScreenController controller;

  @override
  void initState() {
    controller = Get.put(REScreenController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetBuilder<REScreenController>(
            init: controller,
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.x(flexSpacing),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.titleMedium(
                          "Data RE".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(
                                name: 'Data RE'.tr(), active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(flexSpacing),
                  MyCard(
                      shadow: MyShadow(
                          elevation: 0.5, position: MyShadowPosition.bottom),
                      margin: MySpacing.x(flexSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyButton(
                            onPressed: controller.goToCreateRE,
                            elevation: 0,
                            padding: MySpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_outlined,
                                  size: 20,
                                  color: contentTheme.onPrimary,
                                ),
                                MySpacing.width(8),
                                MyText.labelMedium(
                                  'tambah data'.tr().capitalizeWords,
                                  color: contentTheme.onPrimary,
                                ),
                              ],
                            ),
                          ),
                          MySpacing.height(16),
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MyContainer.none(
                                  borderRadiusAll: 4,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: DataTable(
                                      showCheckboxColumn: false,
                                      sortAscending: true,
                                      onSelectAll: (_) => {},
                                      headingRowColor: MaterialStatePropertyAll(
                                          contentTheme.primary.withAlpha(40)),
                                      dataRowMaxHeight: 60,
                                      showBottomBorder: false,
                                      columns: [
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'No'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Tanggal Input'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Inputer'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Nama SP/SA/CSR'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Kode SP/SA/CSR'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Datel'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'STO'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Nama Perusahaan'.tr(),
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Alamat Perusahaan'
                                              .tr()
                                              .capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Koordinat'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'ODP'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'No HP'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'No HP Alternatif'
                                              .tr()
                                              .capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Email'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Paket'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'No SC'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Status SC'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Keterangan'.tr().capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                        DataColumn(
                                            label: MyText.labelLarge(
                                          'Keterangan Lain'
                                              .tr()
                                              .capitalizeWords,
                                          color: contentTheme.primary,
                                        )),
                                      ],
                                      rows: controller.re
                                          .mapIndexed((index, data) => DataRow(
                                                  onSelectChanged: (selected) =>
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          scrollable: true,
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          titlePadding:
                                                              MySpacing.xy(
                                                                  16, 12),
                                                          // insetPadding: MySpacing.y(300),
                                                          actionsPadding:
                                                              MySpacing.xy(
                                                                  190, 16),
                                                          contentPadding:
                                                              MySpacing.x(16),
                                                          title: MyText
                                                              .titleMedium(
                                                            "Add item",
                                                          ),
                                                          content: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              MySpacing.height(
                                                                  8),
                                                              MyText.bodyMedium(
                                                                  "Nama User :"),
                                                              MySpacing.height(
                                                                  8),
                                                              TextFormField(
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Nama User cannot be empty';
                                                                  }
                                                                  return null;
                                                                },
                                                                controller: controller
                                                                    .basicValidator
                                                                    .getController(
                                                                        'nama_User'),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .emailAddress,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      "Nama",
                                                                  labelStyle: MyTextStyle
                                                                      .bodySmall(
                                                                          xMuted:
                                                                              true),
                                                                  border:
                                                                      outlineInputBorder,
                                                                  contentPadding:
                                                                      MySpacing
                                                                          .all(
                                                                              16),
                                                                  isCollapsed:
                                                                      true,
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .never,
                                                                ),
                                                              ),
                                                              MySpacing.height(
                                                                  16),
                                                              MyText.bodyMedium(
                                                                  "Kode User :"),
                                                              MySpacing.height(
                                                                  8),
                                                              TextFormField(
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Kode User cannot be empty';
                                                                  }
                                                                  return null;
                                                                },
                                                                controller: controller
                                                                    .basicValidator
                                                                    .getController(
                                                                        'kode_User'),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .emailAddress,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      "Kode User",
                                                                  labelStyle: MyTextStyle
                                                                      .bodySmall(
                                                                          xMuted:
                                                                              true),
                                                                  border:
                                                                      outlineInputBorder,
                                                                  contentPadding:
                                                                      MySpacing
                                                                          .all(
                                                                              16),
                                                                  isCollapsed:
                                                                      true,
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .never,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          actions: [
                                                            MyButton(
                                                              onPressed: () {
                                                                if (Form.of(
                                                                        context)
                                                                    .validate()) {
                                                                  // Process form submission
                                                                  // controller.onSubmit();
                                                                  Navigator.pop(
                                                                      context);
                                                                }
                                                              },
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  contentTheme
                                                                      .primary,
                                                              borderRadiusAll:
                                                                  AppStyle
                                                                      .buttonRadius
                                                                      .medium,
                                                              child: MyText
                                                                  .bodyMedium(
                                                                "Ok",
                                                                color: contentTheme
                                                                    .onPrimary,
                                                              ),
                                                            ),
                                                            MyButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  contentTheme
                                                                      .primary,
                                                              borderRadiusAll:
                                                                  AppStyle
                                                                      .buttonRadius
                                                                      .medium,
                                                              child: MyText
                                                                  .bodyMedium(
                                                                "Cancel",
                                                                color: contentTheme
                                                                    .onPrimary,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  cells: [
                                                    DataCell(MyText.bodyMedium(
                                                        '${data.id}')),
                                                    DataCell(MyText.bodyMedium(
                                                        '${data.createdAt}')),
                                                    DataCell(MyText.bodyMedium(
                                                        data.user)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.namasales)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.kodesales)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.datel)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.sto)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.namaperusahaan)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.alamatperusahaan)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.koordinat)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.odp)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.noHp)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.noHp2)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.email)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.paket)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.nosc)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.status)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.ketstatus)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.ketlain)),
                                                  ]))
                                          .toList()),
                                ),
                              )),
                        ],
                      )),
                ],
              );
            }));
  }
}
