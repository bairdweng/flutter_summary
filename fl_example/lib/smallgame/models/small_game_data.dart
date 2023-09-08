//@dart=2.17
class SmallGameData {
  final List<SmallGameModel> items = [];

  List<SmallGameModel> getListItems() {
    if (items.isNotEmpty) {
      items.removeRange(0, items.length);
    }
    for (var i = 0; i < 9; i++) {
      SmallGameModel model = SmallGameModel("name$i", i == 1);
      items.add(model);
    }
    return items;
  }

  List<SmallGameModel> getListItems2x() {
    List<SmallGameModel> l = [];
    for (var i = 0; i < 16; i++) {
      SmallGameModel model = SmallGameModel("视图$i", false);
      l.add(model);
    }
    return l;
  }

  resetListItems(List<SmallGameModel> list) {
    resetItemIndex(list, 0);
  }

  resetItemIndex(List<SmallGameModel> list, index) {
    if (index > list.length - 1) return;
    // ignore: avoid_print
    print(index);
    for (var i = 0; i < list.length; i++) {
      SmallGameModel model = list[i];
      if (i == index) {
        model.selected = true;
      } else {
        model.selected = false;
      }
    }
  }
}

class SmallGameModel {
  String? name;
  bool? selected;
  SmallGameModel(this.name, this.selected);
}
