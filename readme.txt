Readme
==============================================================================
1.该工程是基于ruby1.8.6和rails2.0.2，所以启动工程前，请切换环境到以上版本，使用命令rvm use 1.8.
  6 , rvm gemset use rails202 即可
2.然后在ikermi主目录下，命令 ruby script/server mongrel 启动服务器mongrel即可
3.后台登录： changming.yang.ah@gmail.com / 000000 --> localhost
4.在后台tinymce中插入高亮代码时，选择syntaxhighlighter插件时，不能使用light和collapse功能，否则代
  码不显示
5.editor and highlighter version : tinymce3.5.8  ,  syntaxhighlighter3.0.83
6.skydriver img useage: http://storage.live.com/items/xxxxxx  ------->
  https://skydrive.live.com/redir?resid=864A899699572FE!1164




TODO
==============================================================================
1.升级后台文章发布编辑器，支持代码高亮显示，支持图片发布  			----------  ok
2.增加修改文章功能
3.设计tag标记功能，新增文章时增加tag功能，按照tag标记搜索文章
4.增加评论文章功能，同时对评论进行计数
5.修改文章详细页面的layout，完全占满页面，去掉导航				----------  ok






Design
===============================================================================
1.表设计： Comment , Post<-->Comment 	|	Tag , Post<-->Tag	|	Post --- Statistics
2.加入缓存，读取帖子和评论使用缓存
3.异步写入帖子读取和评论统计数值
