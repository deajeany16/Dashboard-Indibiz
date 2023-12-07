import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:webui/controller/user_controller.dart';
import 'package:webui/helper/extensions/extensions.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/helper/theme/app_style.dart';
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
import 'package:webui/widgets/custom_user_dialog.dart';

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
    Get.delete<UserController>();
    controller = Get.put(UserController());
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
              Row(
                children: [
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              MyCard(
                shadow:
                    MyShadow(elevation: 0.5, position: MyShadowPosition.bottom),
                margin: MySpacing.x(flexSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => CustomUserDialog(
                                title: "Tambah User",
                                outlineInputBorder: outlineInputBorder,
                                focusedInputBorder: focusedInputBorder,
                                contentTheme: contentTheme,
                                validator: controller.inputValidator,
                                submit: () => controller.addUser(),
                              )),
                      elevation: 0,
                      padding: MySpacing.xy(20, 16),
                      backgroundColor: Color.fromRGBO(0, 169, 255, 1),
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
                          MyText.labelSmall(
                            'Tambah Data'.tr().capitalizeWords,
                            color: contentTheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                    MySpacing.height(14),
                    MyContainer.none(
                      borderRadiusAll: 4,
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: LayoutBuilder(builder: (
                        context,
                        constraints,
                      ) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Skeletonizer(
                            enabled: controller.isLoading,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: constraints.minWidth,
                              ),
                              child: DataTable(
                                  showCheckboxColumn: false,
                                  sortAscending: true,
                                  onSelectAll: (_) => {},
                                  headingRowColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(0, 169, 255, 1)
                                          .withAlpha(40)),
                                  dataRowMaxHeight: 40,
                                  dataRowMinHeight: 20,
                                  headingRowHeight: 45,
                                  columnSpacing: 20,
                                  showBottomBorder: false,
                                  columns: [
                                    DataColumn(
                                        label: Skeleton.keep(
                                      child: MyText.labelMedium(
                                        'No'.tr(),
                                        color: Color.fromRGBO(0, 169, 255, 1),
                                      ),
                                    )),
                                    DataColumn(
                                        label: Skeleton.keep(
                                      child: MyText.labelMedium(
                                        'Nama'.tr(),
                                        color: Color.fromRGBO(0, 169, 255, 1),
                                      ),
                                    )),
                                    DataColumn(
                                        label: Skeleton.keep(
                                      child: MyText.labelMedium(
                                        'Username'.tr(),
                                        color: Color.fromRGBO(0, 169, 255, 1),
                                      ),
                                    )),
                                    DataColumn(
                                        label: Skeleton.keep(
                                      child: MyText.labelMedium(
                                        'Hak Akses'.tr(),
                                        color: Color.fromRGBO(0, 169, 255, 1),
                                      ),
                                    )),
                                    if (hakAkses == 'admin' ||
                                        hakAkses == 'inputer')
                                      DataColumn(
                                        label: Skeleton.keep(
                                          child: MyText.labelMedium(
                                            'Aksi'.tr().capitalizeWords,
                                            color:
                                                Color.fromRGBO(0, 169, 255, 1),
                                          ),
                                        ),
                                      ),
                                  ],
                                  rows: controller.semuaUser
                                      .mapIndexed(
                                        (index, data) => DataRow(
                                            onSelectChanged: (_) {},
                                            cells: [
                                              DataCell(MyText.bodySmall(
                                                  '${index + 1}')),
                                              DataCell(
                                                  MyText.bodySmall(data.nama)),
                                              DataCell(MyText.bodySmall(
                                                  data.username)),
                                              DataCell(MyText.bodySmall(
                                                  data.hak_akses)),
                                              if (hakAkses == 'admin' ||
                                                  hakAkses == 'inputer')
                                                DataCell(
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          splashRadius: 20,
                                                          onPressed: () async {
                                                            await controller
                                                                .getUser(
                                                                    data.usid);
                                                            await controller
                                                                .onEdit();
                                                            if (mounted) {
                                                              await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          CustomUserDialog(
                                                                            title:
                                                                                "Edit User",
                                                                            outlineInputBorder:
                                                                                outlineInputBorder,
                                                                            focusedInputBorder:
                                                                                focusedInputBorder,
                                                                            contentTheme:
                                                                                contentTheme,
                                                                            validator:
                                                                                controller.editValidator,
                                                                            submit: () =>
                                                                                controller.editOrder(),
                                                                          ));
                                                            }
                                                          },
                                                          icon: Icon(
                                                              Icons
                                                                  .edit_document,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      169,
                                                                      255,
                                                                      1))),
                                                      IconButton(
                                                          splashRadius: 20,
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
                                                                              contentTheme.red,
                                                                          showCancelText:
                                                                              true,
                                                                          onConfirmBtnTap: () =>
                                                                              controller.deleteOrder(data.usid),
                                                                        ));
                                                          },
                                                          icon: Icon(
                                                              Icons.delete,
                                                              color:
                                                                  Colors.red))
                                                    ],
                                                  ),
                                                ),
                                            ]),
                                      )
                                      .toList()),
                            ),
                          ),
                        );
                      }),
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
