import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/view/base_view_state.dart';

abstract class BaseViewModel<S extends BaseViewState> extends AutoDisposeNotifier<S> {}
