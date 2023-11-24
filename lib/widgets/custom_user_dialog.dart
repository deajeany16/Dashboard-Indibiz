import 'package:flutter/material.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';

class CustomUserDialog extends StatelessWidget {
  const CustomUserDialog(
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
      clipBehavior: Clip.antiAliasWithSaveLayer,
      insetPadding: MySpacing.xy(150, 100),
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
              MyText.bodyMedium("Nama :"),
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
              MyText.bodyMedium("Username :"),
              MySpacing.height(8),
              TextFormField(
                validator: validator.getValidation('username'),
                controller: validator.getController('username'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: user1111",
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
              title == "Tambah User"
                  ? MyText.bodyMedium("Password :")
                  : MyText.bodyMedium("Password Baru :"),
              MySpacing.height(8),
              TextFormField(
                validator: validator.getValidation('pass'),
                controller: validator.getController('pass'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: rahasia",
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
              MyText.bodyMedium("Hak Akses :"),
              MySpacing.height(8),
              TextFormField(
                validator: validator.getValidation('hak_akses'),
                controller: validator.getController('hak_akses'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "eg: admin/inputer/sales",
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
    );
  }
}
