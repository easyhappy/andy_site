-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: andy_site
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `crypted_password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `role` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `blogs_count` int(11) NOT NULL DEFAULT '0',
  `uid` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `provider` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `profile_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `profile_image_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'andyHu','meeasyhappy@gmail.com','$2a$10$hpsqPgpIbb865NuvA2Bsuuv/feHfg2PLMQQTEYF5lXotsdvwz49LG','admin','2013-09-09 07:07:27',14,NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_account_id` (`account_id`),
  KEY `index_attachments_on_blog_id` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_blog_comments_on_account_id` (`account_id`),
  KEY `index_blog_comments_on_blog_id` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comments`
--

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
INSERT INTO `blog_comments` VALUES (1,1,18,'test','2013-09-28 11:55:52');
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_contents`
--

DROP TABLE IF EXISTS `blog_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_contents`
--

LOCK TABLES `blog_contents` WRITE;
/*!40000 ALTER TABLE `blog_contents` DISABLE KEYS */;
INSERT INTO `blog_contents` VALUES (2,'搜集一些api 相关资料， To study for them.\r\nGrape 轻量级接口框架\r\nGrape Swagger 基于Grape的文档自动生成器\r\nSwagger UI Swagger UI套件\r\nGrape Entity 将API输入输出内容抽象成Entity实体,便于代码重用\r\nRspec Rails Rails下的Rspec, 针对测试的DSL\r\nCapybara 整合测试 Rack 应用的工具, 用来模拟真实用户的行为\r\nFactory Girl Rails 假数据构建工具\r\nSpork\r\nGuard 监听本地文件变动\r\nGuard Rspec 基于Guard，自动运行Rspec\r\nGuard Spork Spork on Guard,加速启动速度'),(3,'提高自己， 让宝宝 和小宝宝 过上 幸福的 日子。\r\n\r\n但是 任何 事情 需要一步一步的 进行。\r\n\r\n太快 容易 迷失 自己。\r\n\r\n所以 宁缺勿乱。\r\n\r\n所以 需要一个 计划。\r\n\r\n我相信，\r\n\r\n通过我的努力，\r\n\r\n5年 一定 是一个 崭新的 我。\r\n\r\n加油andy!!'),(4,'1、 备份数据库 与还原\r\n备份： mysqldump -u用户名 -p密码 数据库名 > backup.sql\r\n还原:\r\n\r\n       mysql -u用户名 -p密码\r\n       use 数据库名\r\n       source 路径/backup.sql\r\n2、查看数据库编码 与 设置 utf8编码\r\n\r\nshow create database db_name\r\nalter database db_name character set utf8\r\n3、 修改表字段编码\r\nALTER TABLE blogs CHANGE title title VARCHAR( 255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;'),(5,'这两天访问国外的一些网站， 发现被墙了，然而手上 木有好使的vpn。\r\n\r\n于是乎 自己找一台ec2 server 开始 搭建 vpn server.\r\n\r\n1、 我的安装环境\r\n\r\namazon ec2 的 ubuntu server 12.04\r\n\r\n2、安装pptpd\r\n\r\nsudo apt-get install pptpd\r\n3、配置 pptpd.conf\r\nsudo vi /etc/pptpd.conf\r\n取消以下几行注释：\r\n\r\noption /etc/ppp/pptpd-options\r\nlocalip 192.168.0.1\r\nremoteip 192.168.0.234-238,192.168.0.245\r\n4、添加用于登陆的账户\r\n\r\nsudo vi /etc/ppp/chap-secrets\r\n用户名 * \"密码\" *\r\n密码需要用英文双引号\r\n星号(*)代表允许接入的ip可以是任意ip。\r\n这样，vpn就搭建好了，不过大多数人包括我在内，用国外服务器搭VPN都是为了偶尔能跳出局域网，所以我们还需要配置转发。\r\n\r\n5、设置DNS解析，编辑pptpd-options文件\r\n\r\nsudo vi /etc/ppp/pptpd-options\r\n找到ms-dns，取消掉注释，并修改DNS地址，这里我推荐大家用Google DNS 8.8.8.8 和 8.8.4.4\r\n6、开启转发\r\n\r\nsudo vi /etc/sysctl.conf\r\n取消注释以下内容\r\n\r\nnet.ipv4.ip_forward=1\r\n这句话意思是：打开内核IP转发\r\n\r\n然后 输入\r\n\r\nsudo sysctl -p\r\n7、安装iptables并设置\r\n\r\nsudo apt-get install iptables\r\niptables -t nat -I POSTROUTING -j MASQUERADE\r\n后面这句话作用是：立刻让LINUX支持NAT(platinum)\r\n\r\n8、重新启动服务\r\n\r\nsudo /etc/init.d/pptpd restart\r\n9、 client配置\r\n\r\n输入用名名 和 密码 和 server ip\r\n\r\n点击 ‘Advanced’（高级）, 配置如下形式： 支持点对点传输\r\n\r\n10、 查看log\r\n\r\ntailf /var/log/syslog \r\n通过 log 可以看到client 确实 和 vpn server 建立了联系\r\n\r\n11、 通过Tcpdump 查看详细信息\r\n\r\nsudo tcpdump -i any -A'),(6,'解决方案:\r\n\r\n文件： ~/.rvm/rubies/ruby-1.9.3-p0/lib/ruby/1.9.1/webrick/config.rb\r\n第36行： DoNotReverseLookup => nil\r\n改成： DoNotReverseLookup => true\r\n\r\n相关资料:\r\n\r\nhttp://skandhas.iteye.com/blog/856203\r\n\r\nhttp://tieba.baidu.com/p/1180055982'),(7,'### web应用服务器简介\r\n\r\nweb应用服务器 主要由http服务器 和web应用程序框架， 说到http 服务器， 大家可能会想到nigix和apache， 以及基于纯ruby的WEBRick和thin； web应用程序框架方面 除了我们常用的rails， 还有sinatra等等。\r\n\r\n### web server\r\n\r\n其实我们知道 用户通过浏览器 向Web Server 发送请求， Web Server 对请求进行处理，然后返回给用户:\r\n\r\n建立Socket连接， 监听发送过来的请求\r\nHTTP Parser 解析并保存 request_path、http_method、header等等\r\nRack是ruby应用服务器和rack应用程序之间的接口，用户的请求到达应用服务器时，应用服务器会调用Rack,rack对请求进行一些包装，然后在调用rack程序\r\n\r\n### 代码分析\r\n\r\nWeb serser的大致流程就是这样 github 地址 ;主要包括三个文件\r\n\r\nGemfile\r\ntube.rb 核心代码 包括 TcpServer, Socket, HTTP::Parser；以及通过 Builder 方式 加载 config.ru文件， 加载rack 程序\r\nconfig.ru\r\ntube.rb\r\n\r\n通过instance_eval 将config.ru中的代码 加载成一个app程序， 查看 config.ru的代码， 当env[\"PATH_INFO\"] == “/sleep” sleep 10秒\r\n初始化一个TCPServer， 监听一个port， 这里是3003\r\n调用frefork方法 fork出三个相同子进程， 并发处理请求\r\nSocket…\r\nHTTP：：Parser….\r\n调用app.call ，然后返回 response\r\n\r\n```\r\nrequire \'socket\'\r\nrequire \'http/parser\'\r\n\r\nclass Tube\r\n  def initialize(port, app)\r\n    @app = app\r\n    @server = TCPServer.new(port)\r\n  end\r\n\r\n  def prefork(workers=3)\r\n    workers.times do\r\n      fork do \r\n        puts \"Fork Pid is #{Process.pid}\"\r\n        start\r\n      end\r\n    end\r\n    Process.waitall\r\n  end\r\n\r\n  def start\r\n    loop do\r\n      @socket = @server.accept\r\n      Thread.new do\r\n        connection = Connection.new(@socket, @app)\r\n        connection.process\r\n        e = Time.now\r\n      end\r\n    end\r\n  end\r\n\r\n  class Connection\r\n    def initialize(socket, app)\r\n      @socket = socket\r\n      @app = app\r\n      @parser = Http::Parser.new(self)\r\n    end\r\n\r\n    def process\r\n      until @socket.closed? || @socket.eof?\r\n        data = @socket.readpartial(1024)\r\n        @parser << data\r\n      end\r\n    end\r\n\r\n    def on_message_complete\r\n      env = {}\r\n      @parser.headers.each_pair do |name, value|\r\n        name = \"HTTP_\" + name.upcase.tr(\"-\", \"_\")\r\n        env[name] = value\r\n      end\r\n      env[\"PATH_INFO\"] = @parser.request_path\r\n      env[\"REQUEST_METHOD\"] = @parser.http_method\r\n      env[\"rack.input\"] = StringIO.new\r\n\r\n      send_response(env)\r\n    end\r\n\r\n    def send_response(env)\r\n      status, header, body = @app.call(env)\r\n\r\n      @socket.write \"HTTP/1.1  200 OK\\r\\n\"\r\n      @socket.write \"\\r\\n\"\r\n      body.each do |chunk|\r\n        @socket.write chunk\r\n      end\r\n      body.close if body.respond_to? :close\r\n      close\r\n    end\r\n\r\n    def close\r\n      @socket.write \"HTTP/1.1  200 OK\\r\\n\"\r\n      @socket.close\r\n    end\r\n  end\r\n\r\n  class Builder\r\n    attr_reader :app\r\n\r\n    def run(app)\r\n      @app = app\r\n    end\r\n\r\n    def self.parse_file(file)\r\n      content = File.read(file)\r\n      builder = self.new\r\n      builder.instance_eval(content)\r\n      builder.app\r\n    end\r\n  end\r\nend\r\napp = Tube::Builder.parse_file(\'config.ru\')\r\nserver = Tube.new(3003, app)\r\nserver.prefork\r\n\r\n```\r\nconfig.ru 代码内容\r\n\r\n```\r\n\r\nclass App\r\n  def call(env)\r\n    puts \"env is : #{env}\"\r\n    if env[\"PATH_INFO\"] == \"/sleep\"\r\n      sleep 10\r\n      puts \'sleep 10s\'\r\n    end\r\n    message = \"Hello from the andy, and process pid is : #{Process.pid}\\n\"\r\n    [200,\r\n      {\"Content-Type\" => \"text/plain\"},\r\n      [message]\r\n    ]\r\n  end\r\nend\r\n\r\nrun App.new\r\n\r\n```\r\n### 总结\r\n\r\n这块代码的核心 主要由两部分：\r\n\r\n通过fork 可以开启3个相同的进程， 这样就可以 实现并发 监测 客户端的请求了。\r\nRack 是 ruby server的核心中 核心， 以后 有时间 写一篇 关于rack的文章。'),(12,'C++ 中 菱形继承现象\r\n\r\nC++中的菱形继承一直被广大程序员所诟病。比如说A派生出B和C。 D又多继承自B, C； 那么D里面会有两个A的核。\r\n\r\n\r\n                    A \r\n                  ------ \r\n                  /     \\ \r\n            -----     ------ \r\n              B             C   \r\n           -----     ------ \r\n                \\         / \r\n                 ------ \r\n                    D \r\n                 ------\r\n\r\n转化为代码形式\r\n\r\nclass A{}; //基类\r\n\r\nclass B:public A{};//子类\r\n\r\nclass C:public A{};\r\n\r\nclass D:public B,public C();\r\n\r\n如上代码中A,B,C,D就构成了一个菱形继承，如果不用虚基类来实现菱形继承就会导致模糊调用的现象，所谓模糊调用就是说在D的内存中会保留两个基类A的对象，如何解决这个问题，利用虚基类就能很好的解决这个问题，即可改为\r\n\r\nclass B:virtual public A{};//子类\r\n\r\nclass C:virtual public A{};\r\n\r\nRuby 与 多继承\r\n\r\nRuby不支持多继承， 只支持 单一继承。\r\n\r\n但是Ruby的mixin让 ‘多重继承’ 变得很容易。 其实 mixin 也是继承，不过是经过巧妙设计的继承； matz在书中说， mixin 是接口一个意思； 从实际的项目中来说，但我们需要分解对象或者公用一部分的代码的时候， 一般会使用mixin。​\r\n\r\nRuby 非常聪明的引进了一个新的东西，Module，是的，Ruby也限制你只能继承自一个父类，但是你可以无限制的include Module。 也许 第一眼 你会觉得Module和C里面的MACRO好像，然后把它忘在脑后，可是实际上Module是一个更加面向对象更加高明的设计，它的作用其实是把多重（树形）继承自动的转化成单（链式）继承，当你想要D继承自B, C时。\r\n\r\nC++ 继承树是摘样子的:\r\n\r\nB  ->\r\n             D\r\nC  ->\r\n\r\n而 Ruby是这样的\r\nB -> C -> D\r\n\r\n回到 Ruby 的 Module 的 设计\r\n\r\n在Ruby中Module实际上是Class的父类，但Module本身也是一个Class有点绕口。。。Module除了不能在Ruby的层次上被实例化以外，其他和Class并无太大区别。\r\n\r\n由于Module不能实例化，这必然使得Ruby需要另外一个设计，弱类型以及Duck typing。\r\n要在C++里面使用多态，你必须这样int lala(A a),也就是用父类来做占位符，如果Ruby也要这样就完了：既然Module不能实例化，那用什么来做占位符？ 因为 Ruby是弱类型， 所以 你def lala(a)就好了，不用声明a是什么类型，只要a有A的方法，我们就认为它是A的实例，这样多态(Duck Typing)就成为很容易的事情了。'),(15,'最近在研究ActiveSupport::Concern, 虽然Concern源码只有29行，但是它很好的解决Module与Module之间的依赖关系。\r\n\r\nActiveSupport::Concern\r\n\r\n在Concern之前的解决方案:\r\n```\r\nmodule M\r\n  def self.included(base)\r\n    base.extend ClassMethods\r\n    base.class_eval do\r\n      scope :disabled, -> { where(disabled: true) }\r\n    end\r\n  end\r\n\r\n  module ClassMethods\r\n    ...\r\n  end\r\nend\r\n```\r\n利用Concern的解决方案是：\r\n\r\n```\r\nrequire \'active_support/concern\'\r\n\r\nmodule M\r\n  extend ActiveSupport::Concern\r\n\r\n  included do\r\n    scope :disabled, -> { where(disabled: true) }\r\n  end\r\n\r\n  module ClassMethods\r\n    ...\r\n  end\r\nend\r\n\r\n```\r\n正如上面看到的一样 Concern可以实现Module之间的依赖关系...\r\n\r\n查看源码(我们在源码 加入一些输出信息)\r\n```\r\nmodule ActiveSupport\r\n  module Concern\r\n    def self.extended(base)\r\n      puts \"extended: self--#{self.to_s} is extended by #{base.to_s}\"\r\n      base.instance_variable_set(\"@_dependencies\", [])\r\n    end\r\n\r\n    def append_features(base)\r\n      puts \"self is #{self.to_s}, base is #{base.to_s}\"\r\n      if base.instance_variable_defined?(\"@_dependencies\")\r\n        puts \"Creating @_dependencies on - #{base.to_s}\"\r\n        base.instance_variable_get(\"@_dependencies\") << self\r\n        return false\r\n      else\r\n        puts \"return false\" and return false if base < self\r\n        puts \"Including dependencies #{@_dependencies.inspect} to - #{base.to_s} and self is #{self.to_s}\"\r\n        @_dependencies.each do |dep|\r\n          puts \"before send , base not include #{dep}\" ;\r\n          base.send(:include, dep); \r\n          puts \'base include %s\' %(dep)\r\n        end\r\n        super\r\n        puts \"Checking for ClassMethods and blocks in - #{base.to_s} and self is #{self.to_s}\"\r\n        base.extend const_get(\"ClassMethods\") if const_defined?(\"ClassMethods\")\r\n        if const_defined?(\"InstanceMethods\")\r\n          base.send :include, const_get(\"InstanceMethods\")\r\n          ActiveSupport::Deprecation.warn \"The InstanceMethods module inside ActiveSupport::Concern will be \" \\\r\n            \"no longer included automatically. Please define instance methods directly in #{self} instead.\", caller\r\n        end\r\n        base.class_eval(&@_included_block) if instance_variable_defined?(\"@_included_block\")\r\n      end\r\n    end\r\n\r\n    def included(base = nil, &block)\r\n      if base.nil?\r\n        @_included_block = block\r\n      else\r\n        super\r\n      end\r\n    end\r\n  end\r\nend\r\n```\r\n分析源码\r\n\r\nConcern 总共有3个方法:\r\n\r\n1、self.extended， 是一个回调方法，会在ActiveSupport::Concern被extend进其他module或class时触发。参数base就是被extend的module或class。\r\n这个方法的作用是，为base类加入一个实例变量 @_dependencies。默认值是空数组。它用来保存这个模块依赖的其他模块的列表。\r\n\r\n2、 append_features， 这也是一个回调方法。它是在一个module被include进入其他module或class时调用的。当一个class（或module） include另一个module时，class会按照include module 相反 的顺序去调用每个module的 append_features方法。这个方法的默认实现，是把module的变量，实例方法等东西 copy 到被混入的class中。\r\n\r\n3、included。很简单，如果有block。就把block存进 @_included_block 变量。然后在append_featuers中传给base.class_eval。没有block。就和普通的included回调方法一样。\r\n\r\n利用测试代码 来更好的理解 Concern的机制\r\n```\r\n1 require \'active_support\'\r\n2 require \'pry\'\r\n3 \r\n4 module Baz\r\n5   extend ActiveSupport::Concern\r\n6   def baz\r\n7     puts \"baz!\"\r\n8   end\r\n9 end\r\n10 \r\n11 module Bar\r\n12   extend ActiveSupport::Concern\r\n13   include Baz\r\n14   def bar\r\n15     puts \"bar!\"\r\n16   end\r\n17 end\r\n18 \r\n19 module Foo\r\n20   extend ActiveSupport::Concern\r\n21   include Bar\r\n22 end\r\n23 \r\n24 class Zoo\r\n25   include Foo\r\n26 end\r\n27 puts Zoo.ancestors.inspect\r\n```\r\n运行后结果是：\r\n```\r\nextended: self--ActiveSupport::Concern is extended by Baz\r\nextended: self--ActiveSupport::Concern is extended by Bar\r\nself is Baz, base is Bar\r\nCreating @_dependencies on - Bar\r\nextended: self--ActiveSupport::Concern is extended by Foo\r\nself is Bar, base is Foo\r\nCreating @_dependencies on - Foo\r\nself is Foo, base is Zoo\r\nIncluding dependencies [Bar] to - Zoo and self is Foo\r\nbefore send , base not include Bar\r\nself is Bar, base is Zoo\r\nIncluding dependencies [Baz] to - Zoo and self is Bar\r\nbefore send , base not include Baz\r\nself is Baz, base is Zoo\r\nIncluding dependencies [] to - Zoo and self is Baz\r\nChecking for ClassMethods and blocks in - Zoo and self is Baz\r\nbase include Baz\r\nChecking for ClassMethods and blocks in - Zoo and self is Bar\r\nbase include Bar\r\nChecking for ClassMethods and blocks in - Zoo and self is Foo\r\n[Zoo, Foo, Bar, Baz, Object, PP::ObjectMixin, Kernel, BasicObject]\r\n```\r\n运行结果分析:\r\n1、测试代码第5行，\r\n\r\nextend ActiveSupport::Concern\r\n触发Concern的self.extended方法\r\n同时将@_dependencies 设置为[Baz]\r\n\r\n输出结果：\r\nextended: self--ActiveSupport::Concern is extended by Baz \r\n2、 第6行\r\n\r\nextend ActiveSupport::Concern\r\n触发Concern的self.extended方法 \r\n同时将@_dependencies 设置为[Bar]\r\n\r\n输出\r\nextended: self--ActiveSupport::Concern is extended by Bar\r\n3、 第7行\r\n\r\ninclude Baz\r\n触发 Concern的append_features方法\r\n因为Bar已经定义@_dependencies变量,\r\n\r\n输出\r\nself is Baz, base is Bar\r\nCreating @_dependencies on - Bar\r\n4、 20行\r\n\r\nextend ActiveSupport::Concern\r\n触发Concern的self.extended方法\r\n同时将@_dependencies 设置为[Foo]\r\n\r\n输出\r\nextended: self--ActiveSupport::Concern is extended by Foo \r\n5、 21行\r\n\r\ninclude Bar\r\n触发 Concern的append_features方法\r\n同时 Foo已经定义@_dependencies变量\r\n\r\n输出\r\n\r\nself is Bar, base is Foo\r\nCreating @_dependencies on - Foo\r\n6、 25行\r\n\r\ninclude Foo\r\n\r\n所以输出\r\nself is Foo, base is Zoo\r\n\r\n因为Zoo 没有 extend ActiveSupport::Concern, 所以Zoo没有变量 @_dependencies\r\n所以程序会走到\r\n```\r\nif base.instance_variable_defined?(\"@_dependencies\")\r\n   ...\r\nelse\r\n   这里\r\nend\r\n```\r\n输出:\r\nIncluding dependencies [Bar] to - Zoo and self is Foo\r\n可以看到当前类是 Foo， 父类是Zoo\r\n7、 然后调用\r\n\r\n@_dependencies.each do\r\n   ...\r\nend\r\n\r\n输出\r\nbefore send , base not include Bar\r\n8、 调用base.send(:include, Bar) 触发append_feature方法\r\n\r\n输出:\r\nself is Bar, base is Zoo\r\nIncluding dependencies [Baz] to - Zoo and self is Bar\r\n\r\n9、 递归调用以此类推 产生输出结果:\r\n```\r\nbefore send , base not include Baz\r\nself is Baz, base is Zoo\r\nIncluding dependencies [] to - Zoo and self is Baz\r\nChecking for ClassMethods and blocks in - Zoo and self is Baz\r\nbase include Baz\r\nChecking for ClassMethods and blocks in - Zoo and self is Bar\r\nbase include Bar\r\nChecking for ClassMethods and blocks in - Zoo and self is Foo\r\n[Zoo, Foo, Bar, Baz, Object, PP::ObjectMixin, Kernel, BasicObject]\r\n```\r\n总结\r\n\r\n1、 代码很精炼， 只有20多行， 却很好的解决Module之间的依赖关系， 进而实现Mixin\r\n2、 利用递归调用技术， 延迟 加载 所有的类， 并 通过将加载的类 copy 到自己的class 中， 以来实现Mixin\r\n3、 使用了元编程技术 比如： instance_variable_get 和 instance_variable_set等等。\r\n4、 使用hook 特性 增加一些操作。'),(17,' callbacks 贯穿着对象的整个生命周期, 比如 在rails中, model里有before_save, after_save等，controller里有before_filter, after_filter等，他们都是基于activesupport的callback来实现的； 所以利用 中秋节这段时间 研究一下它的源码\r\n\r\n### 从一个demo 入手\r\n```\r\n# coding: utf-8\r\nrequire \'active_support/callbacks\'\r\nrequire \'pry\'\r\n\r\nclass Record\r\n  include ActiveSupport::Callbacks\r\n  define_callbacks :save\r\n\r\n  def save\r\n    run_callbacks :save do\r\n      puts \"- save\"\r\n    end\r\n  end\r\n\r\n  set_callback :save, :before, :saving_message\r\n  def saving_message\r\n    puts \"before save 1\"\r\n  end\r\n\r\n  set_callback :save, :after do |object|\r\n    puts \"after save 1\"\r\n  end\r\n\r\n  set_callback :save, :before, :hello\r\n  def hello\r\n    puts \'before save 2\'\r\n  end\r\n\r\n  set_callback :save, :after do |object|\r\n    puts \'after save 2\'\r\n  end\r\n\r\nend\r\n\r\nRecord.new.save\r\n\r\n```\r\n\r\n通过例子， 可以看出 对于callback 主要涉及三个部分：\r\n\r\n * define_callback 定义一个回调\r\n * set_callback 设置回调的内容\r\n * run_callback 调用回调中的代码\r\n\r\n### define_callback\r\n\r\n通过查看源码(如下）， 我们可以看到define_callback的主要作用是两部分:\r\n  * 类变量 _#{callback}_callbacks, 这里就是_save_callbacks; 用于保存通过set_callback设置的回调链\r\n  * 生成_run_save_callbacks, 在run_callback调用会调用相应的_run_save_callback\r\n\r\n```\r\ndef define_callbacks(*callbacks)\r\n  config = callbacks.last.is_a?(Hash) ? callbacks.pop : {}\r\n  callbacks.each do |callback|\r\n    class_attribute \"_#{callback}_callbacks\"\r\n    send(\"_#{callback}_callbacks=\", CallbackChain.new(callback, config))\r\n    __define_runner(callback)\r\n  end\r\nend\r\n```\r\n\r\n### set_callback\r\n\r\n```\r\ndef set_callback(name, *filter_list, &block)\r\n  mapped = nil\r\n\r\n  __update_callbacks(name, filter_list, block) do |target, chain, type, filters, options|\r\n    mapped ||= filters.map do |filter|\r\n      Callback.new(chain, filter, type, options.dup, self)\r\n    end\r\n\r\n    filters.each do |filter|\r\n      chain.delete_if {|c| c.matches?(type, filter) }\r\n    end\r\n\r\n    options[:prepend] ? chain.unshift(*(mapped.reverse)) : chain.push(*mapped)\r\n\r\n    target.send(\"_#{name}_callbacks=\", chain)\r\n  end\r\nend\r\n```\r\nset_callback  通过 target.send(\"_#{name}_callbacks=\", chain)依次将回调加入到 chain中, 保存在_#{name}_callbacks中\r\n\r\n### run_callbacks\r\n\r\n 在define_callback 中， 定义了 _run_save_callback, _run_save_callback实际调用是内部函数_run_callback:\r\n\r\n```\r\ndef __run_callback(key, kind, object, &blk) #:nodoc:\r\n  name = __callback_runner_name(key, kind)\r\n  unless object.respond_to?(name, true)\r\n    str = object.send(\"_#{kind}_callbacks\").compile(key, object)\r\n    class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1\r\n      def #{name}() #{str} end\r\n      protected :#{name}\r\n    RUBY_EVAL\r\n  end\r\n  object.send(name, &blk)\r\nend\r\n```\r\n\r\n_run_callback 检查object是否已经有了name对应的方法，有就直接调用，从这里可以看到只有第一次调用是会动态生成方法，后面就会调用真是存在的方法，这样可以提高性能。 上面的str 就是根据set_callback设置的回调  动态生成的回调方法， 通过binding.pry获取到str的内容如下：\r\n\r\n```\r\nvalue = nil\r\nhalted = false\r\n            if !halted && true\r\n              result = result = saving_message\r\n              halted = (false)\r\n              if halted\r\n                halted_callback_hook(\":saving_message\")\r\n              end\r\n            end\r\n\r\n            if !halted && true\r\n              result = result = hello\r\n              halted = (false)\r\n              if halted\r\n                halted_callback_hook(\":hello\")\r\n              end\r\n            end\r\n\r\nvalue = yield if block_given? && !halted\r\n          if true\r\n            _callback_after_7(self)\r\n          end\r\n\r\n          if true\r\n            _callback_after_3(self)\r\n          end\r\nhalted ? false : (block_given? ? value : true)\r\n```\r\n通过str的输出内容， 可以看出before callback的执行顺序 和set_callback的顺序相同， 而after callback刚刚相反。 根据运行结果也验证这一点\r\n\r\n```\r\nbefore save 1\r\nbefore save 2\r\n- save\r\nafter save 2\r\nafter save 1\r\n```\r\n\r\n### 总结\r\n  * before callback 和 after callback的中执行顺序相反\r\n  * 在第一次调用回调的时候， 动态生成回调方法。 以后直接调用， 大大的提高了效率\r\n'),(18,'这几天研究了ORM如何初始化一个object， 以及在初始化的过程哪些过程比较消耗性能....\r\n\r\n在开始之前， 先通过benchmark建立一个初步的印象(ruby-1.9.3-p448):\r\n\r\n```\r\n                                                            |   Class |    Hash | AR 3.2.1 | AR no protection | Datamapper |  Sequel |\r\n --------------------------------------------------------------------------------------------------------------------------------------\r\n .new()                                              x100000 |   0.069 |   0.085 |    2.259 |            2.319 |      0.054 |   0.291 |\r\n .new({:id=>1, :title=>\"Foo\", :text=>\"Bar\"})         x100000 |   0.617 |   0.076 |   10.334 |            9.415 |      6.289 |   3.077 |\r\n\r\n ```\r\n\r\n你可以 看到benchmark 从Class 实例， Hash 以及 ActiveRecord object几个方面 比较了没有任何参数的 和 带参数的的 时间消耗。 通过benchmark， 可以发现ORM object 消耗的时间是空object的10倍， 为什么创建一个ORM对象这么慢， 时间都消耗在哪里呢？\r\n\r\n------------------------------\r\n\r\n这里 我主要通过 perftools.rb 跟踪 object的初始化流程， 画出整个调用流程图。全图可以参见[分析的pdf下载 点击这里](https://github.com/easyhappy/orm_benchmark/blob/master/pdf/ruby_1.9.3_init_objects.pdf?raw=true)\r\n\r\n通过pdf的中的描述 我们可以看出一下几点\r\n1： garbage_collector 消耗17%的时间\r\n2： 创建一个ActiveRecord object消耗情况\r\n * assign_attributes  中的anitize_for_mass_assignment 消耗了10%的CPU \r\n * callback 消耗了18%的CPU， 即使你没有使用callback\r\n * serialization（序列化) 消耗了很少的CPU\r\n'),(22,'![rails](http://blog.wyeworks.com/images/posts/Rails4-4.png)'),(23,'### 数组参数 argument array\r\n\r\n 把一组参数 压入 到 一个 数组中\r\n\r\n```\r\ndef my_method(*args)\r\n  args.map do |arg|\r\n    arg.reverse\r\n  end\r\nend\r\n\r\nmy_method(\'a\', \'b\', \'cd\') #=> (\'a\', \'b\', \'dc\')\r\n```\r\n\r\n### 环绕别名 around alias\r\n\r\n  从一个重新定义的方法中 调用 原始的 方法\r\n\r\n```\r\nclass String\r\n  alias :old_length, :length\r\n\r\n  def length\r\n     old_length + 1     \r\n  end\r\nend\r\n```\r\n  关于环绕别名的 警告：\r\n   * 环绕别名 是 一种猴子补丁， 因此 会 破坏原来的代码\r\n   * 潜在的危险 永远不要将环绕别名加载 两次， 否则 会出现 你想不到的后果\r\n\r\n### 白板 blank slate\r\n  \r\n  白板类的来源： 动态代理的一个 通病， 当一个幽灵方法 和 一个真实的方法 发生名字 冲突时 ， 后者 会 胜出； 如果不需要那个 继承来的方法，  则 可以删除它 来解决问题， 一般为了 安全起见 会 将代理类中的 大多数继承来的 方法 删掉， 由此 产生了 白板类\r\n\r\n### 类扩展 class extension\r\n\r\n  含义： 通过向类的eigenclass 中 混入模块 来 定义 类方法\r\n\r\n```\r\nmodule MyMoudle\r\n  def my_method\r\n     \'hello\'\r\n  end\r\nend\r\n\r\nclass MyClass\r\n  class << self\r\n    include MyModule\r\n  end\r\nend\r\n\r\nMyClass.my_method\r\n```\r\n通过 以上方式 my_method 是MyClass的eigenclass的一个实例方法， 这样 my_method 也就是 MyClass的一个类方法\r\n\r\n### 对象扩展 object extension\r\n\r\n```\r\nmodule MyModule\r\n  def my_method\r\n     puts \'hello\'\r\n  end\r\nend\r\n\r\nobj = Object.new\r\nclass << obj\r\n  include MyModule\r\nend\r\nobj.my_method                 #=> \'hello\'\r\nobj.singleton_methods      #=> [\'my_method\']\r\n```\r\n思考 为什么如上 可以 将my_method 加入到 obj.singleton_methods?\r\n\r\n### 类扩展混入 class extension mixin\r\n\r\n  使一个模块 可以 通过 钩子方法 扩展它的 包含者\r\n\r\n### 类实例变量 class instance variables\r\n\r\n```\r\n  class MyClass\r\n    @var = 1\r\n    def self.read\r\n        puts @var\r\n    end\r\n\r\n    def set\r\n        @var = 2\r\n    end\r\n\r\n    def read\r\n       puts @var\r\n    end \r\n  end\r\n\r\nobj = MyClass.new\r\nobj.write\r\nobj.read #=> 2\r\nMyClass.read  #=> 1\r\n```\r\n  需要注意以下几点: \r\n    * 类实例变量 不等于类的对象的 实例变量\r\n    * 类变量 是以 @@ 开头, 因为类变量不属于 一个类， 而是 属于 类体系结构， 慎用!!\r\n\r\n### 类宏 class macro\r\n\r\n   在类定义中  使用 一个类方法, 类似 attr_accessor\r\n```\r\n   class C； end\r\n   class << C\r\n     def my_macro(arg)\r\n         \"#{arg} is called\" \r\n      end\r\n   end\r\n\r\n   class C\r\n      my_macro :x  #=> x is called\r\n   end\r\n```\r\n\r\n### 洁净室 clean room\r\n  \r\n  使用对象 作为 执行 上下文的环境\r\n\r\n```\r\ndef my_method\r\n  puts \'hello\'\r\nend   \r\n\r\nObject.new.instance_eval{ my_method }\r\n```\r\n\r\n### 代码处理器 code processor\r\n eval(\"1+1\") #=> 2\r\n\r\n### 上下文 探针 context probe\r\n\r\n  通过 instance_eval 可以 获取到 对象的 上下文信息\r\n\r\n### 延迟执行 deferred evaluation\r\n\r\n  在 proc 或 lambda 中 存储一段 代码， 用于 以后 执行\r\n\r\n### 动态派发 dynamic dispatch\r\n\r\n   在运行时 决定 调用哪个方法\r\n\r\n```\r\nmethod_to_call = :reverse\r\nobj = \'acb\'\r\nobj.send method_to_call\r\n```\r\n\r\n### 动态方法 dynamic method\r\n\r\n 在运行时 决定 如何定义一个方法 \r\n\r\n```\r\nclass C\r\n  define_method :my_method do\r\n     \'a dynamic method\'\r\n  end\r\nend\r\n```\r\n\r\n### 动态代理 dynamic proxy\r\n\r\n   通过method_missing 把不能 对应 某个方法名的  消息转发给 另外一个 对象\r\n\r\n### 扁平作用域 flat scope\r\n\r\n  使用闭包 在两个作用域 之间 共享变量\r\n\r\n```\r\nclass C\r\n  def an_attribue\r\n    @attr\r\n  end\r\nend\r\n\r\nobj = C.new\r\none_attr = 100\r\nobj.instance_eval do \r\n   @attr = one_atrr\r\nend\r\n```\r\n\r\n\r\n### 幽灵方法 ghost method \r\n\r\n  通过 method_missing  响应一个 没有关联的方法\r\n\r\n### 钩子方法 hook method\r\n\r\n  通过 覆写 某个 特殊方法 类 截获 对象事件\r\n\r\n```\r\nclass A\r\n  def self.inherited(subclass)\r\n   $SUBERS << subclass\r\n  end\r\nend\r\n\r\nclass D < A\r\nend\r\n\r\nclass B < A\r\nend\r\n\r\nclass C < B\r\nend\r\n\r\n$SUBERS #=> [D, B, C]\r\n```\r\n\r\n### 内核方法 kernel method\r\n\r\n在 Kernel 模块中 定义一个方法， 所有的对象都可以使用\r\n\r\n### 惰性实例变量 lazy instance variable\r\n\r\n 当 第一次 访问这个变量的 时候 在对其 初始化\r\n\r\n```\r\nclass C\r\n  def attribute\r\n    @attr ||= \"some value\"\r\n  end\r\nend\r\n```\r\n\r\n### 拟态方法 mimic method\r\n\r\n```\r\nclass C\r\n  def attribute=(value)\r\n    @attribute = value\r\n  end\r\nend\r\n\r\nobj = C.new\r\nobj.attribute= 3\r\n```\r\n调用 obj.attribute= 3 等价于 调用 obj.attribute= (3)， 类似于 obj.attribute=3  这种， 将自己伪装 成另外的自己的时候 叫做 拟态方法\r\n\r\n\r\n### 猴子补丁 monkey patch\r\n\r\n  修改已有类的特性\r\n\r\n### 具名参数 named attribute\r\n\r\n  将参数 压入到 一个hash 中\r\n\r\n### 命名空间 namespace\r\n\r\n 可以有效的防止 命名冲突\r\n\r\n### 空指针保护 nil guard\r\n\r\n 用 || 覆盖一个 空引用\r\n\r\n  a ||= []'),(24,'第四章 类定义\r\n1： 在ruby 中 类的定义 有所不同， 当 使用class 关键字的时候 其实 在运行代码\r\n\r\n2： 在不使用 一个class 的情况 下， 使用 class_eval 可以 修改类的方法， 而且\r\n使用class 会新打开一个作用域，会丧失 当前绑定的可见性 class_eval 则采用的是扁平作用域 \r\n\r\n3： ruby 解释器 会总是 跟踪 当前类\r\n```\r\nclass A\r\n    def m_one\r\n       def m_two\r\n           puts \'m_two\'\r\n        end\r\n     end\r\nend\r\na = A.new\r\na.m_one\r\na.m_two #=> \'m_two\'\r\n```\r\n\r\n4： 单件方法 singleton method 只对当前对象 生效的方法\r\n\r\n5: 类只是 对象， 类名 只是常量\r\n\r\n6： 类方法的本质： 他们是类的 单件方法\r\n\r\n7:  深入理解 ruby 对象模型的 7条规则\r\n\r\n  * 只有 一种对象： 要么是类， 要么 是普通模块\r\n  * 只有一个模块： 要么是类， 要么是普通模块， eigenclass 或者代理类\r\n  * 只有一个 方法 存在于 一种模块中 通常是类中\r\n  *  每个对象包括类 都有自己的 “真正的类” 要么是 普通类， 要么是eigenclass\r\n  * 除了BasicObject外， 任何类 只有一个超类\r\n  * 一个对象的eigenclass的超类 就是 这个对象的类, 一个对象的eigenclass的超类 = 对象超类的 eigenclass\r\n  * Ruby查找方法的策略： 向右一步 进行真正的类进行查找， 要么 向上 进行 祖先链中查找'),(26,'1: Mongo master 与slave 数据同步的原理\r\n   采用master slave 架构时， master 将操作记录(oplog) 存在database: local, collection: oplog.$main \r\n中。 oplog 主要有以下特点：\r\n * 只存储 写操作\r\n * operation 在插入前 被转化， 比如：\"$inc\" 被转换为 \"$set\" operation\r\n * oplog 的 collection 是 Capped Collection， 即 设定 大小， 当超过这个限制时， 新的元素 会覆盖 最旧的元素.\r\n\r\n这样slave 就可以根据 oplog 进行数据同步\r\n\r\n ');
/*!40000 ALTER TABLE `blog_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `slug_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `blog_content_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `content_updated_at` datetime DEFAULT NULL,
  `commentable` tinyint(1) NOT NULL DEFAULT '1',
  `cached_tag_list` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_blogs_on_account_id` (`account_id`),
  KEY `index_blogs_on_content_updated_at` (`content_updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (2,'Rest Api','',40,2,'2013-09-10 02:28:05',1,0,'2013-09-18 05:52:50',1,'rails   gem','blog'),(3,'宁缺 勿乱','',50,3,'2013-09-10 02:44:31',1,0,'2013-09-18 05:52:31',1,'','blog'),(4,'mysql 命令','',70,4,'2013-09-10 02:48:55',1,0,'2013-09-18 05:54:16',1,'mysql','note'),(5,'在Amazon 上搭建vpn server','',70,5,'2013-09-10 02:50:11',1,0,'2013-10-15 06:02:15',1,'linux vpn','blog'),(6,'WebRick 在局域网中 响应 很慢的解决方案','',50,6,'2013-09-10 02:53:35',1,0,'2013-09-18 05:53:33',1,'rails','note'),(7,'构 造 ruby server','',70,7,'2013-09-10 02:55:07',1,0,'2013-09-18 05:51:58',1,'rails, server','blog'),(12,'多继承 与 Mixin','',80,12,'2013-09-10 08:38:38',1,0,'2013-09-18 05:49:40',1,'ruby','blog'),(15,'ActiveSupport::Concern源码分析','',60,15,'2013-09-15 13:07:21',1,0,'2013-09-27 03:24:31',1,'ruby','blog'),(17,'ActiveSupport::Callback源码分析','',60,17,'2013-09-19 14:45:10',1,0,'2013-09-19 15:48:27',1,'ruby','blog'),(18,'深入理解Ruby ORM初始化object','',60,18,'2013-09-21 06:16:13',1,1,'2013-09-22 12:37:43',1,'ruby','blog'),(22,'rails 4整体预览','',30,22,'2013-09-30 07:12:17',1,0,'2013-09-30 07:12:47',1,'rails','note'),(23,'ruby 法术手册','',10,23,'2013-10-10 11:59:14',1,0,'2013-10-11 02:49:21',1,'ruby','blog'),(24,'ruby 元编程第四章读书笔记','',10,24,'2013-10-13 07:32:21',1,0,'2013-10-14 14:17:01',1,'ruby','note'),(26,'MongoDB The Definitive Guide 读书笔记 第九章','',0,26,'2013-10-15 05:50:52',1,0,'2013-10-15 05:51:41',1,'','note');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('11'),('12'),('13'),('14'),('15'),('16'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `context` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (2,2,2,'Blog',NULL,NULL,'tags','2013-09-10 02:44:00'),(6,6,4,'Blog',NULL,NULL,'tags','2013-09-10 02:48:55'),(7,7,5,'Blog',NULL,NULL,'tags','2013-09-10 02:50:11'),(8,8,6,'Blog',NULL,NULL,'tags','2013-09-10 02:53:35'),(9,8,7,'Blog',NULL,NULL,'tags','2013-09-10 02:55:07'),(10,9,7,'Blog',NULL,NULL,'tags','2013-09-10 02:55:07'),(11,10,12,'Blog',NULL,NULL,'tags','2013-09-10 08:38:38'),(14,10,15,'Blog',NULL,NULL,'tags','2013-09-15 14:06:51'),(15,10,17,'Blog',NULL,NULL,'tags','2013-09-19 14:45:10'),(16,10,18,'Blog',NULL,NULL,'tags','2013-09-21 06:16:13'),(19,8,22,'Blog',NULL,NULL,'tags','2013-09-30 07:12:17'),(20,10,23,'Blog',NULL,NULL,'tags','2013-10-10 11:59:14'),(21,10,24,'Blog',NULL,NULL,'tags','2013-10-13 07:32:21');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (2,'rails   gem'),(6,'mysql'),(7,'linux vpn'),(8,'rails'),(9,'server'),(10,'ruby');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-15 15:04:01
