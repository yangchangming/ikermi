Readme
==============================================================================
1.该工程是基于ruby1.8.6和rails2.0.2，所以启动工程前，请切换环境到以上版本，使用命令rvm use 1.8.6,rvm
  gemset use rails202 即可
2.然后在ikermi主目录下，命令 ruby script/server mongrel 启动服务器mongrel即可
3.本地后台登录： changming.yang.ah@gmail.com / 000000  
6.url -->  http://storage.live.com/items/864A899699572FE!1164
  (skydriver img url: https://skydrive.live.com/redir?resid=864A899699572FE!1164 )




Feature
==============================================================================
1.升级后台文章发布编辑器，支持代码高亮显示,---- replace by jquery.qeditor 			
2.表设计: tags,posts,posts_tags;tags <--> posts 多对多关系
3.设计tag标记功能，新增文章时增加tag功能 ，目前只能增加一个tag       					
4.修改文章详细页面的layout，完全占满页面，去掉导航				 	
5.每次增加文章的tag时，如果tag已经存在就不在新增tag，而是取出原来的tagid，进行关联即可，如果不存在tag，
  就新建一个tag，同时再和post进行关联
6.最近帖子只显示10个
7.增加修改文章功能,tag暂不支持更新
8.删除文章(posts)功能,只删除关联表(posts_tags)记录，不删除tags表记录








TODO
===============================================================================
1.加入缓存，读取帖子和评论使用缓存
2.异步写入帖子读取和评论统计数值
4.增加评论文章功能，同时对评论进行计数
5.按照tag标记搜索文章
7.分页
8.图片上传服务器端功能,with qeditor
