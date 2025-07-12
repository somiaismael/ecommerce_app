import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child: Lottie.asset(
              ImageAssets.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusrequest == Statusrequest.offlinefailure
            ? Center(
                child: Lottie.asset(
                  ImageAssets.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : statusrequest == Statusrequest.serverfailure
                ? Center(
                    child: Lottie.asset(
                      ImageAssets.noserver,
                      width: 250,
                      height: 250,
                    ),
                  )
                : statusrequest == Statusrequest.failure
                    ? Center(
                        child: Lottie.asset(
                          ImageAssets.nodata,
                          width: 250,
                          height: 250,
                        ),
                      )
                    : widget;
  }
}


class HandlingDataRequest extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child: Lottie.asset(
              ImageAssets.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusrequest == Statusrequest.offlinefailure
            ? Center(
                child: Lottie.asset(
                  ImageAssets.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : statusrequest == Statusrequest.serverfailure
                ? Center(
                    child: Lottie.asset(
                      ImageAssets.noserver,
                      width: 250,
                      height: 250,
                    ),
                  )
                    : widget;
  }
}