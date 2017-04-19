class User < ActiveRecord::Base
  belongs_to(:cuisine)
  belongs_to(:district)
  belongs_to(:budget)
  has_many(:match_as_user1, :class_name => 'Match', :foreign_key => 'user1_id')
  has_many(:match_as_user2, :class_name => 'Match', :foreign_key => 'user2_id')
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end


=begin
# help to understand has_many(:match_as_user1, :class_name => 'Match', :foreign_key => 'user1_id')
# http://stackoverflow.com/questions/18154736/has-many-through-with-class-name-and-foreign-key
=end
