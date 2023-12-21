import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:webui/controller/sales_controller.dart';
import 'package:webui/helper/extensions/extensions.dart';
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
import 'package:webui/widgets/custom_sales_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late SalesController controller;

  @override
  void initState() {
    super.initState();
    Get.delete<SalesController>();
    controller = Get.put(SalesController());
  }

  @override
  Widget build(BuildContext context) {
    String? hakAkses = LocalStorage.getHakAkses();
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Profil".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "My Profile", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(16),
              MyCard(
                shadow:
                    MyShadow(elevation: 0.5, position: MyShadowPosition.bottom),
                margin: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: contentTheme.primary,
                      size: 64,
                    ),
                    MySpacing.width(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.labelLarge('Nama : ${LocalStorage.getNama()}'),
                        MySpacing.height(16),
                        MyText.labelLarge(
                            'Hak Akses : ${LocalStorage.getHakAkses().toString().capitalizeWords}'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
