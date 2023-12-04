import 'package:flutter/material.dart';
import 'package:r5/core/util/app_color.dart';
import 'package:image_picker_loading_jm/image_picker_loading_jm.dart';

class CustomCardModel {
  final String name;
  final bool isFavorite;
  final String description;

  CustomCardModel({
    required this.name,
    required this.isFavorite,
    required this.description,
  });
}

class CustomCard extends StatelessWidget {
  final Function() onTap;
  final CustomCardModel customCardModel;

  const CustomCard({
    Key? key,
    required this.onTap,
    required this.customCardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: AppColors.black,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: AppColors.second.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImagePickerLoadingJM(
                imagePickerLoadingJModel: ImagePickerLoadingJModel(
                  image:
                      "https://cdn-icons-png.flaticon.com/512/2098/2098402.png",
                  buildBody: (context, provider) => Container(
                    height: 100,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: provider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  imageError: "assets/image/login.jpg",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customCardModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      customCardModel.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                _generateIconStar(),
                color: _generateColorStar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _generateIconStar() {
    if (customCardModel.isFavorite) return Icons.star;
    return Icons.star_border;
  }

  Color _generateColorStar() {
    if (customCardModel.isFavorite) return AppColors.yellow;
    return AppColors.disable;
  }
}
