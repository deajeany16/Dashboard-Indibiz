import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/inputan_controller.dart';
import 'package:webui/helper/extensions/string.dart';
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

class InputanScreen extends StatefulWidget {
  const InputanScreen({super.key});

  @override
  State<InputanScreen> createState() => _InputanScreenState();
}

class _InputanScreenState extends State<InputanScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late InputanController controller;

  @override
  void initState() {
    controller = Get.put(InputanController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          MyButton(
                            onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      scrollable: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      titlePadding: MySpacing.xy(16, 12),
                                      insetPadding: MySpacing.y(100),
                                      actionsPadding: MySpacing.xy(250, 16),
                                      // contentPadding: MySpacing.x(16),
                                      content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.titleMedium(
                                              "Add Order".tr(),
                                              fontSize: 18,
                                              fontWeight: 600,
                                            ),
                                            MySpacing.height(16),
                                            MyText.bodyMedium("Nama Inputer :"),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('nama'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('nama'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: Ciya Angel",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(16),
                                            MyText.bodyMedium("Nama Sales :"),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('namasales'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('namasales'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: Ciya",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(16),
                                            MyText.bodyMedium("Kode Sales :"),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('kodesales'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('kodesales'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: DS1234",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "Datel".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('datel'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('datel'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: Palangka Raya",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "STO".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('sto'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('sto'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: PLK",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "Nama Perusahaan"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation(
                                                      'namaPerusahaan'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController(
                                                      'namaPerusahaan'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: Rocket Chicken",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "Alamat Perusahaan"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation(
                                                      'alamatPerusahaan'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController(
                                                      'alamatPerushaan'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "eg: JL. Tjilik Riwut",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "ODP".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('ODP'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('ODP'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: ....",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "Koordinat".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('koordinat'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('koordinat'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: .....",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "No Hp".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('nohp'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('nohp'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: 081211223344",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "No Hp Alternatif"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('noHp2'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('noHp2'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: 081211223344",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "Email".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('email'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('email'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "eg: rocky123@gmail.com",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "Paket".tr(),
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('paket'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('paket'),
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 3,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "eg : Paket 1S Indibiz",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "No SC".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('nosc'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('nosc'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: SC-1000224431",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                            MySpacing.height(25),
                                            MyText.labelMedium(
                                              "Keterangan Lain"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('ketLain'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('ketLain'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "eg: Cancel/Input Ulang/etc...",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                          ]),
                                      actions: [
                                        MyButton(
                                          onPressed: () {
                                            if (Form.of(context).validate()) {
                                              // Process form submission
                                              // controller.onSubmit();
                                              Navigator.pop(context);
                                            }
                                          },
                                          elevation: 0,
                                          backgroundColor: contentTheme.primary,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodyMedium(
                                            "Add",
                                            color: contentTheme.onPrimary,
                                          ),
                                        ),
                                        MyButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          elevation: 0,
                                          backgroundColor: contentTheme.primary,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodyMedium(
                                            "Cancel",
                                            color: contentTheme.onPrimary,
                                          ),
                                        ),
                                      ],
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
                                      'Alamat Perusahaan'.tr().capitalizeWords,
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
                                      'No HP Alternatif'.tr().capitalizeWords,
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
                                      'Keterangan Lain'.tr().capitalizeWords,
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Aksi'.tr().capitalizeWords,
                                      color: contentTheme.primary,
                                    )),
                                  ],
                                  rows: controller.inputan
                                      .mapIndexed((index, data) => DataRow(
                                              onSelectChanged: (_) {},
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
                                                DataCell(Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.edit,
                                                          color: theme
                                                              .primaryColor,
                                                        )),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(Icons.delete,
                                                            color: Colors.red))
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
