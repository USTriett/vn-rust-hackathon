import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:vn_rust_hackathon/Data/data_wallet.dart';

import '../DTO/dto_market.dart';
import '../DTO/dto_wallet.dart';

class WalletView extends StatefulWidget {
  const WalletView({
    super.key,
    required this.controller,
  });
  final MotionTabBarController controller;
  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late bool _isVisible;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    super.initState();
    _isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    WalletModel walletModel = Provider.of<WalletModel>(context);
    walletModel.Update();
    return Stack(
      children: [
        SafeArea(
          child: Consumer<WalletModel>(builder: (context, walletModel, child) {
            Wallet wallet = walletModel.wallet;

            return Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Stack(
                        children: [
                          _backdropFilter(),
                          Positioned(
                              top: 30,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Total Balance(USD)",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          _isVisible = !_isVisible;
                                          setState(() {});
                                        },
                                        child: Icon(
                                          _isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    _isVisible
                                        ? '\$${wallet.price.toString()}'
                                        : "\$*******",
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                        fontSize: 32,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _isVisible ? "4.82%" : "****%",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _isVisible ? "(+\$30)" : "\$**",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      )),
                  // _getTestTokenButton(walletViewModel),
                  const SizedBox(height: 20),
                  // _assetsLabel(walletViewModel),
                  const SizedBox(
                    height: 10,
                  ),

                  // _GridView(walletViewModel: walletViewModel),
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  BackdropFilter _backdropFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
      ),
    );
  }

  // Padding _assetsLabel(WalletViewModel walletViewModel) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child: Row(
  //       children: [
  //         const Text(
  //           "My Assets",
  //           style: TextStyle(color: Colors.white, fontSize: 26),
  //         ),
  //         const SizedBox(width: 15),
  //         Text(
  //           '( ${walletViewModel.appWallet.length.toString()} )',
  //           style: const TextStyle(color: Colors.white, fontSize: 20),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Padding _getTestTokenButton(WalletViewModel walletViewModel) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child: InkWell(
  //       onTap: () {
  //         walletViewModel.changeTotalBalance(20000);
  //       },
  //       child: Container(
  //         height: 60,
  //         decoration: BoxDecoration(
  //             color: Colors.white.withOpacity(0.2),
  //             borderRadius: BorderRadius.circular(15)),
  //         child: const Center(
  //           child: Text(
  //             "Get Test Tokens",
  //             style: TextStyle(color: Colors.white, fontSize: 18),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
