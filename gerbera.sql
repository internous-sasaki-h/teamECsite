set names utf8;
set foreign_key_checks=0;

drop database if exists gerbera;
create database if not exists gerbera;

use gerbera;

drop table if exists user_info;
create table user_info(
id int primary key not null auto_increment  /*ID*/,
user_id varchar(16) unique not null  /*ユーザーID*/,
password varchar(16) not null  /*パスワード*/,
family_name varchar(32) not null  /*姓*/,
first_name varchar(32) not null  /*名*/,
family_name_kana varchar(32) not null  /*姓かな*/,
first_name_kana varchar(32) not null  /*名かな*/,
sex tinyint not null default 0  /*性別 0.男性 1.女性*/,
email varchar(32) not null  /*メールアドレス*/,
status tinyint not null default 0  /*ステータス 0.一般 1.管理者*/,
logined tinyint not null default 0  /*ログインフラグ 0.未ログイン 1.ログイン済*/,
regist_date datetime not null  /*登録日*/,
update_date datetime  /*更新日*/
)
default charset=utf8
/*会員情報テーブル*/
;
insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",1,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",1,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",1,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",1,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",1,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",1,"guest12@gmail.com",0,0,now(),now());

drop table if exists product_info;
create table product_info(
id int primary key not null auto_increment  /*ID*/,
product_id int unique not null  /*商品ID*/,
product_name varchar(100) unique not null  /*商品名*/,
product_name_kana varchar(100) unique not null  /*商品名かな*/,
product_description varchar(255) not null  /*商品詳細*/,
category_id int not null not null  /*カテゴリID*/,
price int  /*価格*/,
image_file_path varchar(100)  /*画像ファイルパス*/,
image_file_name varchar(50)  /*画像ファイル名*/,
release_date datetime not null  /*発売年月*/,
release_company varchar(50)  /*発売会社*/,
status tinyint not null default 0  /*ステータス 0.無効 1.有効*/,
regist_date datetime not null  /*登録日*/,
update_date datetime  /*更新日*/,
foreign key(category_id) references m_category(category_id)
)
default charset=utf8
/*商品情報テーブル*/
;

insert into product_info values
( 1, 1,"スッキリわかる Java入門 第2版","すっきりわかる じゃばにゅうもん だい2はん","Javaの入門書といったらこれ！！ スッキリわかるシリーズのJava入門書第一弾",2,2808,"./images","javaStarted.jpg","2014/08/07 00:00:00","インプレス",0,now(),now()),
( 2, 2,"スッキリわかる Java入門 実践編 第2版","すっきりわかる じゃばにゅうもん じっせんへん だい2はん","スッキリわかる Java入門を読み終えたらこの本に挑戦しよう！ スッキリわかるシリーズのJava入門書第二弾",2,3024,"./images","javaStartedPractice.jpg","2014/09/22 00:00:00","インプレス",0,now(),now()),
( 3, 3,"スッキリわかる サーブレット&JSP入門","すっきりわかる さーぶれっと あんど じぇいえすぴーにゅうもん","サイト作成等に必要なサーブレットやJSPの知識を知りたければ、この本がオススメ！\r\n大人気、スッキリわかるシリーズのサーブレット、JSPの入門書",2,3024,"./images","JSPStarted.jpg","2014/05/07 00:00:00","インプレス",0,now(),now()),
( 4, 4,"スッキリわかる SQL入門 第2版","すっきりわかる えすきゅーえるにゅうもん だい2はん","データベースに触れるなら必須な言語の”SQL”について学べる入門本！\r\n大人気、スッキリわかるシリーズのSQL入門書",2,3024,"./images","SQLStarted.jpg","2018/11/30 00:00:00","インプレス",0,now(),now()),
( 5, 5,"プログラミング入門講座","ぷろぐらみんぐにゅうもんこうざ","なぜ、世界中の成功者はプログラミングの基本を学んでいるのか。その答えと、具体的な学び方が一冊に!\r\nできるだけ効率よく、プログラミングの基本を習得したい人等にオススメです",2,1706,"./images","programming.jpg","2016/09/28 00:00:00","SBクリエイティブ",0,now(),now()),
( 6, 6,"やさしいJava 第6版","やさしいじゃば だい6はん","Javaプログラミングの基礎の一つ一つを丁寧に解説しています。\r\n基本文法からクラス、オブジェクト指向まで、\r\nしっかりと理解できる構成で、無理なく読み進められる書籍です。",2,2018,"./images","easierjava.jpg","2016/08/31 00:00:00","SBクリエイティブ",0,now(),now()),
( 7, 7,"Eclipse3ではじめるJavaフレームワーク入門","いくりぷすすりーで はじめる じゃばふれーむわーくにゅうもん","フレームワーク「Struts」「JSF(JavaServer Faces)」「Hibernate」「Spring」を、Eclipse 3.1を開発環境のベースにして解説する。",2,3024,"./images","struts2.jpg","2008/05/21 00:00:00","秀和システム",0,now(),now()),
( 8, 8,"徹底攻略 Java SE 8 Silver 問題集","てっていこうりゃく じゃば えすいー えいと しるばー もんだいしゅう","Java SE 8認定資格Silver「Java SE 8 Programmer I(試験番号:1Z0-808)」の詳解問題集です。",2,3456,"./images","javasilver.jpg","2016/01/18 00:00:00","インプレス",0,now(),now()),
( 9, 9,"Spring徹底入門","すぷりんぐてっていにゅうもん","Javaによるアプリケーション開発の定番フレームワークである、Spring Framework。\r\nこれからSpring FrameworkによるJava開発を始める方、機能をもっと使いこなしたい方など、業務システム開発に携わるJavaエンジニアにおすすめの一冊です。",2,4320,"./images","spring.jpg","2016/07/21 00:00:00","翔泳社",0,now(),now()),
( 10, 10,"星のかけら","ほしのかけら","それを持っていれば、どんなにキツいことがあっても耐えられるというお守り「星のかけら」。ウワサでは、誰かが亡くなった交通事故現場に落ちているらしい。いじめにあっている小学六年生のユウキは、星のかけらを探しにいった夜、不思議な女の子、フミちゃんに出会う――。生きるって、死ぬって、一体どういうこと? 命の意味に触れ、少しずつおとなに近づいていく少年たちの物語。",3,496,"./images","hoshinokakera.jpg","2013/06/26 00:00:00","新潮社",0,now(),now()),
( 11, 11,"星の王子様","ほしのおうじさま","世界中の言葉に訳され、70年以上にわたって読みつがれてきた宝石のような物語。今までで最も愛らしい王子さまを甦らせたと評された。",3,518,"./images","hoshinooujisama.jpg","2006/03/28 00:00:00","新潮社",0,now(),now()),
( 12, 12,"新編 銀河鉄道の夜","しんぺん ぎんがてつどうのよる","貧しい少年ジョバンニが銀河鉄道で美しく哀しい夜空の旅をする表題作等、童話13編戯曲1編。絢爛で多彩な作品世界を味わえる一冊。",3,464,"./images","gingatetsudou.jpg","1989/06/19 00:00:00","新潮社",0,now(),now()),
( 13, 13,"不思議の国のアリス","ふしぎのくにのありす","ある昼下がり、アリスが土手で遊んでいると、チョッキを着た兎が時計を取り出しながら、生け垣の下の穴にぴょんと飛び込んで……一癖もふたくせもある登場人物たちとユーモア溢れる会話で展開される、児童文学の傑作",3,475,"./images","hushigino.jpg","2010/02/25 00:00:00","角川文庫",0,now(),now()),
( 14, 14,"鏡の国のアリス","かがみのくにのありす","ある日、アリスが部屋の鏡を通り抜けると、そこにはおしゃべりする花々やたまごのハンプティ・ダンプティたちが集う不思議な国。そこでアリスは女王を目指すのだが……。大人も楽しめる、永遠の名作童話決定版!",3,475,"./images","kagamino.jpg","2010/02/25 00:00:00","角川文庫",0,now(),now()),
( 15, 15,"羅生門・鼻","らしょうもん・はな","ワルに生きるか、飢え死にするか、ニキビ面の若者は考えた……。 京の都が、天災や飢饉でさびれすさんでいた頃の話。荒れはてた羅生門に運びこまれた死人の髪の毛を、一本一本とひきぬいている老婆を目撃した男が、生きのびる道を見つける『羅生門』。あごの下までぶらさがる、見苦しいほど立派な鼻をもつ僧侶が、何とか短くしようと悪戦苦闘する『鼻』。",3,400,"./images","rashoumon.jpg","2003/05/22 00:00:00","新潮社",0,now(),now()),
( 16, 16,"坊っちゃん","ぼっちゃん","物理学校を卒業後ただちに四国の中学に数学教師として赴任した直情径行の青年 ”坊っちゃん”が 、周囲の愚劣、無気力などに反撥し、職をなげうって東京に帰る。主人公の反俗精神に貫かれた奔放な行動は、滑稽と人情の巧みな交錯となって、漱石の作品中最も広く愛読されている。",3,309,"./images","bocchan.jpg","2003/04/04 00:00:00","新潮社",0,now(),now()),
( 17, 17,"人間失格","にんげんしっかく","生への意志を失い、廃人同様に生きる男が綴る手記を通して、自らの生涯の終りに臨んで、著者が内的真実のすべてを投げ出した傑作告白体小説。",3,450,"./images","ningen.jpg","2006/05/1 00:00:00","新潮社",0,now(),now()),
( 18, 18,"お伽草紙","おとぎぞうし","困難な戦争期にあって、深く芸術世界に沈潜することで時代への抵抗の姿勢を堅持し、日本文学の伝統を支えぬいた太宰中期の作品から、古典や民話に取材したものを収める。”カチカチ山”など誰もが知っている昔話のユーモラスな口調を生かしながら、人間宿命の深淵をかいま見させた「お伽草紙」、西鶴に題材を借り、現世に生きる人間の裸の姿を鋭くとらえた「新釈諸国噺」ほか3編。",3,409,"./images","otogi.jpg","2009/09/04 00:00:00","新潮社",0,now(),now()),
( 19, 19,"角川まんが学習シリーズ 日本の歴史 全15巻セット","かどかわまんががくしゅうしりーず にほんのれきし ぜん15かんせっと","「歴史の流れをつかむ」という考え方にもとづいた「東大流」にて構成された、まったく新しい学習まんがの進化形",4,16416,"./images","nihon.jpg","2018/02/15 00:00:00","KADOKAWA",0,now(),now()),
( 20, 20,"ドラえもん 全45巻セット","どらえもん ぜん45かんせっと","こんなこといいな できたらいいな\r\nあんなゆめ こんなゆめ いっぱいあるけど\r\nみんなみんなみんな かなえてくれる\r\nふしぎなポッケで かなえてくれる\r\nでおなじみ",4,20835,"./images","doraemon.jpg","2008/02/15 00:00:00","小学館",0,now(),now()),
( 21, 21,"クレヨンしんちゃん コミック 1-50巻セット","くれよんしんちゃん こみっく 1-50かんせっと","「小中学生と親のテレビ番組に関する意識調査」の「子どもに見せたくない番組」アンケートでは毎年上位にランクインされていた。\r\n否定的な見解が残る一方で、「幼児の本音を表す国民的漫画」などと評される場合もあり、教科書や子育て参考書への掲載、映画の評価も高まっていることもあって、「子供と一緒に見たいアニメ」という再評価もある。",4,28780,"./images","shinchan.jpg","2010/07/16 00:00:00","双葉社",0,now(),now()),
( 22, 22,"寄生獣 新装版 コミック 全10巻完結セット","きせいじゅう しんそうばん こみっく ぜん10かん かんけつせっと","映画化もされた殿堂入り作品。深津絵里、最高。バンプ、最高。",4,15000,"./images","kisei.jpg","2014/10/09 00:00:00","講談社",0,now(),now()),
( 23, 23,"惡の華 コミック 全11巻 完結セット ","あくのはな こみっく ぜん11かん かんけつせっと","体操着を盗んでしまったことから始まる、ヤバイ話。",4,19800,"./images","akunohana.jpg","2014/06/01 00:00:00","講談社",0,now(),now()),
( 24, 24,"北斗の拳 全18巻 完結セット","ほくとのけん ぜん18かん かんけつせっと","お前はもう、、、、、読んでいる",4,14850,"./images","hokuto.jpg","2014/07/19 00:00:00","徳間書店",0,now(),now()),
( 25, 25,"風の谷のナウシカ 全7巻 箱入りセット","かぜのたにのなうしか ぜん7かん はこいりせっと","戦争による科学文明の崩壊後、異形の生態系に覆われた終末世界が舞台。\r\n人と自然の共存を考えさせられる作品。",4,3500,"./images","naushika.jpg","2008/05/06 00:00:00","徳間書店",0,now(),now()),
( 26, 26,"ジョジョの奇妙な冒険 全63巻 完結セット","じょじょのきみょうなぼうけん ぜん63かん かんけつせっと","時を止める相手にあなたはどう戦いますか？",4,26000,"./images","jojo.jpg","2008/08/06 00:00:00","集英社",0,now(),now()),
( 27, 27,"漫画版 世界の歴史 全10巻セット","まんがばん せかいのれきし ぜん10かんせっと","小学生のときに読んだことがあるのでしょうか？\r\nあの懐かしさと感動をもう一度",4,6500,"./images","sekai.jpg","2003/02/06 00:00:00","集英社",0,now(),now())
;

drop table if exists cart_info;
create table cart_info(
id int primary key not null auto_increment  /*ID*/,
user_id varchar(16) not null  /*ユーザーID*/,
temp_user_id varchar(16)  /*仮ユーザーID*/,
product_id int not null  /*商品ID*/,
product_count int not null  /*個数*/,
price int not null  /*金額*/,
regist_date datetime not null  /*登録日*/,
update_date datetime  /*更新日*/
)
default charset=utf8
/*カート情報テーブル*/
;

drop table if exists purchase_history_info;
create table purchase_history_info(
id int primary key not null auto_increment  /*ID*/,
user_id varchar(16) not null  /*ユーザーID*/,
product_id int not null  /*商品ID*/,
product_count int not null  /*個数*/,
price int not null  /*金額*/,
destination_id int not null  /*宛先情報ID*/,
regist_date datetime not null  /*登録日*/,
update_date datetime  /*更新日*/,
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
/*購入履歴情報テーブル*/
;

drop table if exists destination_info;
create table destination_info(
id int primary key not null auto_increment  /*ID*/,
user_id varchar(16) not null  /*ユーザーID*/,
family_name varchar(32) not null  /*姓*/,
first_name varchar(32) not null  /*名*/,
family_name_kana varchar(32) not null  /*姓かな*/,
first_name_kana varchar(32) not null  /*名かな*/,
email varchar(32) not null  /*メールアドレス*/,
tel_number varchar(13) not null  /*電話番号*/,
user_address varchar(50) not null  /*住所*/,
regist_date datetime not null  /*登録日*/,
update_date datetime  /*更新日*/
)
default charset=utf8
/*宛先情報テーブル*/
;
insert into destination_info values
(1,"guest","インターノウス","テストユーザー","いんたーのうす","てすとゆーざー","guest@internous.co.jp","080-1234-5678","東京都千代田区三番町１ー１ ＫＹ三番町ビル１Ｆ",now(),now());

drop table if exists m_category;
create table m_category(
id int primary key not null auto_increment  /*ID*/,
category_id int unique not null  /*カテゴリID*/,
category_name varchar(20) unique not null  /*カテゴリ名*/,
category_description varchar(100)  /*カテゴリ詳細*/,
insert_date datetime not null  /*登録日*/,
update_date datetime  /*更新日*/
)
default charset=utf8
/*カテゴリマスタテーブル*/
;
insert into m_category values
(1,1,"全てのカテゴリー","参考書、小説、漫画全てのカテゴリーが対象となります",now(), null),
(2,2,"参考書","参考書に関するカテゴリーが対象となります",now(),null),
(3,3,"小説","小説に関するカテゴリーが対象となります",now(),null),
(4,4,"漫画","漫画に関するカテゴリーが対象となります",now(),null);