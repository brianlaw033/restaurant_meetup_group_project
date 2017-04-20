class User < ActiveRecord::Base
  belongs_to(:cuisine)
  belongs_to(:district)
  belongs_to(:budget)
  has_many(:match_as_user1, :class_name => 'Match', :foreign_key => 'user1_id')
  has_many(:match_as_user2, :class_name => 'Match', :foreign_key => 'user2_id')
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  define_method(:matchmake) do
    users = User.all()
    matched_users = []
    users.each do |user|
      if user.district_id == self.district_id && user.cuisine_id == self.cuisine_id && user.budget_id == self.budget_id
        matched_users.push(user) if user.id != self.id
      end
      if user.district_id == self.district_id && user.cuisine_id == self.cuisine_id
        matched_users.push(user) if user.id != self.id
      end
      if user.district_id == self.district_id && user.budget_id == self.budget_id
        matched_users.push(user) if user.id != self.id
      end
      if user.cuisine_id == self.cuisine_id && user.budget_id == self.budget_id
        matched_users.push(user) if user.id != self.id
      end
      if user.district_id == self.district_id
        matched_users.push(user) if user.id != self.id
      end
      if user.cuisine_id == self.cuisine_id
        matched_users.push(user) if user.id != self.id
      end
      if user.budget_id == self.budget_id
        matched_users.push(user) if user.id != self.id
      end
    end

    # have fun bro
    return matched_users
  end

  define_method(:user1_accept) do |user2_id|
    match = Match.create({:user1_id => self.id, :user2_id => user2_id, :user1_like => true })
  end

  define_method(:matchmake_invitations) do
    matches = Match.all()
    invitations = []
    matches.each() do |match|
      if match.user2_id == self.id()
        invitations.push(User.find(match.user1_id()))
      end
    end
    invitations
  end

end


=begin
# help to understand has_many(:match_as_user1, :class_name => 'Match', :foreign_key => 'user1_id')
# http://stackoverflow.com/questions/18154736/has-many-through-with-class-name-and-foreign-key
=end
