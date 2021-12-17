import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:vbolt/components/drawer_list_tile.dart';
import 'package:vbolt/utils/size_config.dart';

class Dashboard extends StatefulWidget {

  static const String id = 'dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {

  /// Variable to hold the animation controller
  late AnimationController _controller;

  /// Variable to hold the tween value for the transform scale
  late Animation _scale;

  /// Variable to hold the tween value for the transform offset
  late Animation _offset;

  /// Variable to hold the beginning offset of the transform
  final _beginOffset = const Offset(0 , 0);

  /// Variable to hold the ending offset of the transform
  final _endOffset = const Offset(300 , 0);

  /// Variable to hold the tween value for the drawer color
  late Animation _drawerColor;

  /// Variable to hold the state of the drawer
  bool? _isDrawerActive = false;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 190),
      vsync: this,
    );

    _scale = Tween(begin: 1.0, end: 0.5).animate(_controller);

    _offset = Tween(begin: _beginOffset, end: _endOffset).animate(_controller);

    _drawerColor = ColorTween(begin: Colors.white, end: Colors.grey).animate(_controller);

    /// Make the [Animation_Controller] know about the new values being fired
    _controller.addListener(() {
      setState(() { });
    });

    /// Function to listen to the current state of the controller and update its value
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isDrawerActive = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isDrawerActive = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        barrierColor: Colors.grey,
        isDismissible: false,
        enableDrag: false,
        elevation: 1.5,
        context: context,
        builder: (contexts){
          return _bottomModalSheet(contexts);
        },
      );
    });

    SizeConfig().init(context);
    return SafeArea(
      top: false,
      bottom: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 45),
                      ///profile
                      ListTile(
                        leading: Container(
                          width: 45,
                          height: 45,
                          color: Colors.white,
                          child: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              IconlyBold.profile,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                        ),
                        title: const Text(
                          'Victor',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Edit profile',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.58),
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.6),
                        thickness: 0.2,
                      ),
                      ///payment
                      SizedBox(
                        width: SizeConfig.screenHeight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: const ReusableModalListTile(
                            icon: Icons.payment_outlined,
                            titleText: 'Payment',
                          ),
                        ),
                      ),
                      ///promotions
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0.0),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.sell_outlined,
                            color: Colors.black.withOpacity(0.5),
                            size: 27.0,
                          ),
                          title: const Text(
                            'Promotions',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: Text(
                            'Enter promo code',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.78),
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      ///work rides
                      SizedBox(
                        width: SizeConfig.screenHeight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: const ReusableModalListTile(
                            icon: Icons.business_center_outlined,
                            titleText: 'Work Rides',
                          ),
                        ),
                      ),
                      ///ride history
                      SizedBox(
                        width: SizeConfig.screenHeight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: const ReusableModalListTile(
                            icon: Icons.schedule_rounded,
                            titleText: 'Ride History',
                          ),
                        ),
                      ),
                      ///support
                      SizedBox(
                        width: SizeConfig.screenHeight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: const ReusableModalListTile(
                            icon: Icons.textsms_outlined,
                            titleText: 'Support',
                          ),
                        ),
                      ),
                      ///about
                      SizedBox(
                        width: SizeConfig.screenHeight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: const ReusableModalListTile(
                            icon: Icons.info_outlined,
                            titleText: 'About',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: _scale.value,
                  origin: _offset.value,
                  child: Stack(
                    children: [
                      AbsorbPointer(
                        absorbing: _isDrawerActive!,
                        child: Container(
                            color: _drawerColor.value,
                            height: SizeConfig.screenHeight,
                            child: const Center(
                              child: Text(
                                'MAPS',
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.black
                                ),
                              ),
                            )
                        ),
                      ),
                      Positioned(
                        left: 34,
                        top: 50,
                        child: Material(
                          elevation: 7,
                          shadowColor: Colors.black,
                          shape: const CircleBorder(),
                          child: GestureDetector(
                            onTap: () {
                              _isDrawerActive == false ? _controller.forward() : _controller.reverse();
                              print(_controller.value);
                            },
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.black,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Builder(
                //   builder: (BuildContext contexts) {
                //     showModalBottomSheet(
                //       shape: const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                //       ),
                //       barrierColor: Colors.grey,
                //       isDismissible: false,
                //       enableDrag: false,
                //       elevation: 1.5,
                //       context: contexts,
                //       builder: (contexts){
                //         return _bottomModalSheet(contexts);
                //       },
                //     );
                //     return Container();
                //   },
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _bottomModalSheet(BuildContext contexts) {
  return Container(
    height: SizeConfig.screenHeight! / 2,
    decoration: const BoxDecoration(
      borderRadius:  BorderRadius.vertical(top: Radius.circular(14.0)),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 180),
          const Center(
            child: Text(
              'Where are you?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Set your location so we can pick you up at the right spot and find vehicles available around you',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: SizeConfig.screenWidth,
            height: 60,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: const Color(0xFF15d277),
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(contexts),
              child: const Center(
                child: Text(
                  'Set automatically',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: SizeConfig.screenWidth,
            height: 60,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.black.withOpacity(0.05),
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(contexts),
              child: const Center(
                child: Text(
                  'Set later',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}