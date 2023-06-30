import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NextPagePage extends Page<NextPageState, Map<String, dynamic>> {
  NextPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NextPageState>(
                adapter: null,
                slots: <String, Dependent<NextPageState>>{
                }),
            middleware: <Middleware<NextPageState>>[
            ],);

}
