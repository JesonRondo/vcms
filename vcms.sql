-- MySQL dump 10.13  Distrib 5.1.68, for pc-linux-gnu (i686)
--
-- Host: localhost    Database: zombie
-- ------------------------------------------------------
-- Server version	5.1.68-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dir_article`
--

DROP TABLE IF EXISTS `dir_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_article` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `children` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_article`
--

LOCK TABLES `dir_article` WRITE;
/*!40000 ALTER TABLE `dir_article` DISABLE KEYS */;
INSERT INTO `dir_article` VALUES (0,'root','tree_root',0,'2,3,4',0),(2,'扣德','code',0,'',0),(3,'足迹','travel',0,'',0),(4,'杂谈','misc',0,'',0);
/*!40000 ALTER TABLE `dir_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_info`
--

DROP TABLE IF EXISTS `dir_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_info` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `children` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_info`
--

LOCK TABLES `dir_info` WRITE;
/*!40000 ALTER TABLE `dir_info` DISABLE KEYS */;
INSERT INTO `dir_info` VALUES (0,'root','root',0,'1',0),(1,'Links','links',0,'',0);
/*!40000 ALTER TABLE `dir_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pancnlz@gmail.com','f4a1c22a8e49802635404f01d34368b3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_article`
--

DROP TABLE IF EXISTS `v_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_article` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `title` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `summary` text COLLATE utf8_unicode_ci,
  `createtime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatetime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra1` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra2` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra3` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_article`
--

LOCK TABLES `v_article` WRITE;
/*!40000 ALTER TABLE `v_article` DISABLE KEYS */;
INSERT INTO `v_article` VALUES (1,4,0,'Hello Markdown','<p>Article by Markdown.</p>\n\n<p>Runing in github…</p>','','2013-07-01 14:43:53','2013-07-01 14:43:53','Vic','2012-11-27-blog-by-mk','','','',''),(2,4,0,'A域名咯','<p>总算有域名了，由于国内的审核比较恶心，最终还是选择了<a href=\"http://www.godaddy.com/\" target=\"_blank\">狗粑粑</a>，以防不小心发表***的言语然后被干掉。</p>\n\n<p>域名用的名字加beta，苦逼的程序猿表露无疑。其实不想这样，想象中应该是有一些比较文艺的色彩参与进来，但是没想到什么更合适的，beta至少含有着对自己还有所期待的意思。</p>\n\n<p>平台基本算搭好了，接下来该给我裸体的博客加个皮了…</p>','','2013-07-01 14:45:12','2013-07-01 14:45:12','Vic','2012-11-29-a-domain','','','',''),(3,3,0,'渡假阳朔','<p>随公司渡假旅行游阳朔，这也是2012年唯一一次增加我在地图上足迹的旅行。对山水并不感冒的我对此行也并未过多的期待，渡假放松便成了主要目的。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011542456987.jpg\" alt=\"酒店街景\"/></p>\n\n<p>晚上11点到达酒店，9小时的车程使大家都倍感疲倦。阳朔的在夜色中并无过多诱人之处，唯一能够彰显独特的是属于桂林一带那奇特的山丘。夜晚的街道也很安静，酒店在西街附近，随意逛了一圈便结束了一天疲惫的旅程。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011543055173.jpg\" alt=\"银子岩倒影\"/></p>\n\n<p>第二天上午的目的地是银子岩，其实和很多类似的岩洞一样，钟乳石加灯光效果。这是我见过的第三个岩洞，本应有的惊奇反而并没那么突出，只是走马观花大致略过。唯有一处的景色确实令人惊叹，山石映在浅浅的水中仿佛万丈深渊，确实很是奇特，可惜在镜头下景色并不能真实还原，有点遗憾。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011543179555.jpg\" alt=\"漓江\"/></p>\n\n<p>下午的行程是游漓江，这是最具桂林山水特点的景色。也许是商业气氛浓重后，原本的景色有了变化，水面并没有像课文中清澈见底、平静如镜，反而是像大多数水域一样普普通通。也许我本就不爱山水，给不出“甲天下”的评价，不过这一处的景色倒是有着桂林独有的韵味。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011543146685.jpg\" alt=\"世外桃源\"/></p>\n\n<p>“晋太原中，武陵人捕鱼为业”，“武陵”这一地名，最早出现在西汉初年。西汉武陵郡治，历来有二说。一曰治索县，二曰治义陵。（<a href=\"http://baike.baidu.com/view/437165.htm\" target=\"_blank\">百度百科</a>）。第三天来到了传说中的世外桃源，桂林阳朔并不所属于武陵郡，所以我一开始定义了这儿为山寨的地儿，进门入口处的《桃花源记》第一句断句也有问题（不知道是不是有其他断句方式，至少与常见的不符），使得我更肯定这一个处山寨的程度。出人意料的是，这里还原了陶渊明当时所幻想出的生活，所以说依据《桃花源记》来建造比“山寨”一词应该更贴切。虽然依旧有着商业气氛，但是这里呈现的景色确实有着文中的意境。这里不是桃花源而是世外桃源，或许这里的建设被重视，许多地方早已超出原创地桃花源。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011543019842.jpg\" alt=\"鉴山寺\"/></p>\n\n<p>我本是天朝无信仰的小民，来到这里参经拜佛却是出于意愿，并非我突然信奉我佛，而是我想拥有在天朝所禁的信仰，可以是释迦摩尼，也可以是耶稣基督，这些并不代表迷信，而是象征自由。第三日下午，鉴山寺之行。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011543101937.jpg\" alt=\"明园咖啡\"/></p>\n\n<p>明园咖啡，她身处喧闹的西街中，却又坐落在一个很安静的角落里。在这里，你会平复在歌剧舞曲宁静中，陶醉在醇香浓郁的咖啡里，她会让你忘掉紧凑的生活节奏，放松心情，去感受你不曾有过的生活。这里是个有故事的地方，明园心情记事簿记载了许多过客的不同生活，有欢喜、甜蜜，也有忧愁、悲伤，我把迷茫的我写在第45本里，希望能有机会再去翻阅，而那时的我没有了现在的烦恼。</p>\n\n<p>阳朔也许并不完美，但是还是有着它自己的特色，也许我不爱山水，但我爱上这里的咖啡厅，爱上这里的故事，也便爱上了阳朔。</p>','','2013-07-01 15:37:55','2013-07-01 15:37:55','Vic','2012-12-04-back-from-ys','','','',''),(4,2,0,'Jekyll博客搭建','<p>参考了很多同事的意见，也实验安装了wordpress，最终还是选择了jekyll来搭建bolg。</p>\n\n<p>如果需要搭建一个轻量级bolg，jekyll是非常好的选择，没有wordpress的厚重，不需要后台发布系统，把markdown或者静态页面git上服务器即可发布文章。jekyll最终发布的是静态页面，加载速度十分理想，没有过多的后台代码处理，对于以文章为主的blog来说很合适。Github Page本身是支持jekyll的，所以可以直接用github来做免费空间。</p>\n\n<p>目录结构对于jekyll搭建的blog来说比较重要，blog的文章和层级结构基本是根据存放目录来定的。</p>\n\n<p>我的blog目前采用是这样的结构:</p>\n\n<pre class=\"prettyprint linenums\">\n/jesonrondo.github.com\n    |-- _layouts\n    |    |-- about.html\n    |    |-- article.html\n    |    `-- index.html\n    |-- _site\n    |    `-- ...\n    |-- themes\n    |    |-- vdouban\n    |    |    |-- images\n    |    |    `-- style.css\n    |-- travel\n    |    |-- _posts\n    |    |    `-- 2012-12-04-back-from-ys.md\n    |    |-- index.html\n    |-- misc\n    |    |-- _posts\n    |    |    |-- 2012-11-27-blog-by-mk.md\n    |    |    `-- 2012-11-29-a-domain.md\n    |    |-- index.html\n    |-- about\n    |    `-- index.html\n    |-- CNAME\n    |-- _config.yml\n    `-- index.html\n\n_config.yml: 用于存放一些全部变量，能通过site对象调用\n_layouts:    用于存放模板的目录\n_site:       编译后的静态文件，可以不用管\n_posts:      文章目录，文章可以为html或者markdown，编译后jekyll会读取所有_posts下的文件作为文章\nthemes:      静态文件夹，用于存放主题样式\ntravel:      文章分类目录，里面包含_posts文件夹和index.html分类首页\nmisc:        同上\nabout:       同上\nCNAME:       用于指向域名\n</pre>\n\n<p>文章和页面都可以指定所套用的模板文件，示例如下:</p>\n\n<pre class=\"prettyprint linenums\">\n---\nlayout: index\ntitle: Vic\' Blog\n---\n&lt;h1&gt;Hello&lt;/h1&gt;\n</pre>\n\n<p>这个页面采用index模板，title变量会存在与page对象中，可通过page来调用。jekyll中含有一些默认对象，page、site都是包含各种信息的对象。jekyll采用的Liquid模板语言，更多变量详见<a href=\"https://github.com/mojombo/jekyll/wiki/Template-Data\" target=\"_blank\">我是文档</a>。</p>\n\n<p>参考资料：</p>\n\n<p><a href=\"http://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html\" target=\"_blank\">搭建一个免费的，无限流量的Blog—-github Pages和Jekyll入门</a></p>\n\n<p><a href=\"http://taberh.me/2011/12/26/use-Jekyll-build-Blog-on-Github.html\" target=\"_blank\">使用Jekyll在Github上搭建博客</a></p>','','2013-07-01 16:39:07','2013-07-01 16:39:07','Vic','2012-12-08-jekyll-blog','','','',''),(5,2,0,'Jekyll中分页的应用','<p>Jekyll支持分页，但仅限于在首页index.html和子目录如/misc/index.html中使用，关键对象是Paginator。</p>\n\n<p>在使用Paginator对象前先要在_config.yml中配置分页的参数:</p>\n\n<pre class=\"prettyprint linenums\">\npageinate: 3	          // 每页包含的文章数\n</pre>\n\n<p>Paginator对象属性:</p>\n\n<pre class=\"prettyprint linenums\">\npaginator.per_page        // 每页包含的文章数（读取）\npaginator.posts           // 本页的文章对象\npaginator.total_posts     // 文章总数\npaginator.total_pages     // 总页数\npaginator.page            // 当前页数\npaginator.preious_page    // 上一页页数\npaginator.next_page       // 下一页页数\n</pre>\n\n<p>在使用时链接可通过对象的当前值拼接出来，例如首页为http://domain，则第二页为http://domain/page2。链接特例，第一页并不是http://domain/page1而是根目录即首页，所以在输出模板时需要判断是否为第一页，第一页的链接不用拼接，直接指为根即可。</p>\n\n<p>Paginator除了在首页使用之外还可以在子目录首页使用，但是在我博客的分类目录实验后发现paginator.posts取得的文章还是所有文章，并不是由类别区分的文章，这里并不满足设计需求，还有待研究。</p>\n\n<p>参考资料：</p>\n<a href=\"https://github.com/mojombo/jekyll/wiki/Template-Data\" target=\"_blank\">Jekyll Template Data</a>','','2013-07-01 17:33:16','2013-07-01 17:33:16','Vic','2012-12-12-jekyll-paginator','','','',''),(6,2,0,'Flash视频的插入','<p>在页面中使用Flash视频时容易遇到兼容性问题。在HTML中插入Flash的代码量巨大，而大多冗余，在IE中会出现虚线框，还有被IE拦截等等问题，使得Flash的使用显得十分繁琐。</p>\n\n<p>目前比较简单的方法是使用脚本插入Flash，各种判断都交给脚本去处理，只关心关键参数的设定。</p>\n\n<p>常用脚本<a href=\"https://code.google.com/p/swfobject/\" target=\"_blank\">swfobject</a>。使用方法：</p>\n\n<p>1、在DOM中创建一个元素，待后面脚本替换成Flash</p>\n\n<pre class=\"prettyprint linenums\">\n&lt;div class=\"player\" id=\"mycontent\"&gt;演示视频&lt;/div&gt;\n</pre>\n\n<p>2、设定参数，调用swfobject插入Flash</p>\n\n<pre class=\"prettyprint linenums\">\nvar flashvars = {\n     vcastr_file: [flv path],    // flv视频路径\n     width: \'600\',\n     height: \'470\'\n};\nvar params = {};\nvar attributes = {};\nvar so = new swfobject.embedSWF([swf player path], \n    \"mycontent\", \n    \"600\", \"470\", \"9.0.0\", \n    true, flashvars, params, attributes);\n</pre>\n\n<p>更多参数详见<a href=\"http://code.google.com/p/swfobject/wiki/documentation\" target=\"_blank\">Documentation</a></p>','','2013-07-01 18:03:35','2013-07-01 18:03:35','Vic','2012-12-15-flv-in-html','','','',''),(7,2,0,'jQuery抽奖显示插件','<p>不想投入过多Flash的学习，遇到摇奖转盘这类需求时，用JS做个通用的摇奖动画显示插件就显得十分有用。避开了Flash，插件的原理也是采用逐帧动画，所以不只适用于摇奖，类似的图标逐帧动画都可以使用这个插件。</p>\n\n<p>插件主页<a href=\"https://github.com/JesonRondo/lottery\" target=\"_blank\">jquery.lottery.js</a>，提供两个对外方法，一个用来初始化显示图片，所有的图片资源都将在调用初始化时绑定在内部变量中，并进行预加载，另一个用来确定停留状态，0为默认状态，不包含在抽奖结果中（可理解为转盘未开始时，全部熄灭的状态），1为除默认状态外的第一帧，即第一个奖品对应的图片，以此类推。</p>\n\n<p>调用方法:</p>\n\n<p>初始化函数</p>\n\n<pre class=\"prettyprint linenums\">\n$(\'#lotbox\').lotteryInit({\n    process_img: [\n        \'images/1.jpg\',\n        \'images/2.jpg\',\n        \'images/3.jpg\',\n        \'images/4.jpg\',\n        \'images/5.jpg\',\n        \'images/6.jpg\'\n    ]\n});\n</pre>\n\n<p>选择绑定的DOM元素，插件会在id为lotbox的元素中插入img标签，函数的参数是一个option，完整可配参数如下</p>\n\n<pre class=\"prettyprint linenums\">\noption = {\n    frap: 12,           // animate frap            \n    continuance: 5000,  // continue time\n    process_img: []     // process images, first one is default status\n}\n/**\n * frap:        匀速时的动画显示帧数（可选）\n * continuance: 匀速切换持续时间（可选）\n * process_img: 状态图片数组，第一个为默认状态\n */\n</pre>\n\n<p>启动动画函数</p>\n\n<pre class=\"prettyprint linenums\">\n$.lotteryStart(2);\n</pre>\n\n<p>参数2代表最后停留第二个状态，即抽中第二个奖品。</p>\n\n<p>此插件实现了简单的逐帧动画，没用到强大的CSS3动画，也避免了无语义的Flash元素DOM，通过图片的切换，还是具有一定的实用性和良好的兼容性。</p>','','2013-07-01 18:08:28','2013-07-01 18:08:28','Vic','2012-12-18-js-lottery','','','',''),(8,2,0,'VPN搭建','<p>新弄了个vps，果断先搭好vpn，环境是centOS6.3，参考教程搭建成功。<a href=\"http://www.lvtao.net/html/2236.html\" target=\"_blank\">原帖地址</a></p>\n\n<p>首先需要验证是否开启了ppp，一般只有VPS才需要验证，自己的服务器肯定是开启的。</p>\n\n<pre class=\"prettyprint linenums\">\n# cat /dev/ppp\ncat: /dev/ppp: No such device or address\n</pre>\n\n<p>如果出现以上提示则说明ppp是开启的，可以正常架设pptp服务，若出现Permission denied等其他提示，你需要先去VPS面板里看看有没有enable ppp的功能开关，如果没有则需要发个ticket给你的提供商，让他们帮你开通，否则就不必要看下去了，100%无法成功配置PPTP。</p>\n\n<p>修改内核，使其支持包转发</p>\n\n<pre class=\"prettyprint linenums\">\n# vi /etc/sysctl.conf\n</pre>\n\n<p>将net.ipv4.ip_forward的值从0改为1，否则服务器将不会进行包转发操作</p>\n\n<pre class=\"prettyprint linenums\">\n# sysctl -p\n</pre>\n\n<p>使内核配置生效</p>\n\n<p>安装PPP和iptables</p>\n\n<pre class=\"prettyprint linenums\">\n# yum -y install ppp iptables\n</pre>\n\n<p>如果你需要用户连接到你的服务器后可以访问外网，则iptables是必要的，它主要用来做地址转换，将内网IP转换成公网IP（NAT），从而实现上网。否则用户只能访问你服务器上的内网。</p>\n\n<p>安装pptp</p>\n\n<pre class=\"prettyprint linenums\">\n# rpm -ivh http://poptop.sourceforge.net/yum/stable/packages/pptpd-1.3.4-2.el6.i686.rpm\n</pre>\n\n<p>64位系统用以下命令安装，上面针对32位用户</p>\n\n<pre class=\"prettyprint linenums\">\n# rpm -ivh http://poptop.sourceforge.net/yum/stable/packages/pptpd-1.3.4-2.el6.x86_64.rpm\n</pre>\n\n<p>由于yum源中没有pptpd这个包，所以这种安装方式是必要的，你也可以自己去寻找软件包，注意32位系统和64位系统需要选择各自的软件包</p>\n\n<p>配置pptp</p>\n\n<pre class=\"prettyprint linenums\">\n# vi /etc/pptpd.conf\n</pre>\n\n<p>打开配置文件后，在最下面找到</p>\n\n<pre class=\"prettyprint linenums\">\n#localip 192.168.0.1\n#remoteip 192.168.0.234-238,192.168.0.245\n</pre>\n\n<p>将注释去掉，并改成你自己想要设置的IP段，localip就是指定你服务器的内网IP地址，其实即便网卡没有配置成这个地址也无所谓，remoteip就是用户连接到你的服务器后，服务器为用户分配的ip地址范围，注意格式。</p>\n\n<pre class=\"prettyprint linenums\">\nlocalip 172.16.32.1\nremoteip 172.16.32.2-200\n</pre>\n\n<p>配置options.pptpd文件</p>\n\n<pre class=\"prettyprint linenums\">\n# vi /etc/ppp/options.pptpd\n</pre>\n\n<p>打开后，找到下面字段，去掉注释，并修改成你想要为用户分配的dns服务器，一般指定google的即可</p>\n\n<pre class=\"prettyprint linenums\">\nms-dns 8.8.8.8\nms-dns 8.8.4.4\n</pre>\n\n<p>配置iptables转发规则</p>\n\n<pre class=\"prettyprint linenums\">\n# iptables -t nat -A POSTROUTING -s 172.16.32.1/24 -j SNAT --to-source 202.141.50.76\n</pre>\n\n<p>以上命令的作用就是让172.16.32.1这个段的ip地址，可以通过202.141.50.76这个公网地址上网。</p>\n\n<p>你需要将172.16.32.1/24替换成你在pptp.conf中设置的ip段和子网掩码，将202.141.50.76替换成你服务器自己的公网ip地址，否则拨上来的用户是没有办法上网的。</p>\n\n<pre class=\"prettyprint linenums\">\n# service iptables save\n</pre>\n\n<p>将新增的转发规则写入文件保存，不执行此命令，服务器重启后上面的转发规则就没了</p>\n\n<p>清空iptables转发规则</p>\n\n<pre class=\"prettyprint linenums\">\n# iptables -F -t nat\n# iptables -X -t nat\n# iptables -Z -t nat\n</pre>\n\n<p>如果不小心配置了错误的转发规则可以使用以上三条命令清空</p>\n\n<pre class=\"prettyprint linenums\">\n# service iptables save\n</pre>\n\n<p>清空后别忘了再次使用保存命令将清空后的配置写入文件，否则重启后上次配置的转发规则又回恢复。</p>\n\n<p>添加VPN账号密码，以上配置完成后，我们就可以添加VPN账号密码进行测试了</p>\n\n<pre class=\"prettyprint linenums\">\n# vi /etc/ppp/chap-secrets\n</pre>\n\n<p>需要添加的4个字段分别为用户名，服务，密码，ip地址（如果为<em>，则表示随机分配，范围即为你在pptp.conf中的设置），保存以后我们就可以启动相关服务进行测试了。</em></p>\n\n<p>启动相关服务</p>\n\n<pre class=\"prettyprint linenums\">\n# service pptpd start\n# service iptables start\n</pre>\n\n<p>此时就可以在另一台机器上建立VPN来测试了</p>\n\n<p>将服务配置为开机自动启动</p>\n\n<pre class=\"prettyprint linenums\">\n# chkconfig pptpd on\n# chkconfig iptables on\n</pre>\n\n<p>PS:</p>\n<pre class=\"prettyprint linenums\">\n-- iptables restorecon: command not found\nyum install policycoreutils\n</pre>','','2013-07-01 18:14:18','2013-07-01 18:14:18','Vic','2012-12-20-vpn-built','','','',''),(9,3,0,'再会，广州','<p>新的一年来临了，再次回到广州和朋友们小聚一回，我们不全是同学，也不全是同事，但是我们一起度过了一段没落的时期。一年前为了工作一起努力迎接各种校招，每当我们中有人拿下心仪的offer，就会一同祝福他，然后也暗暗担忧着自己。</p>\n\n<p>那段日子算是一直在煎熬中度过，还记得在那一个月左右的时间里，我独自在广州参加各种校招，奔跑于各个陌生的学校。每次在笔试时，看着周围人们的表情，有时会暗自庆幸我懂了一些他不懂的东西，有时也很自卑他们说的一些我几乎都没听说过。那时只剩下了麻木的应付，没再能多思考什么，只要有公司就会去投，每当回到宿舍，大家会一起分享着自己的面经，然后一起计划接下来一天又要去哪个公司。陆陆续续，有很多人都找到了公司，可还不是全部，大家在相互鼓励下支持着。有次我在学院BRT站台等车时碰到一个同学正好坐车回来，不一样的是我是拿着简历去看公司，而他是拿着三方协议从公司回来，那时我心里想，不管是哪里，请来解救你苦命的员工吧，如果我有了工作，我一定会好好工作…</p>\n\n<p>现在过去一年了，大家大部分还在广东，很高兴最终我们都有一份工作，并且新年还能相聚在当年一起生活的地方。不管现在对工作是否有任何抱怨，从前我们一起努力过，才有了现在的生活，现在我们还要继续努力，还不能停歇…谨记！</p>','','2013-07-01 18:16:45','2013-07-01 18:16:45','Vic','2013-01-03-gz-newyear','','','',''),(10,2,0,'几款方便插件','<p>1、jquert.ktip.js <a href=\"https://github.com/JesonRondo/Ktip\" target=\"_blank\">view</a></p>\n\n<p>tip显示插件，支持一些简单配置 <img src=\"http://vicbeta.com/upload/201307011819176914.jpg\" alt=\"ktip\"></p>\n\n<p>2、jquery.toast.js <a href=\"https://github.com/JesonRondo/toast\" target=\"_blank\">view</a></p>\n\n<p>toast信息提示 <img src=\"http://vicbeta.com/upload/201307011819197140.jpg\" alt=\"toast\"></p>\n\n<p>3、jquery.calendar.js <a href=\"https://github.com/JesonRondo/calendar\" target=\"_blank\">view</a></p>\n\n<p>日历插件 <img src=\"http://vicbeta.com/upload/201307011819154035.jpg\" alt=\"calendar\"></p>','','2013-07-01 18:20:09','2013-07-01 18:20:09','Vic','2013-01-08-collect-plugin','','','',''),(11,2,0,'前端优化之路','<p>据《web前端性能优化进阶路》一文，前端优化分有三个阶段：初探期、立规期、创新期。</p>\n\n<pre><code>初探期，大多刚入门，缺乏大型前端项目经验。</code></pre>\n\n<p>优化方法可依照雅虎性能优化原则、PageSpeed评分等一条条对应优化，能使页面的前端代码有较好的系统规范，有效避免加载阻塞、请求过多等问题。值得注意的一些地方，CSS sprite所得的图片不宜过大，不论什么格式，最终最好不要超过35k，关键显示的位置不宜合并在大型sprite图片中，可单独合并一张图片，相反小的icon等不重要元素则可以合并在整个一张大图上。</p>\n\n<pre><code>立规期，维护代码稳定，增强扩展性，使代码结构有条不紊。</code></pre>\n\n<p>对于不利于代码维护的业务代码能规范则规范，不能规范要学会拒绝，不能拒绝的最好写在分离的脚本中，逻辑代码和业务代码分离。这个阶段值得注意的地方，Javascript脚本代码不适合存储数据类型的东西，如页面中的首页新闻标题、top列表等，原因，Javascript存在缓存，更新时间戳使它不适合发布数据，频繁改动容易出差错，在外网表现为脚本报错，脚本未更新等问题，解决方法，把数据抽离在json文件中、或者用变量的形式写在html页面中，json本是一种跨平台数据格式，用来存储数据理所当然，而因为页面每次都会重新请求，不会有脚本的缓存问题，所以页面中写的数据，接入发布系统也会比较好管理内容。</p>\n\n<pre><code>创新期，利用前端框架管理模块，控制页面加载和表现。</code></pre>\n\n<p>在AMD前端框架中，有效管理了脚本的依赖加载和模块化，依赖加载的好处是不会在页面载入前期加载一堆脚本造成下载速度的拥堵，模块化的加载也可以把图片多而重要的模块优先加载，避免同一个域名请求数上限造成的下载拥堵。AMD框架的缺点，本身有一定的复杂性，不适合小型项目，不够轻量级，对于模块结构划分不清晰的话，扩展性的驾驭有一定问题。</p>\n\n<p>为更好的进行创新期的工作，接下来还需要一个前端框架，区分开UI和交互，优先UI模块，然后事件交互脚本的载入，最后事件触发载入（如滚动到第二屏再加载第二屏内容），最大限度的减少首次进入的请求数和请求文件大小。框架需要扩展性强，并且足够轻量。</p>\n\n<p>页面加载的响应速度主要体现在首次加载中，控制好首次加载的请求，优先加载第一屏UI显示，能有效减少用户的等待体验。</p>\n\n<p>参考资料：<a href=\"http://www.aliued.cn/2013/01/20/web%E5%89%8D%E7%AB%AF%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E8%BF%9B%E9%98%B6%E8%B7%AF.html\" target=\"_blank\">《web前端性能优化进阶路》</a></p>','','2013-07-01 18:22:11','2013-07-01 18:22:11','Vic','2013-02-12-web-front-level','','','',''),(12,2,0,'CSSCheckStyle install','<p>CSSCheckStyle是有人人网FED提供的一个CSS的解析、检查、修复和压缩插件</p>\n\n<p>安装方法：</p>\n\n<p>1. Python环境搭建（win64）</p>\n\n<p>下载<a href=\"http://python.org/download/\" target=\"_blank\">Python</a>，安装并配置PATH变量</p>\n\n<p>2. 修复win64注册表信息</p>\n\n<p>用记事本存成python27WOWFix.reg。然后双击导入即可。内容如下：</p>\n\n<pre class=\"prettyprint linenums\">\nWindows Registry Editor Version 5.00\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python]\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore]\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore\\2.7]\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore\\2.7\\Help]\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore\\2.7\\Help\\Main Python Documentation]\n@=\"C:\\\\Python27\\\\Doc\\\\python273.chm\"\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore\\2.7\\InstallPath]\n@=\"C:\\\\Python27\\\\\"\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore\\2.7\\InstallPath\\InstallGroup]\n@=\"Python 2.7\"\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore\\2.7\\Modules]\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Python\\PythonCore\\2.7\\PythonPath]\n@=\"C:\\\\Python27\\\\Lib;C:\\\\Python27\\\\DLLs;C:\\\\Python27\\\\Lib\\\\lib-tk\"\n</pre>\n\n<p>3. 安装Python包管理</p>\n\n<p>下载对应版本的<a href=\"https://pypi.python.org/pypi/setuptools#downloads\" target=\"_blank\">setuptools</a>并安装，确保Python27/Scripts/easy_install可使用</p>\n\n<p>4. 安装CSSCheckStyle</p>\n\n<pre class=\"prettyprint linenums\">\neasy_install https://github.com/wangjeaf/CSSCheckStyle/archive/master.tar.gz\n</pre>\n\n<p>5. 安装Sublime2插件</p>\n\n<p>将 <code>fixstyle_for_sublime_text_2.zip</code> 内的内容解压缩到插件目录下即可</p>\n\n<p>参考资料：<a href=\"http://fed.renren.com/archives/1427\" target=\"_blank\">CSSCheckStyle - CSS的解析、检查、修复和压缩</a></p>','','2013-07-01 18:26:10','2013-07-01 18:26:10','Vic','2013-02-19-css-plugin-install','','','',''),(13,3,0,'TO Do List in Zhuhai','<p>HK维多利亚港 <img src=\"http://vicbeta.com/upload/201307011827253547.jpg\" alt=\"HK维多利亚港\"></p>\n\n<p>腾讯大厦 <img src=\"http://vicbeta.com/upload/201307011827221668.jpg\" alt=\"腾讯大厦\"></p>\n\n<span style=\"text-decoration:line-through;\">赛车场</span>','','2013-07-01 18:28:08','2013-07-01 18:28:08','Vic','2013-03-16-zh-latest','','','',''),(14,2,0,'IE6 JSONP回调执行失败','<p>问题现象：</p>\n\n<p>IE6下浏览器的点击事件执行顺序默认阻止了JSONP回调函数的执行</p>\n\n<p>解决方案：</p>\n\n<p>在点击事件的最后阻止浏览器默认事件的执行</p>\n\n<pre class=\"prettyprint linenums\">\nevent.preventDefault();\n</pre>','','2013-07-01 18:29:41','2013-07-01 18:29:41','Vic','2013-03-22-ie6-jsonp-hack','','','',''),(15,4,0,'胃病表乱喝咖啡呀','<p>可以喝咖啡，但要注意喝的方法与时间：</p>\n\n<p>1. 不要空腹喝，要在吃过饭以后再喝。</p>\n\n<p>2. 不要喝清咖啡，不要用奶精之类的伴侣，而是选择用新鲜的纯牛奶和方糖，牛奶会减少咖啡对肠胃的刺激，会使咖啡变得温和。</p>\n\n<p>3. 不要喝太浓的咖啡，不要喝隔夜或是放置时间太久的咖啡。</p>\n\n<p>4. 切记切记，不要喝速溶咖啡。</p>\n\n<p>5. 夏天不是万不得已，不要喝冰咖啡。</p>','','2013-07-01 18:30:53','2013-07-01 18:30:53','Vic','2013-04-22-coffee-stomach','','','',''),(16,2,0,'手机浏览器input撑出body','<p>手机web开发资料少，原创解决方案Mark。</p>\n\n<p>手机页面遇到一个横竖屏切换时出现的问题。为满足不同分辨率下正常显示，页面的input元素宽度需要撑满整个父级元素，而父级元素则是占满整行的，由于input元素有padding间距，所以使用box-sizing来保持宽度不超出父元素，代码如下：</p>\n\n<pre class=\"prettyprint linenums\">\n&lt;input type=\"text\" class=\"text_input w_100\" name=\"phone\" id=\"phone\" /&gt;\n</pre>\n\n<pre class=\"prettyprint linenums\">\n.text_input {\n    box-sizing: border-box;\n    padding: .8em;\n    border: 1px solid #E2E2E3;\n    background: #FFF;\n    font: normal 16px/1 \'SimHei\';\n    border-radius: 3px;\n    outline: none;\n}\n.w_100 {\n    width: 100%;\n}\n</pre>\n\n<p>竖屏打开时页面显示正常 <img src=\"http://vicbeta.com/upload/201307011834026322.png\" alt=\"竖屏打开\"></p>\n\n<p>切换成横屏时，input元素也保持正常布局 <img src=\"http://vicbeta.com/upload/201307011834053803.png\" alt=\"横屏切换\"></p>\n\n<p>最后切回竖屏时，向左滑动页面，发现页面多出一截空白的可滚动区域 <img src=\"http://vicbeta.com/upload/201307011834064703.png\" alt=\"切回竖屏\"></p>\n\n<p>由于横屏时，宽度100%的input元素会占据更多的横屏像素，此时body元素宽度也随横屏变大，然而切换回竖屏时，虽然元素布局都恢复正常，但浏览器解析的页面宽度却保持在横屏时的宽度，即横屏时input元素100%所达到的宽度，此时右边就多出了一截未还原的空白区域。</p>\n\n<p>为了解决上述问题，需要取消100%的宽度限制，又要达到铺满整行的效果。</p>\n\n<p>需要把input设置成block元素占满整行的效果，但是直接设置block，在input上并没起到相应的作用。考虑到css3的display: box属性，为input元素创建一个外层父元素，把父元素分割成box布局，然后input元素设置box-flex：1，代码如下：</p>\n\n<pre class=\"prettyprint linenums\">\n&lt;div class=\"text_input_outer\"&gt;\n    &lt;input type=\"text\" class=\"text_input\" name=\"phone\" id=\"phone\" /&gt;\n&lt;/div&gt;\n</pre>\n\n<pre class=\"prettyprint linenums\">\n.text_input_outer {\n    display: -webkit-box;\n    display: -moz-box;\n    display: -o-box;\n    display: box;\n}\n.text_input {\n    display: block;\n    padding: .8em;\n    border: 1px solid #E2E2E3;\n    background: #FFF;\n    font: normal 16px/1 \'SimHei\';\n    border-radius: 3px;\n    -webkit-box-flex: 1;\n    -moz-box-flex: 1;\n    -o-box-flex: 1;\n    box-flex: 1;\n    outline: none;\n}\n</pre>\n\n<p>此时发现在没设置width：100%的情况下，也达到了input元素铺满整行的目的，并且横竖屏时完美显示，没有出现空白区域。</p>','','2013-07-01 18:35:02','2013-07-01 18:35:02','Vic','2013-04-24-phone-over-width','','','',''),(17,2,0,'Ubuntu unity图形重装','<p>不小心被强制重启有木有，图形又挂了有木有，果断重装unity，重装。。。</p>\n\n<pre class=\"prettyprint linenums\">\nsudo apt-get autoremove ubuntu-desktop\n</pre>\n\n<p>Ba La Ba La Ba La</p>\n\n<pre class=\"prettyprint linenums\">\nsudo apt-get install ubuntu-desktop\n</pre>\n\n<p>重启，完事儿</p>','','2013-07-01 18:36:24','2013-07-01 18:36:24','Vic','2013-05-17-ubuntu-shut-down-down','','','',''),(18,2,0,'P3P解决IE cookie安全问题','<p>IE下iframe由于安全问题，会禁止iframe里面页面的cookie操作。解决此类问题，需加上P3P的程序头部，nginx为例：</p>\n\n<pre class=\"prettyprint linenums\">\nadd_header P3P \'policyref=\"/w3c/p3p.xml\", CP=\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\", CP=\"CAO PSA OUR\"\'\n</pre>','','2013-07-01 18:37:48','2013-07-01 18:37:48','Vic','2013-05-24-p3p-head','','','',''),(19,3,0,'慕田峪长城','<p>因为雾霾懒了一周，这周总算出发慕田峪了，为了兑现…我不懒！！！</p>\n\n<p>心情不好，可以见见大山大水，或者…长城？也行吧。什么时候从City控变大自然控了，一定是毕业后的工作生活改变了我。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011838584747.JPG\" alt=\"烽火台\"></p>\n\n<p>慕田峪，没有八达岭多人，山也比较秀丽。这里周围大多都会是外国人，说不定很偶尔看到的黑头发黄皮肤，会给你说一句안녕하세요，随后拗口的中文‘能给我们在这拍个照片吗’。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011839013897.JPG\" alt=\"城墙\"></p>\n\n<p>这里的城墙没有八达岭新，也不如箭扣长城的原汁原味，但是对于一个初到长城的人来说，这里不会太危险，城墙也很真实，风景还特优美。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011839034128.JPG\" alt=\"窗台\"></p>\n\n<p>烽火台，虽然成为了休息和贩卖小货品的地方，在烈日下，进入烽火台带来的是清凉的感觉，随处找个口，可以眺望远处的箭扣，可以享受清风，可以好久好久…</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011839056507.JPG\" alt=\"留言\"></p>\n\n<p>给人的感觉，这段长城真是为外国人开放的，但是这样也使得这段长城远离中国式“旅游胜地”的壮观景象，更亲近人一些。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011839087720.JPG\" alt=\"长城\"></p>\n\n<p>特色…可能要数忠于XXX吧，慕田峪的不同之处。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011839116246.JPG\" alt=\"长城\"></p>\n\n<p>正当花开的季节，这里山清可惜没水秀。</p>\n\n<p><img src=\"http://vicbeta.com/upload/201307011839131433.JPG\" alt=\"长城\"></p>\n\n<p>第二面国旗处的大妈，到了要下山的时段，冰棍还没卖完，却免费借给上来照相的小盆友小国旗，还帮助这对跨国夫妇拍照留恋，用当地生意人的英语：one…two…three</p>\n\n<p>没能登顶，时间不早了，so，下山回京，走你。</p>','','2013-07-01 18:41:07','2013-07-01 18:41:07','Vic','2013-05-25-great-wall','','','',''),(20,2,0,'goagent 证书导入','<pre class=\"prettyprint linenums\">\nsudo apt-get install libnss3-tools\ncertutil -d sql:$HOME/.pki/nssdb -A -t \"C,,\" -n GoAgent -i ~/Downloads/goagent/local/CA.crt\n</pre>','','2013-07-01 18:42:01','2013-07-01 18:42:01','Vic','2013-06-08-ubuntu-goagent-crt','','','',''),(21,2,0,'Grunt前端发布自动化','<p>静态项目发布包括静态资源文件的合并、压缩、测试等繁琐流程，发布工作的重复性很高，有时为了方便，可能脚本未经过处理就上线，然而空格回车、长变量名、注释等对于线上环境是毫无意义的，却会浪费大量网络流量。</p>\n\n<p>超过三次以上的重复操作需考虑将其自动化，而Grunt正是自动化前端发布流程的利器。</p>\n\n<p>Grunt由许多小工具组成，如uglify, cssmin, etc. 这些工具能帮你完成特定的任务。但是如果把压缩后的文件都以min扩展命名，那发布后从开发环境切换到正式环境需要更改资源引用的路径，这可能又是一个不小而且容易出错的工作。</p>\n\n<p>如何组织项目目录结构，以便更方便的管理流程自动化，参考seajs的官方示例，可通过在url增加dev标识来区分开发和正式环境。</p>\n\n<pre class=\"prettyprint linenums\">\nif (location.href.indexOf(\'?dev\') > 0) {\n    var static_path = \'dev/\';\n} else {\n    var static_path = \'online/\';\n}\n</pre>\n\n<p>通过动态加载脚本来加载不同环境的静态资源（css不建议动态加载，避免页面重绘）。</p>\n\n<pre class=\"prettyprint linenums\">\nvar load_scripts = [\'http://libs.baidu.com/jquery/1.9.1/jquery.min.js\'];\nLoader.load(load_scripts, function() {\n    Loader.css(static_path + \'css/reset.css\', function() {\n        $(\'body\').append(\'css loaded\');\n    });\n    Loader.js(static_path + \'js/index.js\');\n});\n</pre>\n\n<p>开发源码在dev目录，通过Grunt编译后的文件放在对应的online目录下。目录组织如下：</p>\n\n<pre class=\"prettyprint linenums\">\n/spath\n    |-- dev [ develop environment ]\n    |    |-- css\n    |    `-- js\n    |-- online [ online environment ]\n    |    |-- css\n    |    `-- js\n    `-- index.html\n</pre>\n\n<p>这样通过访问不同url链接来切换开发环境与测试环境，而整个发布流程只需执行grunt即可得到最终外网压缩代码。</p>\n\n<p>PS：本例只考虑代码压缩，合并需另外自己手动配置</p>\n\n<p>spath：<a href=\"https://github.com/JesonRondo/spath\" target=\"_blank\">快到碗里来</a></p>','','2013-07-16 14:31:54','2013-07-16 14:31:54','Vic','2013-07-16-spath-by-grunt','','','',''),(22,4,0,'See U Friends','<p>老大、老大的老大</p>\n<p>都不能理解我为什么这样决定</p>\n<p>其实我哪有考虑那么多</p>\n<p>当然非常舍不得兄弟们</p>\n<p>只是这次</p>\n<p>我想自己过得开心点</p>\n<p>想做自己想去做的事</p>\n<p>仅此而已</p>','','2013-08-07 16:52:14','2013-08-07 16:52:14','Vic','2013-08-08-cleanup','','','',''),(23,3,0,'上有天堂，下有...嗯痕','<p>告别珠海的小伙伴们，孤身来到杭州，一直让加班充实着自己，可以忘却掉很多不想去想的东西，说不上是好是坏，但也浑浑噩噩的过来了。这座有着珠海类似节奏的城市，让我没有了突兀的感觉，可期待的归属感又还差了那么一点。</p>\n\n<p>在中国人蠢蠢欲动的假期，终于有机会去以“旅游”的眼光来看待即将生活的地方，正如我的工作一直就像在旅游一样。</p>\n\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202013193129.JPG\" alt=\"西湖\"></p>\n\n<p>杭城从西湖开始，到西湖结束。来了这么久一直还没搞清杭州到底是土鳖，还是高端大气，不过有西湖，其实这些都不太重要了。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202012397782.JPG\" alt=\"集贤亭\"></p>\n\n<p>信陵君来过么？记得电视剧里他有龙阳之好，呃......</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202012274501.JPG\" alt=\"湖中岛\"></p>\n\n<p>三潭印月有点小好不好，但是岛上的园艺还不错。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202012556070.JPG\" alt=\"园林\"></p>\n\n<p>有点像想象中苏州园林的感觉。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202013046827.JPG\" alt=\"雷峰塔\"></p>\n\n<p>小时候一直以为只要是个塔，塔底就有白素贞，导致对德山的塔有着很多遐想。可是真正来了雷峰塔还是没见白素贞，法海你不懂爱。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202013127521.JPG\" alt=\"雷峰塔檐\"></p>\n\n<p>不过见过的塔中，这个确实是最大的一个，而且俯瞰西湖挺壮观，游客多也不为过了。好希望这里的天能和北京PM100以下时一样蓝，可总有些水雾或泛白，她走着她自己的轨迹，似乎不能要求太多了。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202013476443.JPG\" alt=\"灵隐寺\"></p>\n\n<p>近年去寺庙有点多诶，灵隐，低调的奢华。我没信仰，也不排斥信仰，我不求什么，只求，不求什么。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202013327068.JPG\" alt=\"灵隐寺石柱\"></p>\n\n<p>丢～～～一脸的苦逼，你又不是程序猿。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202013563121.JPG\" alt=\"西湖夜景\"></p>\n\n<p>这不是花城、没有海风、没有雾霾，有...待发现...</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202014056220.JPG\" alt=\"西湖秋月\"></p>\n\n<p>晚来的月亮，中秋快乐？中秋还行。</p>\n\n<p><img src=\"http://s6.mogujie.cn/pic/131018/ubzlo_kqyus2klkfbdkzdwgfjeg5sckzsew_1x1.gif\" data-echo=\"http://vicbeta.com/upload/201309202014138779.JPG\" alt=\"昌老板\" /></p>\n\n<p>最后谢谢昌老板大老远的过来，不然又得一个人过节了。爆你照～</p>\n\n','','2013-09-20 20:10:47','2013-09-20 20:10:47','Vic','2013-09-20-hz-mid-autumn','','','',''),(24,2,0,'牙牙 Css Version','<style>\n        .ybody {\n            position: absolute;\n            width: 150px;\n            height: 200px;\n            left: 50%;\n            top: 50%;\n            background: #f4cf4a;\n            margin: -100px 0 0 -75px;\n            \n            border-top-left-radius: 90px 70px;\n            border-top-right-radius: 90px 70px;\n            border-bottom-left-radius: 25px 180px;\n            border-bottom-right-radius: 25px 180px;\n        }\n        .yleye, .yreye {\n            position: absolute;\n            top: 45px;\n            width: 10px;\n            height: 15px;\n            background: #251e30;\n            opacity: .8;\n\n            border-top-left-radius: 5px 8px;\n            border-top-right-radius: 5px 8px;\n            border-bottom-left-radius: 5px 8px;\n            border-bottom-right-radius: 5px 8px;\n        }\n        .yleye {\n            left: 33px;\n        }\n        .yreye {\n            right: 33px;\n        }\n        .yleye-blink, .yreye-blink {\n            position: absolute;\n            width: 4px;\n            height: 4px;\n            background: #fff;\n            border-radius: 2px;\n            top: 3px;\n        }\n        .yleye-blink {\n            right: 2px;\n        }\n        .yreye-blink {\n            left: 2px;\n        }\n        .ymouth {\n            position: absolute;\n            width: 56px;\n            height: 70px;\n            left: 50%;\n            top: 70px;\n            margin-left: -28px;\n            background: #251e30;\n            overflow: hidden;\n\n            border-top-left-radius: 28px 10px;\n            border-top-right-radius: 28px 10px;\n            border-bottom-left-radius: 28px 60px;\n            border-bottom-right-radius: 28px 60px;\n        }\n        .ytooth {\n            position: absolute;\n            width: 20px;\n            height: 10px;\n            top: -1px;\n            left: 18px;\n            background: #fff;\n            border-radius: 3px;\n            box-shadow: 0 0 5px rgba(0, 0, 0, .5);\n        }\n        .ytongue {\n            position: absolute;\n            width: 50px;\n            height: 50px;\n            background: -moz-linear-gradient(top, #251e30, #aa3315);\n            background: -webkit-linear-gradient(top, #251e30, #aa3315);\n            left: 3px;\n            bottom: -5px;\n\n            border-top-left-radius: 25px 40px;\n            border-top-right-radius: 25px 40px;\n            border-bottom-left-radius: 25px 10px;\n            border-bottom-right-radius: 25px 10px;\n        }\n        .ylface, .yrface {\n            position: absolute;\n            width: 20px;\n            height: 10px;\n            top: 70px;\n            background: #e1969b;\n            \n            border-top-left-radius: 10px 5px;\n            border-top-right-radius: 10px 5px;\n            border-bottom-left-radius: 10px 5px;\n            border-bottom-right-radius: 10px 5px;\n        }\n        .ylface {\n            left: 15px;\n            -webkit-transform: rotate(-5deg);\n        }\n        .yrface {\n            right: 15px;\n            -webkit-transform: rotate(5deg);\n        }\n        .ylhand, .yrhand {\n            position: absolute;\n            width: 30px;\n            height: 20px;\n            top: 120px;\n            background: #f4cf4a;\n        }\n        .ylhand {\n            left: -15px;\n            \n            border-top-left-radius: 25px 10px;\n            border-bottom-left-radius: 25px 10px;\n        }\n        .yrhand {\n            right: -15px;\n            \n            border-top-right-radius: 25px 10px;\n            border-bottom-right-radius: 25px 10px;\n        }\n        .ylfoot, .yrfoot {\n            position: absolute;\n            bottom: -10px;\n            width: 22px;\n            height: 30px;\n            background: #f4cf4a;\n        }\n        .ylfoot {\n            left: 13px;\n            border-bottom-left-radius: 120px 220px;\n            border-bottom-right-radius: 50px 120px;\n        }\n        .yrfoot {\n            right: 13px;\n            border-bottom-left-radius: 50px 120px;\n            border-bottom-right-radius: 120px 220px;\n        }\n        .ybot {\n            position: absolute;\n            width: 80px;\n            height: 25px;\n            bottom: -14px;\n            left: 50%;\n            margin-left: -40px;\n            background: #fff;\n\n            border-top-left-radius: 130px 40px;\n            border-top-right-radius: 130px 40px;\n        }\n</style>\n<div style=\"position:relative;height:360px;\">\n    <div class=\"ybody\">\n        <div class=\"yleye\">\n            <span class=\"yleye-blink\"></span>\n        </div>\n        <div class=\"yreye\">\n            <span class=\"yreye-blink\"></span>\n        </div>\n\n        <div class=\"ymouth\">\n            <div class=\"ytooth\"></div>\n            <div class=\"ytongue\"></div>\n        </div>\n\n        <div class=\"ylface\"></div>\n        <div class=\"yrface\"></div>\n\n        <div class=\"ylhand\"></div>\n        <div class=\"yrhand\"></div>\n\n        <div class=\"ylfoot\"></div>\n        <div class=\"yrfoot\"></div>\n        <div class=\"ybot\"></div>\n    </div>\n</div>\n<p>（如果您看到得牙牙不够帅气，那是您得浏览器不够高端大气）</p>','','2013-09-30 13:05:52','2013-09-30 13:05:52','Vic','2013-09-30-yaya-css','','','',''),(25,2,0,'生命在于减少代码','<p>写代码得偷偷懒</p>\n\n<p>1、获取js时间戳</p>\n\n<pre class=\"prettyprint linenums\">\n+new Date\n</pre>\n\n<p>2、去尾取整</p>\n\n<pre class=\"prettyprint linenums\">\n3.1415926535897932384626433832>>>0\n// result: 3\n</pre>\n\n<p>3、四舍五入</p>\n\n<pre class=\"prettyprint linenums\">\nvar num = 5.56789;\nvar n = num.toFixed(2);\n// result: 5.57\n</pre>\n<p>4、IE检测</p>\n\n<pre class=\"prettyprint linenums\">\n/* 比这个更短的写法通不过JSHint */\nif (!+\'\\v1\') {\n    // IE\n}\n</pre>\n\n<p>5、参数判空</p>\n\n<pre class=\"prettyprint linenums\">\n(function a(param) {\n    if (param == null) {\n        console.log(\'empty\');\n    }\n}());\n</pre>','','2013-10-18 10:05:34','2013-10-18 10:05:34','Vic','2013-10-18-safe-life','','','',''),(26,2,0,'IE6 zoom1时reflow BUG','<p>为了ie6的clearfix，zoom1来触发haslayout，但是出现了一个坑爹的问题，对dom操作引起浏览器重绘时，wrap的底部莫名出现了高度。</p>\n\n<p>HTML:</p>\n<pre class=\"prettyprint linenums\">\n&lt;div class=\"re_main clearfix\"&gt;\n    &lt;div class=\"re_sidebox fl\"&gt;&lt;/div&gt;\n    &lt;div class=\"re_cntbox fl\"&gt;&lt;/div&gt;\n&lt;/div>\n</pre>\n\n<p>CSS:</p>\n<pre class=\"prettyprint linenums\">\n.clearfix {*zoom: 1;}\n.re_main {padding-top: 80px; background: green;}\n.re_sidebox {width: 250px; background: blue;}\n.re_cntbox {width: 646px; background: yellow;}\n</pre>\n\n<p>like this:</p>\n<img src=\"http://vicbeta.com/upload/201312191616182637.jpg\" alt=\"toast\">\n\n<p>呵呵，哭了。。。But，发现了什么，下面多出来的高度和上面padding是一样的80px，改一下看看，发现确实是shit ie6把上面的padding复制到了下面，嗯，问题找到啦，骂ie什么的已经没兴趣了。乖乖把padding-top换成margin-top，问题就这么解决了。艾</p>\n\n<p>summary: 之前一直以为padding兼容性比margin好，但是当它出现问题的时候，就果断被虐了。。clearfix的zoom1虽然能实现clearfix，但是带来的问题也不止这一个，要随时做好被虐的准备（ ＴДＴ）</p>','','2013-12-19 16:04:52','2013-12-19 16:04:52','Vic','2013-12-19-ie6-zoom-reflow','','','','');
/*!40000 ALTER TABLE `v_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_info`
--

DROP TABLE IF EXISTS `v_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_info` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `field1` text COLLATE utf8_unicode_ci,
  `field2` text COLLATE utf8_unicode_ci,
  `field3` text COLLATE utf8_unicode_ci,
  `field4` text COLLATE utf8_unicode_ci,
  `field5` text COLLATE utf8_unicode_ci,
  `field6` text COLLATE utf8_unicode_ci,
  `field7` text COLLATE utf8_unicode_ci,
  `field8` text COLLATE utf8_unicode_ci,
  `field9` text COLLATE utf8_unicode_ci,
  `field10` text COLLATE utf8_unicode_ci,
  `field11` text COLLATE utf8_unicode_ci,
  `field12` text COLLATE utf8_unicode_ci,
  `field13` text COLLATE utf8_unicode_ci,
  `field14` text COLLATE utf8_unicode_ci,
  `field15` text COLLATE utf8_unicode_ci,
  `field16` text COLLATE utf8_unicode_ci,
  `field17` text COLLATE utf8_unicode_ci,
  `field18` text COLLATE utf8_unicode_ci,
  `field19` text COLLATE utf8_unicode_ci,
  `field20` text COLLATE utf8_unicode_ci,
  `field21` text COLLATE utf8_unicode_ci,
  `field22` text COLLATE utf8_unicode_ci,
  `field23` text COLLATE utf8_unicode_ci,
  `field24` text COLLATE utf8_unicode_ci,
  `field25` text COLLATE utf8_unicode_ci,
  `field26` text COLLATE utf8_unicode_ci,
  `field27` text COLLATE utf8_unicode_ci,
  `field28` text COLLATE utf8_unicode_ci,
  `field29` text COLLATE utf8_unicode_ci,
  `field30` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_info`
--

LOCK TABLES `v_info` WRITE;
/*!40000 ALTER TABLE `v_info` DISABLE KEYS */;
INSERT INTO `v_info` VALUES (1,1,0,'Travis','专注前端30年, kss, fuckphp','http://travisup.com/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(2,1,0,'热干面','热干面','http://www.cnblogs.com/Deasel-s-magic-box/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(3,1,0,'TantraMind','Rolling on the ground like a pig……','http://www.tntrmid.com/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(4,1,0,'Hugh','Hack Anything | Hugh\'s Blog','http://free-will.me/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(5,1,0,'IDEA','life for ideas','http://blog.satikey.com/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(6,1,0,'巨牛设计','巨牛设计','http://www.jn47.com/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(7,1,0,'补丁哥','补丁哥请骚烤','http://budingge.com/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(8,1,0,'玉面小飞鱼','前端风景很美','http://www.liyao.name/','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(9,1,0,'小前','专业划船30年','http://www.xiaoqian.org/','','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `v_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_info_alias`
--

DROP TABLE IF EXISTS `v_info_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_info_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) NOT NULL,
  `len` int(2) NOT NULL DEFAULT '30',
  `field1` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field1',
  `field2` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field2',
  `field3` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field3',
  `field4` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field4',
  `field5` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field5',
  `field6` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field6',
  `field7` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field7',
  `field8` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field8',
  `field9` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field9',
  `field10` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field10',
  `field11` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field11',
  `field12` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field12',
  `field13` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field13',
  `field14` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field14',
  `field15` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field15',
  `field16` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field16',
  `field17` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field17',
  `field18` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field18',
  `field19` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field19',
  `field20` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field20',
  `field21` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field21',
  `field22` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field22',
  `field23` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field23',
  `field24` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field24',
  `field25` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field25',
  `field26` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field26',
  `field27` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field27',
  `field28` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field28',
  `field29` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field29',
  `field30` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field30',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_info_alias`
--

LOCK TABLES `v_info_alias` WRITE;
/*!40000 ALTER TABLE `v_info_alias` DISABLE KEYS */;
INSERT INTO `v_info_alias` VALUES (1,0,30,'fiAAAA','field2','field3','field4','field5','field6','field7','field8','field9','field10','field11','field12','field13','field14','field15','field16','field17','field18','field19','field20','field21','field22','field23','field24','field25','field26','field27','field28','field29','field30'),(2,1,3,'Blog','标题','链接','field4','field5','field6','field7','field8','field9','field10','field11','field12','field13','field14','field15','field16','field17','field18','field19','field20','field21','field22','field23','field24','field25','field26','field27','field28','field29','field30');
/*!40000 ALTER TABLE `v_info_alias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-21  3:20:49
