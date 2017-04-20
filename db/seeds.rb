class Budget < ActiveRecord::Base
list = [
    "30" , "50" , "70" , "100", "150" , "200" , "300"
  ]

  list.each do |scale|
    Budget.create( scale: scale )
  end
end

class Cuisine < ActiveRecord::Base
list = [
    "Italian" , "Japanese" , "Chinese" , "British", "French" , "American" , "Indian"
  ]

  list.each do |name|
    Cuisine.create( name: name )
  end
end

class District < ActiveRecord::Base
list = [
    "Central" , "Yuen Long" , "Kowloon City" , "Mongkok", "Tsim Sha Tsui"
  ]

  list.each do |name|
    District.create( name: name )
  end
end

class Match < ActiveRecord::Base
list = [
    [ "1", "2", "true", "false", ""  ],
    [ "1", "3", "true", "true", ""  ],
    [ "2", "1", "true", "false", ""  ],
    [ "2", "4", "true", "true", ""  ],
    [ "3", "1", "true", "false", ""  ],
    [ "3", "2", "true", "true", ""  ],
    [ "4", "3", "true", "false", ""  ]
  ]

  list.each do |user1_id, user2_id, user1_like, user2_like, restaurant_id|
    Match.create( user1_id: user1_id , user2_id: user2_id , user1_like: user1_like, user2_like: user2_like, restaurant_id: restaurant_id )
  end
end

class Restaurant < ActiveRecord::Base
list = [
["      Maison Libanaise"," 60 WYNDHAM STREET","1234578","1","5","2","http://www.sassyhongkong.com/wp-content/uploads/2016/04/maison-libanaise-hk.jpg"],
["      CAPTAIN RESTAURANT"," 1 TIN WU ROAD","1234568","5","1","1","http://www.singapore-tourist-info.com/petes-place-italian-restaurant.jpg"],
["      McDonalds Restaurant"," 1-11 YUEN LONG ON LOK ROAD","1234570","5","6","3","https://www.mcdonalds.com/content/dam/usa/nutrition/items/evm/mcdonalds-Premium-Crispy-Chicken-Classic-Extra-Value-Meals.png"],
["      Hak-Ka-Hut"," 12-18 TIN YAN ROAD","1234573","5","3","3","https://s3-media2.fl.yelpcdn.com/bphoto/1YrDMpnZEf1Qxp1JQD1zVg/ls.jpg"],
["      Igarashi Japanese Restaurant"," 18 FUNG KAM STREET","1234575","5","2","6","https://www.panpacific.com/content/dam/pp/PP%20Singapore/dining/keyaki-japanese-restaurant/keyaki-japanese-restaurant-01-master.jpg/_jcr_content/renditions/cq5dam.thumbnail.540.296.png"],
["      Samborg Canteen"," 8 YING FUK STREET","1234581","5","8","5","https://s3-media3.fl.yelpcdn.com/bphoto/A8ik_ex7uWeIx5u2ItHQnQ/o.jpg"],
["      ALOY MAK MAK"," 9 FUNG YAU STREET SOUTH","1234585","5","3","4","http://ipick.com/htpic/2bc4440bb0e0c5af9ab3b16bc1db4421/480"],
["      Dining Gusto"," KINGSWOOD RICHLY PLAZA","1234589","5","5","2","https://s3.amazonaws.com/mylocal-media/collection_items/images/000/007/027/original/reservations-1.jpg?1444168895"],
["      CafÈ de Coral"," 1 TIN WU ROAD","1234567","4","3","1","https://upload.wikimedia.org/wikipedia/en/thumb/1/16/Café_de_Coral.svg/1200px-Café_de_Coral.svg.png"],
["      KAHEE JAPANESE RESTAURANT"," 1 TIN WU ROAD","1234569","4","2","2","http://www.cityofdreamsmacau.com/uploads/images/COD/Dining/edo_jap/Edo%20Japanese_cr.jpg"],
["      Das bier"," 10 SAI CHING STREET","1234572","4","9","4","https://cdn0.vox-cdn.com/thumbor/UGMk8tlni5Ury96zRXOiVbz_Gbk=/0x0:960x720/1200x800/filters:focal(0x0:960x720)/cdn0.vox-cdn.com/uploads/chorus_image/image/46786890/dasbiernew.0.0.jpg"],
["      New York Cafe & Bar"," 12-18 TIN YAN ROAD","1234574","4","6","5","https://locals.travel/wp-content/uploads/2014/12/501.jpg"],
["      Side Walk Cafe"," 7 MA WANG ROAD","1234579","4","6","3","https://c2.staticflickr.com/8/7076/7347543614_2251aa5ce8_b.jpg"],
["      Zawa Sushi"," 9 FUNG YAU STREET SOUTH","1234584","4","2","1","https://static1.squarespace.com/static/546b97efe4b0853b7c37ae2d/t/550c666de4b0f1de573af45f/1426876049660/"],
["      TSUI WAH RESTAURANT"," 9 YUEN LUNG STREET","1234586","4","3","5","http://www.chinadailyasia.com/attachement/jpg/site441/20140124/1390530508078_795.jpg"],
["      CAFE DE CORAL"," 1-3 HAU WONG ROAD","1234571","3","3","2","https://upload.wikimedia.org/wikipedia/en/thumb/1/16/Café_de_Coral.svg/1200px-Café_de_Coral.svg.png"],
["      Jenny Black Pepper Pork Bone Pot"," 38 SAN MA TAU STREET","1234576","3","4","7","https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTpEJSmd-NLksJOcafgQSyha1bMQtgzn8AYFVSwOAS7J6THRJA_"],
["      Robatayaki"," 57-59 HAU WONG RD","1234577","3","2","1","http://www.japan-guide.com/g8/2036_08.jpg"],
["      JUNYA JAPANESE RESTAURANT"," 80 SHEUNG SHING STREET","1234582","3","2","6","http://www.designboom.com/wp-content/uploads/2014/09/jean-de-lessard-izakaya-kinoya-restaurant-montreal-designboom-01.jpg"],
["      Dragon Court"," CHING LONG SHOPPING CENTRE","1234588","3","3","7","https://www.skycitydarwin.com.au/media/519382/Dragon_Court_400x800_Webtile_2014.jpg?maxwidth=800"],
["      K F C"," NO. 60 CHUNG HAU STREET","1234597","3","6","1","https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTW3MWOfkGR_Oq4XGjzPE3ZoJdpVOnGUQ_cypzAUIw3rRpFa9W5sg"],
["      THAI GOOD FOOD"," OI MAN SHOPPING CENTRE","1234598","3","8","2","https://www.englishintaiwan.com/images/directory/thai-hang-thai-cuisine-thai-restaurant-mingcheng-road.jpg"],
["      Fairwood Fast Food"," WHAMPOA GARDEN","1234606","3","3","6","https://static6.orstatic.com/userphoto/doorphoto/0/QT/005APT7650EEEC50A469B7lv.jpg"],
["      KING CLUB"," WHAMPOA GARDEN","1234607","3","5","7","https://s-media-cache-ak0.pinimg.com/originals/1f/32/b1/1f32b118aaafc6344a749b56b8454e59.jpg"],
["      DRAGON DELICIOUS"," WHAMPOA GOURMET PLACE","1234608","3","2","7","https://i.ytimg.com/vi/L1THvfX5LTM/maxresdefault.jpg"],
["      Gin Curry"," WHAMPOA GOURMET PLACE","1234610","3","7","1","https://media.stumpblog.com/2016/11/restaurant-reviews-gulletstuffers-page-5-about-carom_contemporary-indian-restaurant-decor_home-decor_home-decor-liquidators-stores-blog-decorators-rugs-nicole-miller-owl-wholesale-fetco-1.jpg"],
["      LIN CHUN HING RESTAURANT"," WHAMPOA GOURMET PLACE","1234611","3","3","1","https://s3-media3.fl.yelpcdn.com/bphoto/nboo4zkVsxhmM7gWTksLVQ/348s.jpg"],
["      PAVIA"," WHAMPOA GOURMET PLACE","1234612","3","7","2","https://tomostyle.files.wordpress.com/2010/02/img_4306.jpg"],
["      Star Seafood Restaurant"," KINGSWOOD RICHLY PLAZA","1234590","2","3","1","http://www.ilovehongkong.hk/sites/www.ilovehongkong.hk/files/business/image_promo/8c8ef65d080b312ff51d76d0f1445d88_xl.jpg"],
["      PATTAYA THAI HOUSE"," KINGSWOOD VILLAS","1234591","2","8","3","http://narathai.com.sg/img/media/carousel/AIP_Food_Nara-Thai-Cuisine_2015-06-03_Full-Res_012_web%20slider.jpg"],
["      Funny House Passionate Food Restaurant"," LONG PING SHOPPING CENTRE","1234592","2","1","4","https://s-media-cache-ak0.pinimg.com/originals/76/7e/ac/767eac254b7370e49f56b406f08cb905.jpg"],
["      Sushi Man"," KINGSWOOD VILLAS","1234593","2","2","5","http://campoutkid.com/wp-content/uploads/2011/05/Narita-Japanese-Restaurant.jpg"],
["      summer august"," ONE SKY MALL","1234599","2","9","3","https://2yvxip346v4g11b8zt1rvr1m-wpengine.netdna-ssl.com/wp-content/uploads/2014/06/Restuarant-Text-Message-Marketing.jpg"],
["      Congee House Soup Plus"," TIN CHAK SHOPPING CENTRE","1234600","2","3","3","http://www.pickydiners.com/www/wp-content/uploads/2015/05/IMG_0592.jpg"],
["      McDonalds Restaurant"," TIN SHING SHOPPING CENTRE","1234601","2","6","4","https://www.mcdonalds.com/content/dam/usa/nutrition/items/evm/mcdonalds-Premium-Crispy-Chicken-Classic-Extra-Value-Meals.png"],
["      Shanghai Lao Lao"," TIN SHING SHOPPING CENTRE","1234602","2","3","4","http://www.hinzandkunz.com/wp-content/uploads/2015/04/01_logo.jpg"],
["      GERMAN ROAD"," TIN SHUI SHOPPING CENTRE","1234603","2","9","5","http://photos1.blogger.com/blogger/2034/988/1600/GERMANRESTAURANT%20001.jpg"],
["      Pizza Hut"," TIN SHUI SHOPPING CENTRE","1234604","2","6","6","http://www.pizzahut-tt.com/wp-content/uploads/2013/06/pizza-hut-trinidad-and-tobago-supreme-lovers.png"],
["      Kuen Fat Seafood Restaurant"," TIN YIU PLAZA","1234605","2","3","5","http://www.linkhk.com/ShopPhoto/katxd2/katxd2_208.jpg"],
["      CHALIDA THAI FOOD"," YUEN LONG","1234613","2","8","3","http://www.holiday.phuket.com/images/charm-thai1.jpg"],
["      JIMMYS KITCHEN"," 7 WO ON LANE","1234580","1","4","4","https://faimouioui.files.wordpress.com/2010/07/jimmy.jpg"],
["      Caine Delicious"," 88 QUEENSWAY","1234583","1","5","7","https://s-media-cache-ak0.pinimg.com/originals/1a/ab/ee/1aabee6a3a0f382882135291eac5a62f.jpg"],
["      WAFFLING BEANS LIMITED"," CHEUNG FAI BUILDING","1234587","1","4","6","http://3.bp.blogspot.com/-fSCkebH5wfw/U4NcjbZeUTI/AAAAAAAAFIA/owFvQ2Dwpao/s1600/IMG_6138.JPG"],
["      CHEF MING CHINESE"," NO. 1 LYNDHURST TERRACE","1234594","1","3","2","http://schedule.wttw.com/ulphoto/wttw_1340037292.jpg"],
["      SHORE"," NO. 108 HOLLYWOOD ROAD &amp; NO. 1-17 BRIDGES STREET","1234595","1","4","6","https://media-cdn.tripadvisor.com/media/photo-s/03/d8/60/d8/the-shore-restaurant.jpg"],
["      COVA CAFFE - RISTORANTE"," NO. 168-170 THIRD STREET","1234596","1","5","7","http://i.huffpost.com/gen/4182842/images/o-THAI-FOOD-facebook.jpg"]
  ]

  list.each do |name, address, phone, district_id, cuisine_id, budget_id, image|
    Restaurant.create( name: name, address:address, phone:phone, district_id:district_id, cuisine_id:cuisine_id, budget_id:budget_id, image:image )
  end
end

class User < ActiveRecord::Base
list = [
[ "Angelina", "AJ","40bd001563085fc35165329ea1ff5c5ecbdbbeef", "4", "2", "4" ,"http://2.bp.blogspot.com/-oSwYod57Mq4/T2ouLEwOSRI/AAAAAAAABx8/L7LBVghhOAQ/s1600/AXCR000Z.jpg" ],
["Julie","Joolie"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","1","7","https://pbs.twimg.com/profile_images/524639136724971520/AYTNP1C6.jpeg"],
["Juan","jgarrett0"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","2","6","https://randomuser.me/api/portraits/men/1.jpg"],
["Victor","vbailey9"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","1","5","https://randomuser.me/api/portraits/men/10.jpg"],
["Paul","plong2r"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","1","4","https://randomuser.me/api/portraits/men/100.jpg"],
["Jeffrey","jsimmonsa"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","2","3","https://randomuser.me/api/portraits/men/11.jpg"],
["Arthur","alawsonb"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","3","2","https://randomuser.me/api/portraits/men/12.jpg"],
["Brandon","bstevensc"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","4","1","https://randomuser.me/api/portraits/men/13.jpg"],
["Shawn","sgarzag"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","3","7","https://randomuser.me/api/portraits/men/17.jpg"],
["Jerry","jarnoldh"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","4","6","https://randomuser.me/api/portraits/men/18.jpg"],
["Victor","vhowardi"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","5","5","https://randomuser.me/api/portraits/men/19.jpg"],
["Daniel","dwagnerj"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","1","4","https://randomuser.me/api/portraits/men/20.jpg"],
["Mark","mreedl"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","3","3","https://randomuser.me/api/portraits/men/22.jpg"],
["Fred","ffieldsn"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","5","2","https://randomuser.me/api/portraits/men/24.jpg"],
["Raymond","rnguyenq"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","3","1","https://randomuser.me/api/portraits/men/27.jpg"],
["Carlos","cholmes2"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","4","7","https://randomuser.me/api/portraits/men/3.jpg"],
["Jesse","jfowleru"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","2","6","https://randomuser.me/api/portraits/men/31.jpg"],
["Brian","brichardsx"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","5","5","https://randomuser.me/api/portraits/men/34.jpg"],
["Jonathan","jmendoza10"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","3","4","https://randomuser.me/api/portraits/men/37.jpg"],
["Joe","jpowell12"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","5","3","https://randomuser.me/api/portraits/men/39.jpg"],
["Christopher","chill14"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","2","2","https://randomuser.me/api/portraits/men/41.jpg"],
["Russell","rkim15"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","3","1","https://randomuser.me/api/portraits/men/42.jpg"],
["Phillip","pmedina16"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","4","7","https://randomuser.me/api/portraits/men/43.jpg"],
["Victor","vberry17"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","5","6","https://randomuser.me/api/portraits/men/44.jpg"],
["Gary","gdavis18"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","1","5","https://randomuser.me/api/portraits/men/45.jpg"],
["Ryan","rramirez1a"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","3","4","https://randomuser.me/api/portraits/men/47.jpg"],
["William","wclark4"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","1","3","https://randomuser.me/api/portraits/men/5.jpg"],
["Jimmy","jhoward1i"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","1","2","https://randomuser.me/api/portraits/men/55.jpg"],
["Sean","swashington1j"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","2","1","https://randomuser.me/api/portraits/men/56.jpg"],
["Craig","cgibson1k"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","3","7","https://randomuser.me/api/portraits/men/57.jpg"],
["Jason","jadams1l"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","4","6","https://randomuser.me/api/portraits/men/58.jpg"],
["Billy","bwood1o"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","2","5","https://randomuser.me/api/portraits/men/61.jpg"],
["Roger","rstephens1s"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","1","4","https://randomuser.me/api/portraits/men/65.jpg"],
["Dennis","drose1v"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","4","3","https://randomuser.me/api/portraits/men/68.jpg"],
["Todd","tparker1x"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","1","2","https://randomuser.me/api/portraits/men/70.jpg"],
["Philip","pray22"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","1","1","https://randomuser.me/api/portraits/men/75.jpg"],
["Timothy","tharvey23"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","2","7","https://randomuser.me/api/portraits/men/76.jpg"],
["Jesse","jharris24"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","3","6","https://randomuser.me/api/portraits/men/77.jpg"],
["Jesse","jlynch25"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","4","5","https://randomuser.me/api/portraits/men/78.jpg"],
["Edward","eyoung7"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","4","4","https://randomuser.me/api/portraits/men/8.jpg"],
["Louis","lmurphy27"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","1","3","https://randomuser.me/api/portraits/men/80.jpg"],
["Stephen","smorgan28"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","2","2","https://randomuser.me/api/portraits/men/81.jpg"],
["Joshua","jking2a"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","4","1","https://randomuser.me/api/portraits/men/83.jpg"],
["Joseph","jharris2g"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","5","7","https://randomuser.me/api/portraits/men/89.jpg"],
["Roger","rbowman2i"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","2","6","https://randomuser.me/api/portraits/men/91.jpg"],
["Carl","cadams2l"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","5","5","https://randomuser.me/api/portraits/men/94.jpg"],
["Eric","etorres2m"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","1","4","https://randomuser.me/api/portraits/men/95.jpg"],
["Jose","jharper2o"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","3","3","https://randomuser.me/api/portraits/men/97.jpg"],
["Anthony","aboyd2q"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","5","2","https://randomuser.me/api/portraits/men/99.jpg"],
["Patricia","pwebbd"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","5","1","https://randomuser.me/api/portraits/women/14.jpg"],
["Frances","flittlee"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","1","7","https://randomuser.me/api/portraits/women/15.jpg"],
["Alice","ahowellf"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","2","6","https://randomuser.me/api/portraits/women/16.jpg"],
["Theresa","tsanchez1"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","3","5","https://randomuser.me/api/portraits/women/2.jpg"],
["Marilyn","mhendersonk"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","2","4","https://randomuser.me/api/portraits/women/21.jpg"],
["Alice","adanielsm"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","4","3","https://randomuser.me/api/portraits/women/23.jpg"],
["Christina","cmorriso"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","1","2","https://randomuser.me/api/portraits/women/25.jpg"],
["Susan","staylorp"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","2","1","https://randomuser.me/api/portraits/women/26.jpg"],
["Cynthia","cwarrenr"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","4","7","https://randomuser.me/api/portraits/women/28.jpg"],
["Laura","lschmidts"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","5","6","https://randomuser.me/api/portraits/women/29.jpg"],
["Evelyn","efreemant"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","1","5","https://randomuser.me/api/portraits/women/30.jpg"],
["Jean","jmitchellv"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","3","4","https://randomuser.me/api/portraits/women/32.jpg"],
["Denise","dclarkw"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","4","3","https://randomuser.me/api/portraits/women/33.jpg"],
["Kelly","kharty"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","1","2","https://randomuser.me/api/portraits/women/35.jpg"],
["Janice","jmcdonaldz"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","2","1","https://randomuser.me/api/portraits/women/36.jpg"],
["Paula","pharper11"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","4","7","https://randomuser.me/api/portraits/women/38.jpg"],
["Maria","msims3"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","5","6","https://randomuser.me/api/portraits/women/4.jpg"],
["Judith","jcollins13"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","1","5","https://randomuser.me/api/portraits/women/40.jpg"],
["Christine","csmith19"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","2","4","https://randomuser.me/api/portraits/women/46.jpg"],
["Lori","lbutler1b"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","4","3","https://randomuser.me/api/portraits/women/48.jpg"],
["Carolyn","ckelley1c"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","5","2","https://randomuser.me/api/portraits/women/49.jpg"],
["Irene","ibutler1d"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","1","1","https://randomuser.me/api/portraits/women/50.jpg"],
["Denise","dwatson1e"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","2","7","https://randomuser.me/api/portraits/women/51.jpg"],
["Kelly","khicks1f"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","3","6","https://randomuser.me/api/portraits/women/52.jpg"],
["Lois","lsimmons1g"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","4","5","https://randomuser.me/api/portraits/women/53.jpg"],
["Joyce","jhall1h"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","5","4","https://randomuser.me/api/portraits/women/54.jpg"],
["Joan","jhart1m"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","5","3","https://randomuser.me/api/portraits/women/59.jpg"],
["Barbara","bking5"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","2","2","https://randomuser.me/api/portraits/women/6.jpg"],
["Gloria","gramos1n"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","1","1","https://randomuser.me/api/portraits/women/60.jpg"],
["Katherine","kbaker1p"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","3","7","https://randomuser.me/api/portraits/women/62.jpg"],
["Jean","jmoore1q"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","4","6","https://randomuser.me/api/portraits/women/63.jpg"],
["Barbara","bdiaz1r"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","5","5","https://randomuser.me/api/portraits/women/64.jpg"],
["Lori","lwilliams1t"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","2","4","https://randomuser.me/api/portraits/women/66.jpg"],
["Judy","jsimmons1u"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","4","3","3","https://randomuser.me/api/portraits/women/67.jpg"],
["Norma","nholmes1w"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","5","2","https://randomuser.me/api/portraits/women/69.jpg"],
["Sandra","smontgomery6"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","3","1","https://randomuser.me/api/portraits/women/7.jpg"],
["Julia","jpeters1y"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","2","7","https://randomuser.me/api/portraits/women/71.jpg"],
["Katherine","kwagner1z"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","3","6","https://randomuser.me/api/portraits/women/72.jpg"],
["Linda","lwalker20"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","4","5","https://randomuser.me/api/portraits/women/73.jpg"],
["Dorothy","dwhite21"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","5","4","https://randomuser.me/api/portraits/women/74.jpg"],
["Cheryl","cstevens26"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","5","3","https://randomuser.me/api/portraits/women/79.jpg"],
["Evelyn","egeorge29"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","3","2","https://randomuser.me/api/portraits/women/82.jpg"],
["Brenda","btaylor2b"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","5","1","https://randomuser.me/api/portraits/women/84.jpg"],
["Annie","aruiz2c"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","1","7","https://randomuser.me/api/portraits/women/85.jpg"],
["Melissa","mcole2d"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","7","2","6","https://randomuser.me/api/portraits/women/86.jpg"],
["Patricia","pmoore2e"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","8","3","5","https://randomuser.me/api/portraits/women/87.jpg"],
["Doris","dhamilton2f"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","4","4","https://randomuser.me/api/portraits/women/88.jpg"],
["Beverly","bcooper8"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","2","5","3","https://randomuser.me/api/portraits/women/9.jpg"],
["Doris","dnichols2h"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","1","2","https://randomuser.me/api/portraits/women/90.jpg"],
["Rose","rcoleman2j"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","5","3","1","https://randomuser.me/api/portraits/women/92.jpg"],
["Deborah","dmiller2k"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","6","4","7","https://randomuser.me/api/portraits/women/93.jpg"],
["Beverly","brobertson2n"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","1","2","6","https://randomuser.me/api/portraits/women/96.jpg"],
["Judith","joliver2p"," 40bd001563085fc35165329ea1ff5c5ecbdbbeef","3","4","5","https://randomuser.me/api/portraits/women/98.jpg"]
]

  list.each do |name, username, password, cuisine_id, district_id, budget_id, image|
    User.create( name: name, username:username, password:password, cuisine_id:cuisine_id, district_id:district_id, budget_id:budget_id, image:image )
  end
end
