# Host: localhost  (Version: 5.5.53)
# Date: 2017-06-20 18:14:52
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "think_admin_nav"
#

CREATE TABLE `think_admin_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单表',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '所属菜单',
  `name` varchar(15) DEFAULT '' COMMENT '菜单名称',
  `mca` varchar(255) DEFAULT '' COMMENT '模块、控制器、方法',
  `ico` varchar(20) DEFAULT '' COMMENT 'font-awesome图标',
  `order_number` int(11) DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

#
# Data for table "think_admin_nav"
#

INSERT INTO `think_admin_nav` VALUES (1,0,'系统信息','#','fa-dashboard',1),(2,1,'菜单管理','#','fa-dashboard',NULL),(4,0,'权限控制','#','fa-desktop',2),(7,4,'权限管理','#','',1),(8,4,'用户组管理','#','',2),(9,4,'管理员列表','#','',3),(16,0,'会员管理','#','fa-bar-chart-o',4),(17,16,'会员列表','#','',NULL),(36,0,'文章管理','#','fa-table',6),(37,36,'文章列表','#','',NULL),(38,0,'关于我们','#','fa-table',10);

#
# Structure for table "think_auth_group"
#

CREATE TABLE `think_auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `rules` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='规则表';

#
# Data for table "think_auth_group"
#

INSERT INTO `think_auth_group` VALUES (1,'超级管理员',1,''),(2,'产品管理员',1,'');

#
# Structure for table "think_auth_group_access"
#

CREATE TABLE `think_auth_group_access` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`group_id`),
  KEY `group_id` (`group_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "think_auth_group_access"
#


#
# Structure for table "think_auth_rule"
#

CREATE TABLE `think_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(80) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：为1正常，为0禁用',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='用户组表';

#
# Data for table "think_auth_rule"
#

INSERT INTO `think_auth_rule` VALUES (1,20,'Admin/ShowNav/nav','菜单管理',1,1,''),(2,1,'Admin/Nav/index','菜单列表',1,1,''),(3,1,'Admin/Nav/add','添加菜单',1,1,''),(4,1,'Admin/Nav/edit','修改菜单',1,1,''),(5,1,'Admin/Nav/delete','删除菜单',1,1,''),(6,0,'Admin/Index/index','后台首页',1,1,''),(7,21,'Admin/Rule/index','权限管理',1,1,''),(8,7,'Admin/Rule/add','添加权限',1,1,''),(9,7,'Admin/Rule/edit','修改权限',1,1,''),(10,7,'Admin/Rule/delete','删除权限',1,1,''),(11,21,'Admin/Rule/group','用户组管理',1,1,''),(12,11,'Admin/Rule/add_group','添加用户组',1,1,''),(13,11,'Admin/Rule/edit_group','修改用户组',1,1,''),(14,11,'Admin/Rule/delete_group','删除用户组',1,1,''),(15,11,'Admin/Rule/rule_group','分配权限',1,1,''),(16,11,'Admin/Rule/check_user','添加成员',1,1,''),(19,21,'Admin/Rule/admin_user_list','管理员列表',1,1,''),(20,0,'Admin/ShowNav/config','系统设置',1,1,''),(21,0,'Admin/ShowNav/rule','权限控制',1,1,''),(64,1,'Admin/Nav/order','菜单排序',1,1,''),(96,6,'Admin/Index/welcome','欢迎界面',1,1,''),(104,0,'Admin/ShowNav/posts','文章管理',1,1,''),(105,104,'Admin/Posts/index','文章列表',1,1,''),(106,105,'Admin/Posts/add_posts','添加文章',1,1,''),(107,105,'Admin/Posts/edit_posts','修改文章',1,1,''),(108,105,'Admin/Posts/delete_posts','删除文章',1,1,''),(109,104,'Admin/Posts/category_list','分类列表',1,1,''),(110,109,'Admin/Posts/add_category','添加分类',1,1,''),(111,109,'Admin/Posts/edit_category','修改分类',1,1,''),(112,109,'Admin/Posts/delete_category','删除分类',1,1,''),(117,109,'Admin/Posts/order_category','分类排序',1,1,''),(118,105,'Admin/Posts/order_posts','文章排序',1,1,''),(123,11,'Admin/Rule/add_user_to_group','设置为管理员',1,1,''),(124,11,'Admin/Rule/add_admin','添加管理员',1,1,''),(125,11,'Admin/Rule/edit_admin','修改管理员',1,1,'');

#
# Structure for table "think_users"
#

CREATE TABLE `think_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '账号名',
  `passwd` varchar(255) DEFAULT NULL COMMENT '账号密码',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='账号表';

#
# Data for table "think_users"
#

INSERT INTO `think_users` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e',0,0);
