import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/data/controllers/cart_controller.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/route/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrders = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrders.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrders.update(
          getCartHistoryList[i].time!,
          (value) => ++value,
        );
      } else {
        cartItemsPerOrders.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrders.entries
          .map(
            (e) => e.value,
          )
          .toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrders.entries
          .map(
            (e) => e.key,
          )
          .toList();
    }

    List<String> orderTime = cartOrderTimeToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy a");
        outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            height: Dimensions.height10 * 10,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(
                    text: "Cart History",
                    color: Colors.white,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: AppColors.mainColor,
                  ),
                ]),
          ),
          GetBuilder<CartController>(
            builder: (_cartController) {
              return _cartController.getCartHistoryList().length > 0
                  ? Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.height20,
                              left: Dimensions.height20,
                              right: Dimensions.height20),
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView(
                              children: [
                                for (int i = 0; i < itemsPerOrder.length; i++)
                                  Container(
                                    height: Dimensions.height120,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        timeWidget(listCounter),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: List.generate(
                                                  itemsPerOrder[i], (index) {
                                                if (listCounter <
                                                    getCartHistoryList.length) {
                                                  listCounter++;
                                                }
                                                return index <= 2
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            right: Dimensions
                                                                    .width10 /
                                                                2),
                                                        height: Dimensions
                                                                .height40 *
                                                            2,
                                                        width:
                                                            Dimensions.width40 *
                                                                2,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    Dimensions
                                                                            .radius15 /
                                                                        2),
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: NetworkImage(AppConstants
                                                                        .BASE_URL +
                                                                    AppConstants
                                                                        .UPLOAD_URL +
                                                                    getCartHistoryList[
                                                                            listCounter -
                                                                                1]
                                                                        .img!))),
                                                      )
                                                    : Container();
                                              }),
                                            ),
                                            Container(
                                              height: Dimensions.height80,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SmallText(
                                                    text: "Total",
                                                    color: AppColors.titleColor,
                                                  ),
                                                  (itemsPerOrder[i] == 1)
                                                      ? BigText(
                                                          text: itemsPerOrder[i]
                                                                  .toString() +
                                                              " Item",
                                                          color: AppColors
                                                              .titleColor,
                                                        )
                                                      : BigText(
                                                          text: itemsPerOrder[i]
                                                                  .toString() +
                                                              " Items",
                                                          color: AppColors
                                                              .titleColor,
                                                        ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Map<int, CartModel>
                                                          moreOrder = {};
                                                      for (int j = 0;
                                                          j <
                                                              getCartHistoryList
                                                                  .length;
                                                          j++) {
                                                        if (getCartHistoryList[
                                                                    j]
                                                                .time! ==
                                                            orderTime[i]) {
                                                          moreOrder.putIfAbsent(
                                                              getCartHistoryList[
                                                                      j]
                                                                  .id!,
                                                              () =>
                                                                  getCartHistoryList[
                                                                      j]);
                                                        }
                                                        Get.toNamed(RouteHelper
                                                            .getCartPage());
                                                      }
                                                      Get.find<CartController>()
                                                          .setItems = moreOrder;

                                                      Get.find<CartController>()
                                                          .addToCartList();
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  Dimensions
                                                                      .width10,
                                                              vertical: Dimensions
                                                                      .height10 /
                                                                  2),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(Dimensions
                                                                      .radius15 /
                                                                  3),
                                                          border: Border.all(
                                                              width: 1,
                                                              color: AppColors
                                                                  .mainColor)),
                                                      child: SmallText(
                                                        text: "one more",
                                                        color:
                                                            AppColors.mainColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          )),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(
                          child: NoDataPage(
                              text: "You didn't buy anything so far")));
            },
          )
        ],
      ),
    );
  }
}
