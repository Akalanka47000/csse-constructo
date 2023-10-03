import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flodash/flodash.dart' as flodash;

import 'cache.dart';

Future<void> loadWidgetOrder(String widgetOrderCacheKey, List<String> existingWidgetOrder, setWidgetOrder) async {
  String? result = await Cache.retrieve(widgetOrderCacheKey);
  if (result != null) {
    final List<String> widgets = result.split(",");
    if (flodash.xor([...widgets], existingWidgetOrder).isEmpty) {
      setWidgetOrder(widgets);
    }
  }
}

void setWidgetOrder(Emitter emit, state, event, String widgetOrderCacheKey) {
  String widget = state.widgetOrder[event.oldIndex];
  List<String> tmp = state.widgetOrder;
  tmp.removeAt(event.oldIndex);
  tmp.insert(event.newIndex > event.oldIndex ? event.newIndex - 1 : event.newIndex, widget);
  Cache.save(widgetOrderCacheKey, tmp.join(","));
  emit(state.copyWith(widgetOrder: tmp));
}
