# MoreProject
xcworkspace依赖分模块管理项目---这一刻更清晰...

主要内容及步骤：

1. 创建主工程

![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/1.png)

2. 创建xcworkspace,并将中工程添加。

![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/2.png)

![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/3.png)

![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/4.png)

3. 创建静态库，并添加至xcworkspace（请先关闭其他打开开放式）。(详细.a静态库打包插->这里<-,当然这里是不需要生成.a文件的)

![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/5.png)

    1. 添加一些文件到page中
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/6.png)
    
4. 创建bundle文件，管理你的资源文件包括png、Storyboard、xib、xxx.xcassets等
    1.  创建 bundle 文件（记得要选mac OS,ios 下没有的）
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/7.png)
    
    2.  设置并 添加资源文件到bundle 
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/8.png)
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/9.png)
    
5. 主工程的引入配置及一些错误提示的解决
    1. 编译项目的时候先把需要的bundle编译了再编译主工程的target,可以在Edit Scheme->Build里把bundle加进去，而且加到主工程target前面。
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/10.png)
    
    2. 添加静态库（不添加 import 会报错）
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/11.png)
    
    1. 编译项目的时候先把需要的bundle编译了再编译主工程的target,可以在Edit Scheme->Build里把bundle加进去，而且加到主工程target前面。
    3. 添加路径 在主项目的Build Settings 里找到Header Search Paths，添加一项$(SRCROOT)/../page，并且设置为recursive。$(SRCROOT)是当前的工程路径，..是返回上一层，然后到page文件夹。
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/12.png)
    
    4. 资源文件加载不出来？因为5.1只做了自动编译此bundle，不会打包到app中 
    
    ![Image text](https://raw.githubusercontent.com/lecochao/MoreProject/master/image/13.png)
    
        1.    还需要添加run script到build parses中
        2.    build parses-》add run script（点+号）
        3.    cp -R -f $BUILT_PRODUCTS_DIR/MyBundleName.bundle $BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/
        4.    如果有多个bundle
        5.    cp -R -f $BUILT_PRODUCTS_DIR/*.bundle $BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/
        6.    这样bundle就可以正常打包到app中了
                            在使用的时候需要指定bundle
                            [UIImage imageNamed:@"yourbundlefile.bundle/imageInBundle"];
                     *报错（设置不对会报错哦）
                        Undefined symbols for architecture arm64:
                        "_OBJC_CLASS_$_page", referenced from:
                        objc-class-ref in ViewController.o
                       报错_
                  这样bundle就可以正常打包到app中了
    1. 最后别忘了 other Linker Flags 中添加-all_load,不然文件也会找不哦！[image txet]14

# 相关参考 #
http://www.jianshu.com/p/744b562af548

http://www.jianshu.com/p/b6c59d8ed2c9

https://my.oschina.net/u/811205/blog/294278#
