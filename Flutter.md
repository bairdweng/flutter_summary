## Flutter 打包成framework实践

* 打包发布版本

  ```
  flutter build ios --release --no-codesign
  ```

* 拷贝build目录下的 Release-iphoneos

  > * FlutterPluginRegistrant.framework
  > * audioplayers.framework 等等第三方库

* 拷贝引擎以及资源文件的framework

  > * App.framework
  > * Flutter.framework

* 一起放入新的工程

  > 注意在build Phases 下的copyFile 导入对应的framework