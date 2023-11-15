import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webui/controller/sales_controller.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_breadcrumb.dart';
import 'package:webui/helper/widgets/my_breadcrumb_item.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/helper/widgets/my_text_style.dart';
import 'package:webui/helper/widgets/responsive.dart';
import 'package:webui/views/layout/layout.dart';

class SalesList extends StatefulWidget {
  const SalesList({Key? key}) : super(key: key);

  @override
  State<SalesList> createState() => _SalesListState();
}

class _SalesListState extends State<SalesList>
    with SingleTickerProviderStateMixin, UIMixin {
  late SalesController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(SalesController());
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
                      "Sales List",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Sales List", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              scrollable: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              titlePadding: MySpacing.xy(16, 12),
                              insetPadding: MySpacing.y(100),
                              actionsPadding: MySpacing.xy(190, 16),
                              // contentPadding: MySpacing.x(16),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleMedium(
                                    "Add Sales".tr(),
                                    fontSize: 18,
                                    fontWeight: 600,
                                  ),
                                  MySpacing.height(16),
                                  MyText.bodyMedium("Nama Sales :"),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Nama Sales cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: controller.basicValidator
                                        .getController('nama_sales'),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: "Nama",
                                      labelStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  MySpacing.height(16),
                                  MyText.bodyMedium("Kode Sales :"),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Kode Sales cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: controller.basicValidator
                                        .getController('kode_sales'),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Kode Sales",
                                      labelStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                ],
                              ),
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
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
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
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: MyText.bodyMedium(
                                    "Cancel",
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          elevation: 0,
                          padding: MySpacing.xy(12, 16),
                          backgroundColor: contentTheme.primary,
                          borderRadiusAll: AppStyle.buttonRadius.medium,
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: contentTheme.light,
                                size: 16,
                              ),
                              MySpacing.width(16),
                              MyText.bodySmall(
                                "Add New",
                                color: contentTheme.onPrimary,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(flexSpacing),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.sales.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 150,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      MyText.titleMedium(
                                        controller.sales[index].nama_sales,
                                        fontWeight: 600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      // MySpacing.height(8),
                                      MyText.bodyMedium(
                                        controller.sales[index].kode_sales,
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
