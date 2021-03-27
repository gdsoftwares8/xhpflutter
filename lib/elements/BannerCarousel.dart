import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/BannerWidget.dart';

class BannerCarouselWidget extends StatefulWidget {
  List<String> banners = [
    'assets/xhp.png','assets/xhp.png','assets/xhp.png','assets/xhp.png','assets/xhp.png',
    // 'https://xhp.com.au/wp-content/uploads/2020/10/android-chrome-512x512-1-e1602063073396.png',
    // 'https://xhp.com.au/wp-content/uploads/2020/10/android-chrome-512x512-1-e1602063073396.png',
    // 'https://xhp.com.au/wp-content/uploads/2020/10/android-chrome-512x512-1-e1602063073396.png',
    // 'https://xhp.com.au/wp-content/uploads/2020/10/android-chrome-512x512-1-e1602063073396.png',
    // 'https://xhp.com.au/wp-content/uploads/2020/10/android-chrome-512x512-1-e1602063073396.png',
    // 'https://xhp.com.au/wp-content/uploads/2020/10/android-chrome-512x512-1-e1602063073396.png'
  ];

  @override
  _BannerCarouselWidgetState createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.banners.isEmpty
        ? Text("")
        : Container(
            //height: MediaQuery.of(context).size.height*.20,
            width: MediaQuery.of(context).size.height * .90,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.95,
              ),
              itemCount: widget.banners.length,
              itemBuilder: (BuildContext context, int index,int realIndex) => BannerWidget(imageurl: widget.banners[index]),
            ),
          );
  }
}
