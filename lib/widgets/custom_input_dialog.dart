import 'package:flutter/material.dart';
import 'package:webui/controller/inputan_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';

class CustomInputDialog extends StatelessWidget {
  const CustomInputDialog(
      {super.key,
      required this.outlineInputBorder,
      required this.focusedInputBorder,
      required this.contentTheme,
      required this.title});

  final OutlineInputBorder outlineInputBorder;
  final OutlineInputBorder focusedInputBorder;
  final ContentTheme contentTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    InputanController controller = Get.find<InputanController>();
    return Dialog(
      // scrollable: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // titlePadding: MySpacing.xy(16, 12),
      insetPadding: MySpacing.xy(200, 100),
      // actionsAlignment: MainAxisAlignment.end,
      // actionsPadding: MySpacing.xy(250, 16),
      // contentPadding: MySpacing.x(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: title == "Tambah Order"
              ? controller.inputValidator.formKey
              : controller.editValidator.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.titleMedium(
                title.tr(),
                fontSize: 18,
                fontWeight: 600,
              ),
              MySpacing.height(16),
              MyText.bodyMedium("Nama Inputer :"),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('nama')
                    : controller.editValidator.getValidation('nama'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('nama')
                    : controller.editValidator.getController('nama'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: Ciya",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.bodyMedium("Nama Sales :"),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('namasales')
                    : controller.editValidator.getValidation('namasales'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('namasales')
                    : controller.editValidator.getController('namasales'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: Ciya",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.bodyMedium("Kode Sales :"),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('kodesales')
                    : controller.editValidator.getValidation('kodesales'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('kodesales')
                    : controller.editValidator.getController('kodesales'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: DS1234",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "Datel".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('datel')
                    : controller.editValidator.getValidation('datel'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('datel')
                    : controller.editValidator.getController('datel'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: Palangka Raya",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "STO".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('sto')
                    : controller.editValidator.getValidation('sto'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('sto')
                    : controller.editValidator.getController('sto'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: PLK",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "Nama Perusahaan".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('namaperusahaan')
                    : controller.editValidator.getValidation('namaperusahaan'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('namaperusahaan')
                    : controller.editValidator.getController('namaperusahaan'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: Rocket Chicken",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "Alamat Perusahaan".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('alamat')
                    : controller.editValidator.getValidation('alamat'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('alamat')
                    : controller.editValidator.getController('alamat'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: JL. Tjilik Riwut",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "ODP".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('odp')
                    : controller.editValidator.getValidation('odp'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('odp')
                    : controller.editValidator.getController('odp'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: ....",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "Koordinat".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('koordinat')
                    : controller.editValidator.getValidation('koordinat'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('koordinat')
                    : controller.editValidator.getController('koordinat'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: .....",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "No Hp".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('nohp')
                    : controller.editValidator.getValidation('nohp'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('nohp')
                    : controller.editValidator.getController('nohp'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: 081211223344",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "No Hp Alternatif".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('nohp2')
                    : controller.editValidator.getValidation('nohp2'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('nohp2')
                    : controller.editValidator.getController('nohp2'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: 081211223344",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "Email".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('email')
                    : controller.editValidator.getValidation('email'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('email')
                    : controller.editValidator.getController('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "eg: rocky123@gmail.com",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "Paket".tr(),
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('paket')
                    : controller.editValidator.getValidation('paket'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('paket')
                    : controller.editValidator.getController('paket'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "eg : Paket 1S Indibiz",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "No SC".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('nosc')
                    : controller.editValidator.getValidation('nosc'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('nosc')
                    : controller.editValidator.getController('nosc'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: SC-1000224431",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              MySpacing.height(25),
              MyText.labelMedium(
                "Keterangan Lain".tr().capitalizeWords,
              ),
              MySpacing.height(8),
              TextFormField(
                validator: title == "Tambah Order"
                    ? controller.inputValidator.getValidation('ket')
                    : controller.editValidator.getValidation('ket'),
                controller: title == "Tambah Order"
                    ? controller.inputValidator.getController('ket')
                    : controller.editValidator.getController('ket'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: Cancel/Input Ulang/etc...",
                  labelStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              Padding(
                padding: MySpacing.y(16),
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
                    MySpacing.width(16),
                    MyButton.rounded(
                      onPressed: () async {
                        if (title == "Tambah Order") {
                          await controller.addOrder(context);
                        } else {
                          await controller.editOrder(context);
                        }
                      },
                      elevation: 0,
                      padding: MySpacing.xy(20, 16),
                      backgroundColor: contentTheme.primary,
                      child: MyText.labelMedium(
                        "save".tr(),
                        color: contentTheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // actions: [
      //   MyButton(
      //     onPressed: () async {
      //       // if (Form.of(context).validate()) {
      //       // Process form submission
      //       if (title == "Tambah Order") {
      //         await controller.addOrder(context);
      //       } else {
      //         await controller.editOrder(context);
      //       }
      //       // }
      //     },
      //     elevation: 0,
      //     backgroundColor: contentTheme.primary,
      //     borderRadiusAll: AppStyle.buttonRadius.medium,
      //     child: MyText.bodyMedium(
      //       "Add",
      //       color: contentTheme.onPrimary,
      //     ),
      //   ),
      //   MyButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     elevation: 0,
      //     backgroundColor: contentTheme.primary,
      //     borderRadiusAll: AppStyle.buttonRadius.medium,
      //     child: MyText.bodyMedium(
      //       "Cancel",
      //       color: contentTheme.onPrimary,
      //     ),
      //   ),
      // ],
    );
  }
}
