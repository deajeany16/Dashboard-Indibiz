import 'package:flutter/material.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';

class CustomInputDialog extends StatelessWidget {
  const CustomInputDialog(
      {super.key,
      required this.outlineInputBorder,
      required this.focusedInputBorder,
      required this.contentTheme,
      required this.title,
      required this.validator,
      required this.submit});

  final OutlineInputBorder outlineInputBorder;
  final OutlineInputBorder focusedInputBorder;
  final ContentTheme contentTheme;
  final String title;
  final MyFormValidator validator;
  final Future Function() submit;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // scrollable: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // titlePadding: MySpacing.xy(16, 12),
      insetPadding: MySpacing.xy(150, 100),
      // actionsAlignment: MainAxisAlignment.end,
      // actionsPadding: MySpacing.xy(250, 16),
      // contentPadding: MySpacing.x(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: validator.formKey,
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
                validator: validator.getValidation('nama'),
                controller: validator.getController('nama'),
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
                validator: validator.getValidation('namasales'),
                controller: validator.getController('namasales'),
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
                validator: validator.getValidation('kodesales'),
                controller: validator.getController('kodesales'),
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
                validator: validator.getValidation('datel'),
                controller: validator.getController('datel'),
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
                validator: validator.getValidation('sto'),
                controller: validator.getController('sto'),
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
                validator: validator.getValidation('namaperusahaan'),
                controller: validator.getController('namaperusahaan'),
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
                validator: validator.getValidation('alamat'),
                controller: validator.getController('alamat'),
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
                validator: validator.getValidation('odp'),
                controller: validator.getController('odp'),
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
                validator: validator.getValidation('koordinat'),
                controller: validator.getController('koordinat'),
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
                validator: validator.getValidation('nohp'),
                controller: validator.getController('nohp'),
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
                validator: validator.getValidation('nohp2'),
                controller: validator.getController('nohp2'),
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
                validator: validator.getValidation('email'),
                controller: validator.getController('email'),
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
                validator: validator.getValidation('paket'),
                controller: validator.getController('paket'),
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
                validator: validator.getValidation('nosc'),
                controller: validator.getController('nosc'),
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
                validator: validator.getValidation('ket'),
                controller: validator.getController('ket'),
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
                        submit();
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
