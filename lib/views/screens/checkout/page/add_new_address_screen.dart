// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: use_key_in_widget_constructors
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.916177, 91.845299),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(24.916177, 91.845299),
      tilt: 59.440717697143555,
      zoom: 10.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 2,
        leadingicon: AssetPath.arrow,
        leadingIconRequired: true,
        leadiconpress: () {
          Navigator.pop(context);
        },
        text: "Add New Address",
        textRequired: true,
        cartIconRequired: false,
      ),
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: KSize.getHeight(context, 58),
                  width: KSize.getHeight(context, 243),
                  decoration: BoxDecoration(
                      color: KColor.white,
                      border: Border(
                          top: BorderSide(
                              color: KColor.grey.withOpacity(0.3), width: 1))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: TextField(
                      onChanged: (key) {},
                      decoration: InputDecoration(
                          hintText: 'Search',
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                              top: KSize.getHeight(context, 18),
                              bottom: KSize.getHeight(context, 14),
                              left: KSize.getWidth(context, 18),
                              right: KSize.getWidth(context, 15),
                            ),
                            child: Image.asset(
                              AssetPath.search,
                              color: KColor.greyDark,
                              alignment: Alignment.center,
                              height: KSize.getHeight(context, 20),
                              width: KSize.getWidth(context, 20),
                              fit: BoxFit.contain,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12)),
                    ),
                  ),
                ),
              ),
              Container(
                height: KSize.getHeight(context, 58),
                decoration: BoxDecoration(
                    color: KColor.white,
                    border: Border(
                        top: BorderSide(
                            color: KColor.grey.withOpacity(0.3), width: 1))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Image.asset(
                    AssetPath.discovery,
                    color: KColor.primary,
                    alignment: Alignment.center,
                    height: KSize.getHeight(context, 20),
                    width: KSize.getWidth(context, 20),
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ]),
          ),
        ),
      ]),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: KButton(
          getHeight: KSize.getHeight(context, 56),
          getWidth: KSize.getWidth(context, 250),
          containerColor: KColor.primary,
          kbuttonTap: () {
            null;
          },
          text: "Set Location",
          txtcolor: KColor.white,
          borderColor: KColor.primary,
        ),
      ),
    );
  }
}
