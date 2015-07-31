  1. 安装OneRing以及Python binding
  1. easy\_install web.py
  1. easy\_install mako
  1. 如果是Python 2.5，需要 easy\_install simplejson
  1. cd demo
  1. 如果是windows，需要复制 OneRing1.dll 和依赖的dll到demo目录。可以用 [Dependency Walker](http://www.dependencywalker.com/) 来察看dll依赖。
> > 注意：需要copy C:\Qt\2010.05\qt\bin 下的dll，而非 C:\Qt\2010.05\bin 下的，详见 [issue 38](https://code.google.com/p/onering-desktop/issues/detail?id=38)
  1. python demo.py