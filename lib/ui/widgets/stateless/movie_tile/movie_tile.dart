import 'package:flutter/material.dart';
import 'package:movieapp/ui/widgets/stateless/movie_tile/movie_tile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/movie/movie.dart';
import '../../../shared/ui_helper.dart';

/// A list tile for an article.
class MovieTile extends StatelessWidget {
  final Movie movie;
  final ValueChanged<Movie> onChanged;

  const MovieTile({required this.movie, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieTileViewModel>.nonReactive(
      viewModelBuilder: () => MovieTileViewModel(),
      onModelReady: (model) => model.init(movie),
      builder: (context, model, child) => InkWell(
        onTap: () async {
          await model.moveToMovieViewRoute(context);
        },
        child: Card(
          elevation: 2,
          margin: EdgeInsets.all(8),
          child: Container(
            height: MediaQuery.of(context).size.height / 7,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.r,
                    child: Image.network(
                      //TODO: The backup image should be stored locally.
                      movie.thumb ??
                          'https://freepikpsd.com/file/2019/10/placeholder-image-png-5-Transparent-Images.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceLarge(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  movie.title!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                              Text(
                                  '${DateTime.parse(movie.release_date!).year}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var i = 0; i < movie.genres!.length; i++)
                                Text(
                                  '${movie.genres![i].name!} - ',
                                  style: TextStyle(),
                                ),
                            ],
                          ),
                          UIHelper.horizontalSpaceLarge(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text(
                                movie.description!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
