import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
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
                    MySpacing.height(14),
                    controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
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
                                      'Nama'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Username'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: MyText.labelLarge(
                                      'Hak Akses'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    if (hakAkses == 'admin' ||
                                        hakAkses == 'inputer')
                                      DataColumn(
                                          label: MyText.labelLarge(
                                        'Aksi'.tr().capitalizeWords,
                                        color: contentTheme.primary,
                                      )),
                                  ],
                                  rows: controller.semuaUser
                                      .mapIndexed(
                                          (index, data) => DataRow(
                                                  onSelectChanged: (_) {},
                                                  cells: [
                                                    DataCell(MyText.bodyMedium(
                                                        '${index + 1}')),
                                                    DataCell(MyText.bodyMedium(
                                                        data.nama)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.username)),
                                                    DataCell(MyText.bodyMedium(
                                                        data.hak_akses)),
                                                    if (hakAkses == 'admin' ||
                                                        hakAkses == 'inputer')
                                                      DataCell(Row(
                                                        children: [
                                                          IconButton(
                                                              splashRadius: 30,
                                                              onPressed:
                                                                  () async {
                                                                await controller
                                                                    .getUser(data
                                                                        .usid);
                                                                await controller
                                                                    .onEdit();
                                                                if (mounted) {
                                                                  await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              CustomUserDialog(
                                                                                title: "Edit User",
                                                                                outlineInputBorder: outlineInputBorder,
                                                                                focusedInputBorder: focusedInputBorder,
                                                                                contentTheme: contentTheme,
                                                                                validator: controller.editValidator,
                                                                                submit: () => controller.editOrder(),
                                                                              ));
                                                                }
                                                              },
                                                              icon: Icon(
                                                                  Icons
                                                                      .edit_document,
                                                                  color: contentTheme
                                                                      .primary)),
                                                          IconButton(
                                                              splashRadius: 30,
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            CustomAlert(
                                                                              context: context,
                                                                              title: 'Hapus Data?',
                                                                              text: 'Anda Yakin Ingin Menghapus Data?',
                                                                              confirmBtnColor: contentTheme.red,
                                                                              showCancelText: true,
                                                                              onConfirmBtnTap: () => controller.deleteOrder(data.usid),
                                                                            ));
                                                              },
                                                              icon: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red))
                                                        ],
                                                      )),
                                                  ]))
                                      .toList()),
                            ),
                          ),
                  ],
                ),
              ),
              // GridView.builder(
              //     padding: MySpacing.x(20),
              //     shrinkWrap: true,
              //     itemCount: controller.semuaUser.length,
              //     gridDelegate:
              //         const SliverGridDelegateWithMaxCrossAxisExtent(
              //       maxCrossAxisExtent: 400,
              //       childAspectRatio: 2.5,
              //       crossAxisSpacing: 16,
              //       mainAxisSpacing: 16,
              //       // mainAxisExtent: 150,
              //     ),
              //     itemBuilder: (context, index) {
              //       return MyCard(
              //         paddingAll: 0,
              //         borderRadiusAll: 12,
              //         shadow: MyShadow(elevation: 0.5),
              //         child: Row(
              //           children: [
              //             Expanded(
              //               child: Padding(
              //                 padding: MySpacing.xy(16, 12),
              //                 child: Column(
              //                   crossAxisAlignment:
              //                       CrossAxisAlignment.start,
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceAround,
              //                   children: [
              //                     MyText.titleMedium(
              //                       controller.semuaUser[index].nama,
              //                       fontWeight: 600,
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                     // MySpacing.height(8),
              //                     MyText.bodyMedium(
              //                       controller.semuaUser[index].username,
              //                       fontSize: 16,
              //                       fontWeight: 500,
              //                       muted: true,
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                     MySpacing.height(8),
              //                   ],
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       );
              //     },
              //   ),
            ],
          );
        },
      ),
    );
  }
}
