import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/user_controller.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList>
    with SingleTickerProviderStateMixin, UIMixin {
  late UserController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(UserController());
  }

  @override
  Widget build(BuildContext context) {
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
                      "User List",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "User List", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(10),
              Row(children: [
                Expanded(
                    child: Padding(
                  padding: MySpacing.xy(25, 16),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      maxLines: 1,
                      style: MyTextStyle.bodyMedium(),
                      decoration: InputDecoration(
                          hintText: "search",
                          hintStyle: MyTextStyle.bodySmall(xMuted: true),
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: focusedInputBorder,
                          prefixIcon: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.search,
                                size: 14,
                              )),
                          prefixIconConstraints: const BoxConstraints(
                              minWidth: 36,
                              maxWidth: 36,
                              minHeight: 32,
                              maxHeight: 32),
                          contentPadding: MySpacing.xy(16, 12),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                    ),
                  ),
                ))
              ]),
              MySpacing.height(flexSpacing),
              GridView.builder(
                padding: MySpacing.x(20),
                shrinkWrap: true,
                itemCount: controller.user.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  // mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  return MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 12,
                    shadow: MyShadow(elevation: 0.5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: MySpacing.xy(16, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyText.titleMedium(
                                  controller.user[index].nama,
                                  fontWeight: 600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // MySpacing.height(8),
                                MyText.bodyMedium(
                                  controller.user[index].username,
                                  fontSize: 16,
                                  fontWeight: 500,
                                  muted: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                MySpacing.height(8),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
