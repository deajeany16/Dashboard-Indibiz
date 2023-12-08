import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:webui/app_constant.dart';
import 'package:webui/controller/re_controller.dart';
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
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';
import 'package:webui/widgets/custom_alert.dart';
import 'package:webui/widgets/custom_detail_dialog.dart';
import 'package:webui/widgets/custom_input_dialog.dart';

class REScreen extends StatefulWidget {
  const REScreen({super.key});

  @override
  State<REScreen> createState() => _REScreenState();
}

class _REScreenState extends State<REScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late REScreenController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.delete<REScreenController>();
    controller = Get.put(REScreenController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? hakAkses = LocalStorage.getHakAkses();
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _formKey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MySpacing.width(8),
                                    SizedBox(
                                      width: 120,
                                      child: DropdownButtonFormField<String>(
                                        key: controller.filterSTOKey,
                                        dropdownColor: contentTheme.background,
                                        menuMaxHeight: 200,
                                        isDense: true,
                                        items: controller.stoList.map((year) {
                                          return DropdownMenuItem<String>(
                                            value: year,
                                            child: MyText.labelMedium(
                                              year.toString(),
                                            ),
                                          );
                                        }).toList(),
                                        icon: Icon(
                                          Icons.expand_more,
                                          size: 20,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "STO",
                                          hintStyle: MyTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: MySpacing.all(8),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                        onChanged: (value) {
                                          if (value != null) {
                                            controller.selectedSTO = value;
                                            controller.onFilter();
                                          }
                                        },
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    SizedBox(
                                      width: 150,
                                      child: DropdownButtonFormField<String>(
                                        isExpanded: true,
                                        key: controller.filterDatelKey,
                                        dropdownColor: contentTheme.background,
                                        menuMaxHeight: 200,
                                        isDense: true,
                                        items: controller.datelList.map((year) {
                                          return DropdownMenuItem<String>(
                                            value: year,
                                            child: MyText.labelMedium(
                                              year.toString(),
                                            ),
                                          );
                                        }).toList(),
                                        icon: Icon(
                                          Icons.expand_more,
                                          size: 20,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Datel",
                                          hintStyle: MyTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: MySpacing.all(8),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                        onChanged: (value) {
                                          if (value != null) {
                                            controller.selectedDatel = value;
                                            controller.onFilter();
                                          }
                                        },
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    SizedBox(
                                      width: 120,
                                      child: TextFormField(
                                        key: controller.filterDateKey,
                                        style: MyTextStyle.labelMedium(),
                                        controller: controller.dateController,
                                        readOnly: true,
                                        onTap: () => controller.selectDate(),
                                        decoration: InputDecoration(
                                          hintText: "Pilih Tanggal",
                                          hintStyle: MyTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: MySpacing.all(11),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    MyButton.outlined(
                                      onPressed: () {
                                        controller.onResetFilter();
                                      },
                                      elevation: 0,
                                      padding: MySpacing.xy(10, 8),
                                      borderColor: contentTheme.primary,
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'Reset',
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (hakAkses == 'admin' || hakAkses == 'inputer')
                                MyButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) => CustomInputDialog(
                                            title: "Tambah Order",
                                            outlineInputBorder:
                                                outlineInputBorder,
                                            focusedInputBorder:
                                                focusedInputBorder,
                                            contentTheme: contentTheme,
                                            validator:
                                                controller.inputValidator,
                                            submit: () => controller.addOrder(),
                                          )),
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
                                      MyText.labelSmall(
                                        'Tambah Data'.tr().capitalizeWords,
                                        color: contentTheme.onPrimary,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          MySpacing.height(16),
                          MyContainer.none(
                            borderRadiusAll: 4,
                            width: double.infinity,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Skeletonizer(
                                  enabled: controller.isLoading,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: constraints.minWidth,
                                    ),
                                    child: DataTable(
                                        showCheckboxColumn: false,
                                        sortAscending: true,
                                        onSelectAll: (_) => {},
                                        headingRowColor:
                                            MaterialStatePropertyAll(
                                                contentTheme.primary
                                                    .withAlpha(40)),
                                        dataRowMaxHeight: 40,
                                        dataRowMinHeight: 20,
                                        headingRowHeight: 45,
                                        columnSpacing: 20,
                                        showBottomBorder: false,
                                        columns: [
                                          DataColumn(
                                            label: Skeleton.keep(
                                              child: MyText.labelMedium(
                                                'No'.tr(),
                                                color: contentTheme.primary,
                                              ),
                                            ),
                                          ),
                                          if (hakAkses == 'admin' ||
                                              hakAkses == 'inputer')
                                            DataColumn(
                                                label: Skeleton.keep(
                                              child: MyText.labelMedium(
                                                'Aksi'.tr().capitalizeWords,
                                                color: contentTheme.primary,
                                              ),
                                            )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'Tanggal Input'.tr(),
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'No SC'.tr().capitalizeWords,
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'Nama Perusahaan'.tr(),
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'Paket'.tr().capitalizeWords,
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'Status SC'.tr().capitalizeWords,
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'Datel'.tr(),
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'Nama SP/SA/CSR'.tr(),
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                          DataColumn(
                                              label: Skeleton.keep(
                                            child: MyText.labelMedium(
                                              'Detail'.tr(),
                                              color: contentTheme.primary,
                                            ),
                                          )),
                                        ],
                                        rows: controller.filteredRE
                                            .mapIndexed((index, data) =>
                                                DataRow(
                                                    onSelectChanged: (_) {},
                                                    cells: [
                                                      DataCell(MyText.bodySmall(
                                                          '${index + 1}')),
                                                      if (hakAkses == 'admin' ||
                                                          hakAkses == 'inputer')
                                                        DataCell(Row(
                                                          children: [
                                                            IconButton(
                                                                splashRadius:
                                                                    20,
                                                                onPressed:
                                                                    () async {
                                                                  await controller
                                                                      .getOrder(
                                                                          data.orderid);
                                                                  await controller
                                                                      .onEdit();
                                                                  if (mounted) {
                                                                    await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder: (context) =>
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
                                                                  color: contentTheme
                                                                      .primary,
                                                                )),
                                                            IconButton(
                                                                splashRadius:
                                                                    20,
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
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .red))
                                                          ],
                                                        )),
                                                      DataCell(MyText.bodySmall(
                                                          dateFormatter.format(
                                                              data.createdAt))),
                                                      DataCell(MyText.bodySmall(
                                                          data.nosc)),
                                                      DataCell(SizedBox(
                                                        width: 200,
                                                        child: MyText.bodySmall(
                                                            data.namaperusahaan),
                                                      )),
                                                      DataCell(SizedBox(
                                                        width: 200,
                                                        child: MyText.bodySmall(
                                                            data.paket),
                                                      )),
                                                      DataCell(SizedBox(
                                                        width: 200,
                                                        child: MyText.bodySmall(
                                                            data.status),
                                                      )),
                                                      DataCell(MyText.bodySmall(
                                                          data.datel)),
                                                      DataCell(MyText.bodySmall(
                                                          data.namasales)),
                                                      DataCell(Row(
                                                        children: [
                                                          IconButton(
                                                              splashRadius: 30,
                                                              onPressed:
                                                                  () async {
                                                                await controller
                                                                    .getOrder(data
                                                                        .orderid);
                                                                if (mounted) {
                                                                  await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              CustomDetailDialog(
                                                                                inputan: controller.inputan,
                                                                                title: "Detail Order",
                                                                                contentTheme: contentTheme,
                                                                              ));
                                                                }
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .info_outline,
                                                                color:
                                                                    contentTheme
                                                                        .primary,
                                                              ))
                                                        ],
                                                      )),
                                                    ]))
                                            .toList()),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      )),
                ],
              );
            }));
  }
}
