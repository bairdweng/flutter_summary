import 'package:flutter/cupertino.dart';

class SmallGameShortPath {
  // 索引->矩阵模型
  Map<int, SmallGameMatrux> dic = {};
  // 矩阵 4 * 4;
  List<List<SmallGameMatrux>> items = [];
  // 记录所有走过的路径
  List<List<SmallGameMatrux>> records = [];
  // 临时路径
  List<SmallGameMatrux> tempPath = [];
  SmallGameShortPath() {
    initMatrix();
  }
  // 初始化4*4矩阵
  initMatrix() {
    var index = 0;
    items = [];
    for (var i = 0; i < 4; i++) {
      List<SmallGameMatrux> list = [];
      for (var j = 0; j < 4; j++) {
        SmallGameMatrux model = SmallGameMatrux('视图$index', index);
        list.add(model);
        dic[index] = model;
        index++;
      }
      items.add(list);
    }
  }

  // 输入两个点，打印所有的路径
  logPoint(int startIndex, int endIndex) {
    if (!dic.containsKey(startIndex)) {
      debugPrint('起点不存在');
      return;
    }
    if (!dic.containsKey(endIndex)) {
      debugPrint('终点不存在');
      return;
    }
    records = [];

    SmallGameMatrux? a = dic[startIndex];
    SmallGameMatrux? b = dic[endIndex];
    debugPrint('起点：${a!.name} 终点：${b!.name}');
    var currentIndex = startIndex;
    // 向右边查找
    tempPath = [];
    findToRight(startIndex, endIndex, currentIndex);
    records.add(tempPath);

    // 向底部查找
    tempPath = [];
    findToBottom(startIndex, endIndex, currentIndex);
    records.add(tempPath);

    debugPrint('总路径${records.length}');
    for (var r in records) {
      for (var j in r) {
        debugPrint('结果${j.name}');
      }
    }
  }

  // 向节点的右边寻找
  findToRight(startIndex, endIndex, currentIndex) {
    // 递归结束条件
    if ((currentIndex % 4) == 0 && startIndex != currentIndex) {
      return;
    }
    SmallGameMatrux? next = dic[currentIndex];
    // debugPrint('向节点的右边搜索：${next!.name}');
    if (next == null) {
      return;
    }

    tempPath.add(next);
    if (currentIndex == endIndex) {
      return;
    }
    findToRight(startIndex, endIndex, currentIndex + 1);
  }

  // 向节点的底部寻找
  findToBottom(startIndex, endIndex, currentIndex) {
    SmallGameMatrux? next = dic[currentIndex];
    // 递归结束条件
    if (next == null && startIndex != currentIndex) {
      return;
    }
    if (currentIndex == endIndex) {
      return;
    }
    debugPrint('向节点的底部搜索：${next!.name}');
    tempPath.add(next);
    if (currentIndex == endIndex) {
      return;
    }
    findToBottom(startIndex, endIndex, currentIndex + 4);
  }
}

class SmallGameMatrux {
  String name;
  int index;
  SmallGameMatrux(this.name, this.index);
}
