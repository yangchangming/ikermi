Readme
==============================================================================
1.该工程是基于ruby1.8.6和rails2.0.2，所以启动工程前，请切换环境到以上版本，使用命令rvm use 1.8.6,rvm
  gemset use rails202 即可
2.然后在ikermi主目录下，命令 ruby script/server mongrel 启动服务器mongrel即可
3.使用自带的webrick启动服务，存在css不能加载的问题，所以需要安装mongrel 这个gem，来启动服务
4.本地使用的application.rb,而服务端使用的是application_controller.rb，这个和rails版本的问题
5.mongrel 后台运行命令 mongrel_rails start -e production -p 3000 -d
6.具体部署环境要注意mysql.sock文件的位置，默认是在/tmp/mysql.sock，可以通过database.yml中添加sock: xxx 进行配置

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
9.修改首页文章索引顺序，按照更新时间逆序排序
10.修改文章展现页面，去掉导航和图片，首页去掉展现文章大纲内容，改为只显示标题，同时只留下最新评论和类别模块
11.图片上传服务器端功能,通过jquery.qeditor.js，通过内嵌iframe实现无刷新上传，所有的图片上传至/public/upload/images/下




TODO
===============================================================================
1.about个人介绍页面--使用D3实现
2.增加评论文章功能，同时对评论进行计数
3.按照tag标记搜索文章
4.分页
5.对主要的controller代码进行重构，如posts_controller
6.数据库的备份脚本
7.重构登陆验证功能

线上环境说明
===============================================================================
1.工程目录：/root/yangchangming/webapp/blog
2.启动命令，后台运行：mongrel_rails start -e production -p 3000 -d
3.启动之前，先删除log/mongrel目录下的mongrel相关文件
