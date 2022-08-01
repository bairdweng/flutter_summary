# flutter组件总结

#### 动态组件StatefulWidget

1. stful 会自动生成相应最简单的想要代码

2. stanim 会生成带有生命周期的代码

3. 还有其他快捷键可以自己去尝试

   ```dart
   	class MyHomePage extends StatefulWidget {
     @override
     _MyHomePageState createState() => _MyHomePageState();
   }
   
   class _MyHomePageState extends State<MyHomePage> {
     @override
     Widget build(BuildContext context) {
       return Container();
     }
   }
   ```

#### StatelessWidget

1. 静态组件定义后不会再改变，一般很少用到。
2. Widget(组件)是Element(元素)的封装，flutter最后渲染的是Element。不涉及到原理时了解一下即可。

#### 组件按功能分类

##### 基础类组件

1. 基础组件分为文本(Text)

2. 图片(Image)

3. 按钮(xxButton)

4. 输入框(TextField)

5. 单选框(Switch)与复选框(CheckBox)

6. 表单(Form)等等。基本格式为：

   ```dart
   //文本
   Text("Hello world! I'm Jack. "*4,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
       );
   ```

##### 布局类组件

1. 水平线性布局（Row）

2. 垂直线性布局（Column)

3. 弹性布局(Flex)、流式布局（Wrap|Flow）

4. 层叠布局（Stack|Positioned）

   ```dart
   Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
     children: <Widget>[
       Container(
         color: Colors.red,
         child: Column(
           mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度  
           children: <Widget>[
             Text("hello world "),
             Text("I am Jack "),
           ],
         ),
       )
     ]
     
   ```

5. 弹性布局

   > - Flex属性与线性布局类似
   > - Expanded。在Flex容器中可以设置比例
   > - 例如下面的代码会按1：2比例占据屏幕

   ```dart
   Flex(
     direction: Axis.horizontal,
     children: <Widget>[
       Expanded(
         flex: 1,
         child: Container(
           height: 30.0,
           color: Colors.red,
         ),
       ),
       Expanded(
         flex: 2,
         child: Container(
           height: 30.0,
           color: Colors.green,
         ),
       ),
     ],
   )
   ```

6. 流式布局

  > - Wrap直接使用，超过屏幕自动换行
  > - Flow需要自己计算，但是性能较好。同时由于是自己计算的，所以换行规则可以自己定。
  
7. 层叠布局
  
  > - Stack类似于Android里面的FrameLayout、Web中的绝对定位
  > - Position 结合Stack使用可以实现绝对定位的效果
  

#####容器类部件

1. padding

    ```dart
      Padding(
            //上下左右各添加16像素补白
            padding: EdgeInsets.all(16.0),
            child: Column()
    ```

2. 限制类容器(ConstrainedBox、SizedBox等等)

    ```dart
    ConstrainedBox(
        constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
        child: UnconstrainedBox( //“去除”父级限制
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
            child: redBox,
          ),
        )
    )
    ```

3. 装饰器DecoratedBox

    > 类似于Android的shape，可以设置圆角、渐变、阴影等等。格式如下

    ```dart
    DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
          borderRadius: BorderRadius.circular(3.0), //3像素圆角
          boxShadow: [ //阴影
            BoxShadow(
                color:Colors.black54,
                offset: Offset(2.0,2.0),
                blurRadius: 4.0
            )
          ]
        ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
        child: Text("Login", style: TextStyle(color: Colors.white),),
      )
    )
    ```

4.  变换Transform

    > 旋转(rotate)、平移(translate)、缩(scale)
    
    ```dart
    DecoratedBox(
      decoration:BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        angle:90 ,
        child: Text("Hello world"),
      ),
    )
      DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //将Transform.rotate换成RotatedBox  
      child: RotatedBox(
        quarterTurns: 1, //旋转90度(1/4圈)
        child: Text("Hello world"),
      )
      
      Opacity(
            opacity: 0.1,
            child: new Container(
            width: 250.0,
            height: 100.0,
            decoration: new BoxDecoration(
            backgroundColor: const Color(0xff000000),
        ),
    )
    ```
    
5. Container容器

  > 这个容器比较强大的是它有padding跟margin以及变换等等不过底层也是用上面的控件实现的..
  
  ```dart
  Container({
    this.alignment,
    this.padding, //容器内补白，属于decoration的装饰范围
    Color color, // 背景色
    Decoration decoration, // 背景装饰
    Decoration foregroundDecoration, //前景装饰
    double width,//容器的宽度
    double height, //容器的高度
    BoxConstraints constraints, //容器大小的限制条件
    this.margin,//容器外补白，不属于decoration的装饰范围
    this.transform, //变换
    this.child,
    padding,
    margin,
  })
  ```
  
6. Scaffold 脚手架

    > ##### drawer（侧边栏）、BottomNacigationBar（底部导航栏）
    
    ```dart
    Scaffold(
          appBar: AppBar( //导航栏
            title: Text("App Name"), 
            actions: <Widget>[ //导航栏右侧菜单
              IconButton(icon: Icon(Icons.share), onPressed: () {}),
            ],
          ),
          drawer: new MyDrawer(), //抽屉
          bottomNavigationBar: BottomNavigationBar( // 底部导航
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
              BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.blue,
            onTap: _onItemTapped,
          ),
          floatingActionButton: FloatingActionButton( //悬浮按钮
              child: Icon(Icons.add),
              onPressed:_onAdd
          ),
    );
    
    AppBar({
      Key key,
      this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
      this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
      this.title,// 页面标题
      this.actions, // 导航栏右侧菜单
      this.bottom, // 导航栏底部菜单，通常为Tab按钮组
      this.elevation = 4.0, // 导航栏阴影
      this.centerTitle, //标题是否居中 
      this.backgroundColor,
      ...   //其它属性见源码注释
    })
      
      bottom: TabBar(
        controller: _tabController,
        tabs: tabs.map((e) => Tab(text: e)).toList())
        
        
     Drawer(
            child: Container(
              padding: EdgeInsets.zero,
              children: <Widget>[ 
            ),
    ```
    

##### 滚动类组件

1. SingleChildScrollView

   ```dart
      SingleChildScrollView({
       this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
       this.reverse=false,//滚动方向是否反向
       this.padding,//边距bool primary,//这是否是与父控件关联的主滚动视图 应该是是否与父控件一起滑动 用来解决滑动冲突
       this.physics,//滑动松手后的滑动方式
       this.controller,
       this.child,//子view
      })
   ```

2. physics

   > - const ClampingScrollPhysics()：Android下微光效果。
   > - const BouncingScrollPhysics()：iOS下弹性效果。

3. ListView

    ```dart
   ListView({
     ...  
     //可滚动widget公共参数
     Axis scrollDirection = Axis.vertical,
     bool reverse = false,
     ScrollController controller,
     bool primary,
     ScrollPhysics physics,
     EdgeInsetsGeometry padding,
   
     //ListView各个构造函数的共同参数  
     double itemExtent,
     bool shrinkWrap = false,
     bool addAutomaticKeepAlives = true,
     bool addRepaintBoundaries = true,
     double cacheExtent,
   
     //子widget列表
     List<Widget> children = const <Widget>[],
   }
            
   ListView(
     shrinkWrap: true, 
     padding: const EdgeInsets.all(20.0),
     children: <Widget>[
       const Text('列表数据'),
     ],
   )
   ```

4. GridView

    ```dart
    class _GridViewLayoutState extends State<GridViewLayout> {
      @override
      Widget build(BuildContext context) {
        return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横轴三个子widget
                childAspectRatio: 1.0 //宽高比为1
            ),
            children:<Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ]
        );
      }
    }
    ```

5. Sliver

    > Sliver有细片、小片之意，在Flutter中，Sliver通常指具有特定滚动效果的可滚动块。可滚动widget，如ListView、GridView等都有对应的Sliver实现如SliverList、SliverGrid等贴上一段md效果的代码，感觉效果还不错
    >
    > ```dart
    > import 'package:flutter/material.dart';
    > 
    > class CustomScrollViewTestRoute extends StatelessWidget {
    >   @override
    >   Widget build(BuildContext context) {
    >     //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    >     //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    >     return Material(
    >       child: CustomScrollView(
    >         slivers: <Widget>[
    >           //AppBar，包含一个导航栏
    >           SliverAppBar(
    >             pinned: true,
    >             expandedHeight: 250.0,
    >             flexibleSpace: FlexibleSpaceBar(
    >               title: const Text('Demo'),
    >               background: Image.asset(
    >                 "./images/avatar.png", fit: BoxFit.cover,),
    >             ),
    >           ),
    > 
    >           SliverPadding(
    >             padding: const EdgeInsets.all(8.0),
    >             sliver: new SliverGrid( //Grid
    >               gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
    >                 crossAxisCount: 2, //Grid按两列显示
    >                 mainAxisSpacing: 10.0,
    >                 crossAxisSpacing: 10.0,
    >                 childAspectRatio: 4.0,
    >               ),
    >               delegate: new SliverChildBuilderDelegate(
    >                     (BuildContext context, int index) {
    >                   //创建子widget      
    >                   return new Container(
    >                     alignment: Alignment.center,
    >                     color: Colors.cyan[100 * (index % 9)],
    >                     child: new Text('grid item $index'),
    >                   );
    >                 },
    >                 childCount: 20,
    >               ),
    >             ),
    >           ),
    >           //List
    >           new SliverFixedExtentList(
    >             itemExtent: 50.0,
    >             delegate: new SliverChildBuilderDelegate(
    >                     (BuildContext context, int index) {
    >                   //创建列表项      
    >                   return new Container(
    >                     alignment: Alignment.center,
    >                     color: Colors.lightBlue[100 * (index % 9)],
    >                     child: new Text('list item $index'),
    >                   );
    >                 },
    >                 childCount: 50 //50个列表项
    >             ),
    >           ),
    >         ],
    >       ),
    >     );
    >   }
    > }
    > ```
    >
    > 

6. 滚动监听

    ```dart
    ScrollController _controller = new ScrollController();
      bool showToTopBtn = false; //是否显示“返回到顶部”按钮
    
      @override
      void initState() {
        //监听滚动事件，打印滚动位置
        _controller.addListener(() {
          print(_controller.offset); //打印滚动位置
          if (_controller.offset < 1000 && showToTopBtn) {
            setState(() {
              showToTopBtn = false;
            });
          } else if (_controller.offset >= 1000 && showToTopBtn == false) {
            setState(() {
              showToTopBtn = true;
            });
          }
        });
      }
    ```

##### 功能型

1. #### 导航返回拦截WillPopScope

   > 有时候点击两次过快时可能是误点需要做处理，就用到这个。

   ```
   WillPopScope(
           onWillPop: () async {
             if (_lastPressedAt == null ||
                 DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
               //两次点击间隔超过1秒则重新计时
               _lastPressedAt = DateTime.now();
               return false;
             }
             return true;
           },
           child: Container(
             alignment: Alignment.center,
             child: Text("1秒内连续按两次返回键退出"),
           )
       );
   ```

2. 数据共享InheritedWidget
   
   > 感觉就是全局变量
   
3. 主题Theme

  ```dart
ThemeData({
    Brightness brightness, //深色还是浅色
    MaterialColor primarySwatch, //主题颜色样本，见下面介绍
    Color primaryColor, //主色，决定导航栏颜色
    Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
    Color cardColor, //卡片颜色
    Color dividerColor, //分割线颜色
    ButtonThemeData buttonTheme, //按钮主题
    Color cursorColor, //输入框光标颜色
    Color dialogBackgroundColor,//对话框背景颜色
    String fontFamily, //文字字体
    TextTheme textTheme,// 字体主题，包括标题、body等文字样式
    IconThemeData iconTheme, // Icon的默认样式
    TargetPlatform platform, //指定平台，应用特定平台控件风格
    ...
  })
  ```
  
  