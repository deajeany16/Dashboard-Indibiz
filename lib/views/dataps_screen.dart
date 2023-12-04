import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/app_constant.dart';
import 'package:webui/controller/ps_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/theme/app_theme.dart';
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
import 'package:webui/widgets/custom_alert.dart';
import 'package:webui/widgets/custom_input_dialog.dart';

class PSScreen extends StatefulWidget {
  const PSScreen({super.key});

  @override
  State<PSScreen> createState() => _PSScreenState();
}

class _PSScreenState extends State<PSScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late PSScreenController controller;

  @override
  void initState() {
    Get.delete<PSScreenController>();
    controller = Get.put(PSScreenController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? hakAkses = LocalStorage.getHakAkses();
    return Layout(
        child: GetBuilder<PSScreenController>(
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
                          "Data PS".tr(),
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
                          if (hakAkses == 'admin' || hakAkses == 'inputer')
                            MyButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => CustomInputDialog(
                                        title: "Tambah Order",
                                        outlineInputBorder: outlineInputBorder,
                                        focusedInputBorder: focusedInputBorder,
                                        contentTheme: contentTheme,
                                        validator: controller.inputValidator,
                                        submit: () => controller.addOrder(),
                                      )),
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: Color(0xff009678),
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
                                    'Tambah Data'.tr().capitalizeWords,
                                    color: contentTheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          MySpacing.height(16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: MyContainer.none(
                              borderRadiusAll: 4,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: DataTable(
                                  showCheckboxColumn: false,
                                  sortAscending: true,
                                  onSelectAll: (_) => {},
                                  headingRowColor: MaterialStatePropertyAll(
                                      Color(0xff009678).withAlpha(40)),
                                  dataRowMaxHeight: 60,
                                  showBottomBorder: false,
                                  columns: [
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'No'.tr(),
                                      color: Color(0xff009678),
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Tanggal Input'.tr(),
                                      color: Color(0xff009678),
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'No SC'.tr().capitalizeWords,
                                      color: Color(0xff009678),
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Nama Perusahaan'.tr(),
                                      color: Color(0xff009678),
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Paket'.tr().capitalizeWords,
                                      color: Color(0xff009678),
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Status SC'.tr().capitalizeWords,
                                      color: Color(0xff009678),
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Datel'.tr(),
                                      color: Color(0xff009678),
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Nama SP/SA/CSR'.tr(),
                                      color: Color(0xff009678),
                                    )),
                                    if (hakAkses == 'admin' ||
                                        hakAkses == 'inputer')
                                      DataColumn(
                                          label: MyText.labelLarge(
                                        'Aksi'.tr().capitalizeWords,
                                        color: Color(0xff009678),
                                      )),
                                  ],
                                  rows: controller.ps
                                      .mapIndexed(
                                          (index, data) => DataRow(
                                                  onSelectChanged: (_) {},
                                                  cells: [
                                                    DataCell(MyText.bodyMedium(
                                                        '${index + 1}')),
                                                    DataCell(MyText.bodyMedium(
                                                        dateFormatter.format(
                                                            data.createdAt))),
                                                    DataCell(MyText.bodyMedium(
                                                        data.nosc)),
                                                    DataCell(SizedBox(
                                                      width: 200,
                                                      child: MyText.bodyMedium(
                                                          data.namaperusahaan),
                                                    )),
                                                    DataCell(SizedBox(
                                                      width: 200,
                                                      child: MyText.bodyMedium(
                                                          data.paket),
                                                    )),
                                                    DataCell(SizedBox(
                                                      width: 200,
                                                      child: MyText.bodyMedium(
                                                          data.status),
                                                    )),
                                                    DataCell(MyText.bodyMedium(
                                                        data.datel)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.namasales)),
                                                    if (hakAkses == 'admin' ||
                                                        hakAkses == 'inputer')
                                                      DataCell(Row(
                                                        children: [
                                                          IconButton(
                                                              splashRadius: 30,
                                                              onPressed:
                                                                  () async {
                                                                await controller
                                                                    .getOrder(data
                                                                        .orderid);
                                                                await controller
                                                                    .onEdit();
                                                                if (mounted) {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              CustomInputDialog(
                                                                                title: "Edit Order",
                                                                                outlineInputBorder: outlineInputBorder,
                                                                                focusedInputBorder: focusedInputBorder,
                                                                                contentTheme: contentTheme,
                                                                                validator: controller.editValidator,
                                                                                submit: () => controller.editOrder(),
                                                                              ));
                                                                }
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .edit_document,
                                                                color: theme
                                                                    .primaryColor,
                                                              )),
                                                          IconButton(
                                                              splashRadius: 30,
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            CustomAlert(
                                                                              context: context,
                                                                              title: 'Hapus Data?',
                                                                              text: 'Anda Yakin Ingin Menghapus Data?',
                                                                              confirmBtnColor: theme.colorScheme.error,
                                                                              showCancelText: true,
                                                                              onConfirmBtnTap: () => controller.deleteOrder(data.orderid),
                                                                            ));
                                                              },
                                                              icon: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red))
                                                        ],
                                                      )),
                                                  ]))
                                      .toList()),
                            ),
                          ),
                        ],
                      )),
                ],
              );
            }));
  }
}
