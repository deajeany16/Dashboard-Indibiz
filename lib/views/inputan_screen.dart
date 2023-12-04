import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/app_constant.dart';
import 'package:webui/controller/inputan_controller.dart';
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
                                name: 'Data Inputan'.tr(), active: true),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: DropdownButtonFormField<String>(
                                        key: controller.filterMonthKey,
                                        validator: (value) => value == null
                                            ? 'Pilih Bulan'
                                            : null,
                                        alignment: AlignmentDirectional.center,
                                        dropdownColor: contentTheme.background,
                                        menuMaxHeight: 200,
                                        isDense: true,
                                        items:
                                            controller.monthList.map((month) {
                                          return DropdownMenuItem<String>(
                                            value: month,
                                            child: MyText.labelMedium(
                                              month,
                                            ),
                                          );
                                        }).toList(),
                                        icon: Icon(
                                          Icons.expand_more,
                                          size: 20,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Bulan",
                                          hintStyle: MyTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: MySpacing.all(14),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                        onChanged: (value) {
                                          if (value != null) {
                                            controller.selectedMonth = value;
                                          }
                                        },
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    SizedBox(
                                      width: 120,
                                      child: DropdownButtonFormField<String>(
                                        key: controller.filterYearKey,
                                        validator: (value) => value == null
                                            ? 'Pilih Tahun'
                                            : null,
                                        dropdownColor: contentTheme.background,
                                        menuMaxHeight: 200,
                                        isDense: true,
                                        items: controller.yearList.map((year) {
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
                                          hintText: "Tahun",
                                          hintStyle: MyTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: MySpacing.all(14),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                        onChanged: (value) {
                                          if (value != null) {
                                            controller.selectedYear = value;
                                          }
                                        },
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    // MyButton(
                                    //     elevation: 0,
                                    //     padding: MySpacing.xy(5, 8),
                                    //     backgroundColor: contentTheme.primary,
                                    //     borderRadiusAll:
                                    //         AppStyle.buttonRadius.medium,
                                    //     onPressed: () {},
                                    //     child: Icon(Icons.filter_alt_outlined)),
                                    // MySpacing.width(8),
                                    MyButton.outlined(
                                      onPressed: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          controller.onFilter();
                                        }
                                      },
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.primary,
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'Filter',
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    MyButton.outlined(
                                      onPressed: () {
                                        controller.onResetFilter();
                                      },
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      borderColor: contentTheme.primary,
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.1),
                                      borderRadiusAll: 20,
                                      child: MyText.bodySmall(
                                        'Reset',
                                        color: contentTheme.primary,
                                      ),
                                    )
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
                                      MyText.labelMedium(
                                        'Tambah Data'.tr().capitalizeWords,
                                        color: contentTheme.onPrimary,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          MySpacing.height(16),
                          controller.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: MyContainer.none(
                                    borderRadiusAll: 4,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: DataTable(
                                        showCheckboxColumn: false,
                                        sortAscending: true,
                                        onSelectAll: (_) => {},
                                        headingRowColor:
                                            MaterialStatePropertyAll(
                                                contentTheme.primary
                                                    .withAlpha(40)),
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
                                            'No SC'.tr().capitalizeWords,
                                            color: contentTheme.primary,
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Nama Perusahaan'.tr(),
                                            color: contentTheme.primary,
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Paket'.tr().capitalizeWords,
                                            color: contentTheme.primary,
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Status SC'.tr().capitalizeWords,
                                            color: contentTheme.primary,
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Datel'.tr(),
                                            color: contentTheme.primary,
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Nama SP/SA/CSR'.tr(),
                                            color: contentTheme.primary,
                                          )),
                                          if (hakAkses == 'admin' ||
                                              hakAkses == 'inputer')
                                            DataColumn(
                                                label: MyText.labelLarge(
                                              'Aksi'.tr().capitalizeWords,
                                              color: contentTheme.primary,
                                            )),
                                        ],
                                        rows: controller.filteredInputan
                                            .mapIndexed((index, data) =>
                                                DataRow(cells: [
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
                                                                await showDialog(
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
                                                                            context:
                                                                                context,
                                                                            title:
                                                                                'Hapus Data?',
                                                                            text:
                                                                                'Anda Yakin Ingin Menghapus Data?',
                                                                            confirmBtnColor:
                                                                                theme.colorScheme.error,
                                                                            showCancelText:
                                                                                true,
                                                                            onConfirmBtnTap: () =>
                                                                                controller.deleteOrder(data.orderid),
                                                                          ));
                                                            },
                                                            icon: Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red))
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
