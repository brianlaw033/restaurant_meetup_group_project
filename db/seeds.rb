class Budget < ActiveRecord::Base
list = [
    "20" , "30" , "40" , "50", "60" , "70" , "80"
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
    "Sai Wan" , "Wan Chai" , "North Point" , "Mongkok", "Tsim Sha Tsui" , "Tseun Wan" , "Sha Tin"
  ]

  list.each do |name|
    District.create( name: name )
  end
end

class Matches < ActiveRecord::Base
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
    Matches.create( user1_id: user1_id , user2_id: user2_id , user1_like: user1_like, user2_like: user2_like, restaurant_id: restaurant_id )
  end
end

class Restaurant < ActiveRecord::Base
list = [
    [ "American Peking", "200 Lockhart Road", "8768765", "2", "3", "5","http://3.bp.blogspot.com/-CL_kkhwcU8s/VVhNy7AfGtI/AAAAAAADFCw/vXVmWS22cCY/s1600/IMG_2718.JPG"],
    [ "McDonalds", "400 Nathan Road", "4", "8643754", "6", "2","http://vignette1.wikia.nocookie.net/ronaldmcdonald/images/0/0a/Original2.jpg/revision/latest?cb=20150519061627" ]
  ]

  list.each do |name, address, phone, district_id, cuisine_id, budget_id, image|
    Restaurant.create( name: name, address:address, phone:phone, district_id:district_id, cuisine_id:cuisine_id, budget_id:budget_id, image:image )
  end
end

class User < ActiveRecord::Base
list = [
    [ "Julie", "Joolie", "40bd001563085fc35165329ea1ff5c5ecbdbbeef", "2", "2", "4","https://pbs.twimg.com/profile_images/524639136724971520/AYTNP1C6.jpeg"],
    [ "Angelina", "AJ","40bd001563085fc35165329ea1ff5c5ecbdbbeef", "4", "2", "4" ,"http://2.bp.blogspot.com/-oSwYod57Mq4/T2ouLEwOSRI/AAAAAAAABx8/L7LBVghhOAQ/s1600/AXCR000Z.jpg" ]
  ]

  list.each do |name, username, password, cuisine_id, district_id, budget_id, image|
    User.create( name: name, username:username, password:password, cuisine_id:cuisine_id, district_id:district_id, budget_id:budget_id, image:image )
  end
end
