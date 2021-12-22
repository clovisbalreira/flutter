import 'package:aap_filmes/application/modules/favorites/favorites_controller.dart';
import 'package:aap_filmes/application/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (m) => MovieCard(
                      movie: m,
                      favoriteCallback: () => controller.removeFavorite(m),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
