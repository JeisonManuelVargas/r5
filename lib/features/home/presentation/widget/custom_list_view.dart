import 'package:flutter/cupertino.dart';
import 'package:r5/core/model/coin_model.dart';
import 'package:r5/core/widget/custom_card.dart';
import 'package:r5/core/widget/custom_title.dart';

typedef IsFavorite = bool Function(CoinModel);

class CustomListView extends StatelessWidget {
  final GlobalKey? listKey;
  final IsFavorite isFavorite;
  final List<CoinModel> listCoin;
  final ScrollController? controller;
  final Function(CoinModel) onTapCard;

  const CustomListView({
    Key? key,
    this.listKey,
    this.controller,
    required this.listCoin,
    required this.onTapCard,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listCoin.isNotEmpty
        ? ListView.builder(
            key: listKey,
            controller: controller,
            itemCount: listCoin.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomCard(
                onTapButton: (){},
                onTap: () => onTapCard(listCoin[index]),
                customCardModel: CustomCardModel(
                  name: listCoin[index].name,
                  image: listCoin[index].icon,
                  rank: listCoin[index].rank.toString(),
                  isFavorite: isFavorite(listCoin[index]),
                  overview: '',
                ),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 150),
            child: const Center(
              child: TitleCustom(
                firstTitle: "Empty list",
                secondTitle: "At this time we do not have any data",
              ),
            ),
          );
  }
}
