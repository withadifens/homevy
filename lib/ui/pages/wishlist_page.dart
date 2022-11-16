import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/cart_controller.dart';
import 'package:homevy/controllers/wishlist_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:intl/intl.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());
    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: const Color(0xffe7e7e7),
      body: RefreshIndicator(
        onRefresh: () => wishlistController.getWishlist(),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              color: greyColor)
                        ]),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Text(
                      'Your Wishlist Furniture',
                      style: subtitleStyle.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              Obx(
                () => wishlistController.isLoading.value
                    ? const Expanded(
                        child: Center(
                        child: CircularProgressIndicator(),
                      ))
                    : wishlistController.favoriteList!.data.isEmpty
                        ? const Expanded(
                            child: Center(
                            child: Text('No favorite item'),
                          ))
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GridView.builder(
                                itemCount: wishlistController
                                    .favoriteList!.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        mainAxisExtent: 250),
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: whiteColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 5),
                                                  spreadRadius: 1,
                                                  blurRadius: 3,
                                                  color: greyColor)
                                            ]),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Image.network(
                                                    wishlistController
                                                        .favoriteList!
                                                        .data[index]
                                                        .product
                                                        .image),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          wishlistController
                                                              .favoriteList!
                                                              .data[index]
                                                              .product
                                                              .name,
                                                          style: subtitleStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                              NumberFormat.currency(
                                                                      locale:
                                                                          'id',
                                                                      symbol:
                                                                          'Rp',
                                                                      decimalDigits:
                                                                          2)
                                                                  .format(wishlistController
                                                                      .favoriteList!
                                                                      .data[
                                                                          index]
                                                                      .product
                                                                      .harga),
                                                              style: subtitleStyle.copyWith(
                                                                  color:
                                                                      primaryColor,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: bgColor,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0, 5),
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    color: greyColor)
                                              ]),
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    width: Get.width,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                        color: whiteColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                topRight: Radius
                                                                    .circular(
                                                                        15))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 10, 20, 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Order Information',
                                                            style: subtitleStyle
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 3),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                offset: const Offset(0, 5),
                                                                                spreadRadius: 1,
                                                                                blurRadius: 3,
                                                                                color: greyColor)
                                                                          ],
                                                                          color:
                                                                              whiteColor),
                                                                  child: Image.network(wishlistController
                                                                      .favoriteList!
                                                                      .data[
                                                                          index]
                                                                      .product
                                                                      .image),
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        wishlistController
                                                                            .favoriteList!
                                                                            .data[
                                                                                index]
                                                                            .product
                                                                            .name,
                                                                        style: subtitleStyle.copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w700)),
                                                                    Text(
                                                                        NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 2).format(wishlistController
                                                                            .favoriteList!
                                                                            .data[
                                                                                index]
                                                                            .product
                                                                            .harga),
                                                                        style: subtitleStyle.copyWith(
                                                                            color:
                                                                                primaryColor,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w700)),
                                                                  ],
                                                                ),
                                                                Obx(() =>
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          35,
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              secondaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            decoration:
                                                                                BoxDecoration(shape: BoxShape.circle, color: whiteColor),
                                                                            child:
                                                                                IconButton(
                                                                              iconSize: 20,
                                                                              padding: EdgeInsets.zero,
                                                                              onPressed: () {
                                                                                cartController.decreaseQuantity();
                                                                              },
                                                                              icon: const Icon(Icons.remove),
                                                                              color: blackColor,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            '${cartController.quantity.value}',
                                                                            style:
                                                                                subtitleStyle.copyWith(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: whiteColor,
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            decoration:
                                                                                BoxDecoration(shape: BoxShape.circle, color: whiteColor),
                                                                            child:
                                                                                IconButton(
                                                                              iconSize: 20,
                                                                              padding: EdgeInsets.zero,
                                                                              onPressed: () {
                                                                                cartController.increaseQuantity();
                                                                              },
                                                                              icon: const Icon(Icons.add),
                                                                              color: blackColor,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          GestureDetector(
                                                            onTap: () => cartController.addToCart(
                                                                wishlistController
                                                                    .favoriteList!
                                                                    .data[index]
                                                                    .productId),
                                                            child: Container(
                                                              height: 40,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                              width: Get.width,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      secondaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Add to cart',
                                                                    style: subtitleStyle
                                                                        .copyWith(
                                                                            color:
                                                                                whiteColor),
                                                                  ),
                                                                  Container(
                                                                    height: 30,
                                                                    width: 30,
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            whiteColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child: const Icon(
                                                                        Icons
                                                                            .chevron_right),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                                Icons.add_shopping_cart),
                                            color: secondaryColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
              )
            ],
          ),
        )),
      ),
    );
  }
}