import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainning/screen/image_screen/fit_image_screen.dart';
import 'package:trainning/utils/app_images/app_images.dart';
import 'package:trainning/widget/home_button_widget.dart';

class CacheImageScreen extends StatefulWidget {
  const CacheImageScreen({super.key});

  @override
  State<CacheImageScreen> createState() => _CacheImageScreenState();
}

class _CacheImageScreenState extends State<CacheImageScreen> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                width: 300,
                height: 300,
                imageUrl:
                    "https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-800x525.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const FitImageScreen(),
              SvgPicture.asset(
                AppImages.icPlusPlus,
              ),
              SvgPicture.asset(
                AppImages.icPlusPlus,
              ),
              SvgPicture.asset(
                AppImages.icPlusPlus,
              ),
              SvgPicture.asset(
                AppImages.icPlusPlus,
              ),
              Container(
                margin: const EdgeInsets.all(AppConstant.defaultMargin),
                width: 300,
                height: 300,
                color: Colors.red,
                child: Image.asset(
                  'assets/images/subhome.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              HomeButtonWidget(
                  title: "Select Image",
                  onTap: () {
                    selectImage();
                  }),
              if (file != null) Image.file(file!),
              const Divider(
                color: Colors.red,
              ),
              const Text('Clip'),
              const ClipperContainer(),
            ],
          ),
        ),
      ),
    );
  }

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File.fromUri(Uri.parse(image.path));
      });
    }
  }

// flutter_image_compress
// https://github.com/warcayac/compressors_comparison

//CFol: https://github.com/Baseflow/flutter_cached_network_image/issues/802
}
