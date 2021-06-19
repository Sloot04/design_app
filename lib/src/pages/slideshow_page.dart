import 'package:backgrounds_custom_painter/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    final screenSize = MediaQuery.of(context).size;

    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow()),
    ];

    return Scaffold(
        floatingActionButton: (screenSize.width < 500)
            ? FloatingActionButton(
                backgroundColor:
                    (appTheme.darkTheme) ? accentColor : Colors.redAccent,
                child: Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : SizedBox(),
        body: (isLarge) ? Column(children: children) : Row(children: children));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Slideshow(
      colorPrimario: (appTheme.darkTheme) ? accentColor : Colors.redAccent,
      colorSecundario: (appTheme.darkTheme)
          ? accentColor.withOpacity(0.5)
          : Colors.redAccent.withOpacity(0.5),
      bulletPrimario: 15.0,
      slides: [
        (appTheme.darkTheme)
            ? SvgPicture.asset('assets/svgs/1d.svg')
            : SvgPicture.asset('assets/svgs/slide-1.svg'),
        (appTheme.darkTheme)
            ? SvgPicture.asset('assets/svgs/2d.svg')
            : SvgPicture.asset('assets/svgs/slide-2.svg'),
        (appTheme.darkTheme)
            ? SvgPicture.asset('assets/svgs/3d.svg')
            : SvgPicture.asset('assets/svgs/slide-3.svg'),
        (appTheme.darkTheme)
            ? SvgPicture.asset('assets/svgs/4d.svg')
            : SvgPicture.asset('assets/svgs/slide-4.svg'),
        (appTheme.darkTheme)
            ? SvgPicture.asset('assets/svgs/5d.svg')
            : SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
