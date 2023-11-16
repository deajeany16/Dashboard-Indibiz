import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/ps_controller.dart';
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
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class PSScreen extends StatefulWidget {
  const PSScreen({super.key});

  @override
  State<PSScreen> createState() => _PSScreenState();
}

class _PSScreenState extends State<PSScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late PSSCreenController controller;

  @override
  void initState() {
    controller = Get.put(PSSCreenController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetBuilder<PSSCreenController>(
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
                            onPressed: controller.goToCreatePS,
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
                                      rows: controller.ps
                                          .mapIndexed(
                                              (index, data) => DataRow(cells: [
                                                    DataCell(MyText.bodyMedium(
                                                        data.orderid)),
                                                    DataCell(MyText.bodyMedium(
                                                        '${data.createdAt}')),
                                                    DataCell(MyText.bodyMedium(
                                                        data.nama)),
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
                                                        data.alamat)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.koordinat)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.odp)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.nohp)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.nohp2)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.email)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.paket)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.nosc)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.status)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.ket)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.ketLain)),
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
