import 'package:flutter/material.dart';
import 'package:movieapp/ui/views/movies_list/paged_movies_list_view.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/genre/genre.dart';
import '../../../generated/l10n.dart';
import '../../widgets/stateless/app_bar.dart';
import '../../widgets/stateless/drawer/customer_drawer_menu.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'movies_list_view_model.dart';

// ignore: must_be_immutable
class MoviesListView extends StatefulWidget {
  MoviesListView();

  @override
  _MoviesListViewState createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(MoviesListView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose(); //
  }

  List<String> years = [
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022'
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoviesListViewModel>.reactive(
      viewModelBuilder: () => MoviesListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(child: CustomerDrawerMenu()),
          appBar: MyAppBar('${AppLocalizations.of(context).main_view_movies}'),
          body: model.isBusy
              ? LoadingCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Sort by rating'),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        items: <String>[
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: '2',
                        onChanged: (value) {
                          if (value == '1') {
                            model.r = 1;
                          }
                          if (value == '2') {
                            model.r = 2;
                          }
                          if (value == '3') {
                            model.r = 3;
                          }
                          if (value == '4') {
                            model.r = 4;
                          }
                          if (value == '5') {
                            model.r = 5;
                          }
                          model.notifyListeners();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.search),
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      hintText: 'Search'),
                                  onChanged: (value) {
                                    model.q = value;
                                    model.notifyListeners();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: SizedBox(
                                      height: 58,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        items: <String>[
                                          '1995',
                                          '1996',
                                          '1997',
                                          '1998',
                                          '1999',
                                          '2000',
                                          '2001',
                                          '2002',
                                          '2003',
                                          '2004',
                                          '2005',
                                          '2006',
                                          '2007',
                                          '2008',
                                          '2009',
                                          '2010',
                                          '2011',
                                          '2012',
                                          '2013',
                                          '2014',
                                          '2015',
                                          '2016',
                                          '2017',
                                          '2018',
                                          '2019',
                                          '2020',
                                          '2021',
                                          '2022'
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        value: '2010',
                                        onChanged: (value) {
                                          model.y = value;
                                          model.notifyListeners();
                                        },
                                      )
                                      // DropdownButtonFormField<Genre>(
                                      //   decoration: InputDecoration(
                                      //     hintStyle: TextStyle(fontSize: 14),
                                      //     border: OutlineInputBorder(
                                      //         borderRadius:
                                      //             BorderRadius.circular(8)),
                                      //   ),
                                      //   value: model.selected_genre,
                                      //   iconEnabledColor: Colors.grey,
                                      //   onChanged: (Genre? value) {
                                      //     model.selected_genre = value;
                                      //     model.notifyListeners();
                                      //   },
                                      //   items: model.genres_list
                                      //       .map<DropdownMenuItem<Genre>>(
                                      //           (Genre value) {
                                      //     return DropdownMenuItem<Genre>(
                                      //       value: value,
                                      //       child: Text(value.name.toString()),
                                      //     );
                                      //   }).toList(),
                                      // ),
                                      )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: PagedMoviesListView(
                              model.r!,
                              model.y!,
                              {
                                if (model.q!.isNotEmpty) 'q': model.q!,
                                'filters':
                                    'genres:[${model.selected_genre!.name}]',
                              },
                              onMoviesClicked: (move) {}),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
