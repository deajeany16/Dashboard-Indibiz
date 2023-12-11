import 'package:flutter/material.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';

class CustomSalesDialog extends StatelessWidget {
  const CustomSalesDialog(
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
        // titlePadding: MySpacing.xy(16, 12),
        insetPadding: MySpacing.xy(50, 50),
        // actionsAlignment: MainAxisAlignment.end,
        // actionsPadding: MySpacing.xy(250, 16),
        // contentPadding: MySpacing.x(16),
        child: SizedBox(
          width: 500,
          height: 450,
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
                  MyText.bodyMedium("Nama Sales :"),
                  MySpacing.height(8),
                  TextFormField(
                    validator: validator.getValidation('namaa'),
                    controller: validator.getController('namaa'),
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
                  MyText.bodyMedium("Kode Sales:"),
                  MySpacing.height(8),
                  TextFormField(
                    validator: validator.getValidation('kodee'),
                    controller: validator.getController('kodee'),
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
                    "Username Tele".tr().capitalizeWords,
                  ),
                  MySpacing.height(8),
                  TextFormField(
                    validator: validator.getValidation('usertele'),
                    controller: validator.getController('usertele'),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "eg: @abcdefg",
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
        ));
  }
}
