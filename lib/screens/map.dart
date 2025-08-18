import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:blood_bank/router/app_router.gr.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

@RoutePage()
class Map extends StatelessWidget {
  const Map({super.key});

  // final MapController mapController = MapController();
  // Future<dynamic> showMapDialog(BuildContext context, List addresses) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 400.w, vertical: 200.h),
  //       child: Dialog(
  //         clipBehavior: Clip.antiAlias,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8.r),
  //         ),
  //         child: FlutterMap(
  //           mapController: mapController,
  //           options: const MapOptions(
  //             initialCenter: LatLng(33.1181699, 38.4245055),
  //             initialZoom: 5,
  //             maxZoom: 10,
  //             minZoom: 5,
  //           ),
  //           children: [
  //             TileLayer(
  //               urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  //               userAgentPackageName: 'dev.fleaflet.flutter_map.example',
  //               // Use the recommended flutter_map_cancellable_tile_provider package to
  //               // support the cancellation of loading tiles.
  //               tileProvider: CancellableNetworkTileProvider(),
  //             ),
  //             MarkerLayer(
  //               markers: List.generate(
  //                 addresses.length,
  //                 (index) => Marker(
  //                   width: 60.w,
  //                   height: 60.h,
  //                   point: LatLng(
  //                     double.parse(addresses[index].latitude!),
  //                     double.parse(addresses[index].longitude!),
  //                   ),
  //                   child: InkWell(
  //                     child: Icon(
  //                       Icons.location_on_rounded,
  //                       color: Colors.redAccent,
  //                       size: 40.sp,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFE1393A);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: ListView(children: [])),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.view_list_outlined),
                  iconSize: 30,
                  color: primaryColor,
                  splashColor: Colors.red[50],
                  highlightColor: Colors.red[50],
                  onPressed: () {
                    context.router.push(RequestList());
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.map),
                  iconSize: 30,
                  color: primaryColor,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.person_outline),
                  iconSize: 30,
                  color: primaryColor,
                  splashColor: Colors.red[50],
                  highlightColor: Colors.red[50],
                  onPressed: () {
                    context.router.push(Profile());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
