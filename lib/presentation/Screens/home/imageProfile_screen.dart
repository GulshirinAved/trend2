import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_marketplace2/blocs/productProfile/imageScrolling_bloc/image_scrolling_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';

class ImageProfileScreen extends StatelessWidget {
  final List imageList;
  const ImageProfileScreen({required this.imageList, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageScrollingBloc(),
      child: Scaffold(
        body: Column(
          children: [
            //main image
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.35,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<ImageScrollingBloc, ImageScrollingState>(
                    builder: (context, state) {
                      return Image.asset(
                        imageList[state.selectedIndex],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 35,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            //imageSelections
            SizedBox(
              height: 186,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return BlocBuilder<ImageScrollingBloc, ImageScrollingState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<ImageScrollingBloc>()
                              .add(ImageScrollingEvent(index));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: state.selectedIndex == index
                                  ? AppColors.blueColor
                                  : Colors.transparent,
                            ),
                          ),
                          padding: const EdgeInsets.all(
                            5,
                          ),
                          child: Image.asset(imageList[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
