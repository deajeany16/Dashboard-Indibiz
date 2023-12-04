import 'package:flutter/material.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';

class CustomDetailDialog extends StatelessWidget {
  const CustomDetailDialog({
    super.key,
    required this.contentTheme,
    required this.title,
  });

  final ContentTheme contentTheme;
  final String title;

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
        height: 500,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.titleMedium(
                title.tr(),
                fontSize: 18,
                fontWeight: 600,
              ),
              Padding(
                padding: MySpacing.y(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MySpacing.width(16),
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
