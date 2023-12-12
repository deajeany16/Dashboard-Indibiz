import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:webui/app_constant.dart';
import 'package:webui/controller/inputan_controller.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/utils/utils.dart';
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
import 'package:webui/widgets/custom_detail_dialog.dart';
import 'package:webui/widgets/custom_input_dialog.dart';

class InputanScreen extends StatefulWidget {
  const InputanScreen({super.key});

  @override
  State<InputanScreen> createState() => _InputanScreenState();
}

class _InputanScreenState extends State<InputanScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late InputanController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Get.delete<InputanController>();
    controller = Get.put(InputanController());
  }

  @override
  Widget build(BuildContext context) {
    String? hakAkses = LocalStorage.getHakAkses();
    return Layout(
        child: GetBuilder<InputanController>(
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
                          "Data Inputan".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(
                                name: 'Data Order'.tr(), active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: MySpacing.xy(24, 16),
                    child: TextField(
                      onSubmitted: (value) => controller.onSearch(value),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theme.cardTheme.color,
                        hoverColor: theme.cardTheme.color,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 18,
                        ),
                        isDense: true,
                        labelText: "Cari Order (berdasarkan nomor SC)",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: focusedInputBorder,
                        contentPadding: MySpacing.horizontal(20),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  MyCard(
                      shadow: MyShadow(
                          elevation: 0.5, position: MyShadowPosition.bottom),
                      margin: MySpacing.x(flexSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Form(
                                key: _formKey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MySpacing.width(8),
                                    Icon(
                                      Icons.filter_list_outlined,
                                      color: contentTheme.primary,
                                      size: 24,
                                    ),
                                    MySpacing.width(12),
                                    PopupMenuButton(
                                      tooltip: "Pilih STO",
                                      itemBuilder: (BuildContext context) {
                                        return controller.stoList.map((item) {
                                          return PopupMenuItem(
                                            value: item,
                                            height: 32,
                                            child: MyText.bodySmall(
                                              item.toString(),
                                              color: theme
                                                  .colorScheme.onBackground,
                                              fontWeight: 600,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      offset: const Offset(0, 32),
                                      onSelected: (value) {
                                        controller.selectedSTO =
                                            value.toString();
                                        controller.onFilter();
                                      },
                                      color: theme.cardTheme.color,
                                      child: MyContainer.bordered(
                                        borderColor: contentTheme.primary,
                                        padding: MySpacing.xy(8, 4),
                                        child: Row(
                                          children: <Widget>[
                                            MyText.labelMedium(
                                                controller.selectedSTO,
                                                fontWeight: 600,
                                                color: contentTheme.primary),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 4),
                                              child: Icon(Icons.expand_more,
                                                  size: 22,
                                                  color: contentTheme.primary),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    PopupMenuButton(
                                      tooltip: "Pilih Datel",
                                      itemBuilder: (BuildContext context) {
                                        return controller.datelList.map((item) {
                                          return PopupMenuItem(
                                            value: item,
                                            height: 32,
                                            child: MyText.bodySmall(
                                              item.toString(),
                                              color: theme
                                                  .colorScheme.onBackground,
                                              fontWeight: 600,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      offset: const Offset(0, 32),
                                      onSelected: (value) {
                                        controller.selectedDatel =
                                            value.toString();
                                        controller.onFilter();
                                      },
                                      color: theme.cardTheme.color,
                                      child: MyContainer.bordered(
                                        borderColor: contentTheme.primary,
                                        padding: MySpacing.xy(8, 4),
                                        child: Row(
                                          children: <Widget>[
                                            MyText.labelMedium(
                                                controller.selectedDatel,
                                                fontWeight: 600,
                                                color: contentTheme.primary),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 4),
                                              child: Icon(Icons.expand_more,
                                                  size: 22,
                                                  color: contentTheme.primary),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    MyButton.outlined(
                                      onPressed: () {
                                        controller.selectDate();
                                      },
                                      borderColor: contentTheme.primary,
                                      padding: MySpacing.xy(15, 15),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            color: contentTheme.primary,
                                            size: 16,
                                          ),
                                          MySpacing.width(10),
                                          MyText.labelMedium(
                                              controller.selectedDate != null
                                                  ? dateFormatter.format(
                                                      controller.selectedDate!)
                                                  : "Pilih Tanggal"
                                                      .tr()
                                                      .capitalizeWords,
                                              fontWeight: 600,
                                              color: contentTheme.primary),
                                        ],
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    if (controller.isFiltered)
                                      MyButton.outlined(
                                        onPressed: () {
                                          controller.onResetFilter();
                                        },
                                        elevation: 0,
                                        padding: MySpacing.xy(10, 8),
                                        borderColor: contentTheme.primary,
                                        splashColor: contentTheme.primary
                                            .withOpacity(0.1),
                                        borderRadiusAll: 20,
                                        child: MyText.bodySmall(
                                          'Reset',
                                          color: contentTheme.primary,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Tooltip(
                                    message: "Download File Excel",
                                    child: MyButton.outlined(
                                      onPressed: () => Utils.createExcelFile(
                                          controller.semuaInputan),
                                      padding: MySpacing.xy(16, 16),
                                      borderColor:
                                          contentTheme.primary.withAlpha(40),
                                      child: Icon(
                                        Icons.download,
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                  ),
                                  MySpacing.width(8),
                                  if (hakAkses == 'admin' ||
                                      hakAkses == 'inputer')
                                    MyButton(
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) =>
                                              CustomInputDialog(
                                                title: "Tambah Order",
                                                outlineInputBorder:
                                                    outlineInputBorder,
                                                focusedInputBorder:
                                                    focusedInputBorder,
                                                contentTheme: contentTheme,
                                                validator:
                                                    controller.inputValidator,
                                                submit: () =>
                                                    controller.addOrder(),
                                              )),
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: Icon(
                                        Icons.add_outlined,
                                        size: 20,
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                ],
                              )
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
                                  child: SelectionArea(
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
                                          dataRowMaxHeight: double.infinity,
                                          dataRowMinHeight: 40,
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
                                                  color: contentTheme.primary),
                                            )),
                                            DataColumn(
                                                label: Skeleton.keep(
                                              child: MyText.labelMedium(
                                                  'No SC'.tr().capitalizeWords,
                                                  color: contentTheme.primary),
                                            )),
                                            DataColumn(
                                                label: Skeleton.keep(
                                              child: MyText.labelMedium(
                                                  'Nama Perusahaan'.tr(),
                                                  color: contentTheme.primary),
                                            )),
                                            DataColumn(
                                                label: Skeleton.keep(
                                              child: MyText.labelMedium(
                                                  'Paket'.tr().capitalizeWords,
                                                  color: contentTheme.primary),
                                            )),
                                            DataColumn(
                                                label: Skeleton.keep(
                                              child: MyText.labelMedium(
                                                  'Status SC'
                                                      .tr()
                                                      .capitalizeWords,
                                                  color: contentTheme.primary),
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
                                                  color: contentTheme.primary),
                                            )),
                                            DataColumn(
                                                label: Skeleton.keep(
                                              child: MyText.labelMedium(
                                                  'Detail'.tr(),
                                                  color: contentTheme.primary),
                                            )),
                                          ],
                                          rows: controller.filteredInputan
                                              .mapIndexed((index, data) =>
                                                  DataRow(
                                                      onSelectChanged: (_) {},
                                                      cells: [
                                                        DataCell(
                                                            MyText.bodySmall(
                                                                '${index + 1}')),
                                                        if (hakAkses ==
                                                                'admin' ||
                                                            hakAkses ==
                                                                'inputer')
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
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder: (context) =>
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
                                                            dateFormatter
                                                                .format(data
                                                                    .createdAt))),
                                                        DataCell(
                                                            MyText.bodySmall(
                                                                data.nosc)),
                                                        DataCell(SizedBox(
                                                          width: 200,
                                                          child: MyText
                                                              .bodySmall(data
                                                                  .namaperusahaan),
                                                        )),
                                                        DataCell(SizedBox(
                                                          width: 200,
                                                          child:
                                                              MyText.bodySmall(
                                                                  data.paket),
                                                        )),
                                                        DataCell(SizedBox(
                                                          width: 200,
                                                          child:
                                                              MyText.bodySmall(
                                                                  data.status),
                                                        )),
                                                        DataCell(
                                                            MyText.bodySmall(
                                                                data.datel)),
                                                        DataCell(MyText
                                                            .bodySmall(data
                                                                .namasales)),
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
                                                                  if (mounted) {
                                                                    await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder: (context) =>
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
                                                                  color: contentTheme
                                                                      .primary,
                                                                ))
                                                          ],
                                                        )),
                                                      ]))
                                              .toList()),
                                    ),
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
