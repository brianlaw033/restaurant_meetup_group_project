class Match < ActiveRecord::Base
  belongs_to(:user1, :class_name => 'User')
  belongs_to(:user2, :class_name => 'User')
  belongs_to(:restaurant)

  def matching_restaurants()
    result = []
    user1_criteria = User.select_criteria_only(self.user1)
    user2_criteria = User.select_criteria_only(self.user2)
    combined_criteria = user1_criteria.merge(user2_criteria)
    restaurants = Restaurant.all()
    restaurants.each do |restaurant|
      restaurant_criteria = User.select_criteria_only(restaurant)
      if restaurant_criteria.include?()
      end
    end

  end

end
