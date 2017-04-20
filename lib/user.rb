class User < ActiveRecord::Base
  belongs_to(:cuisine)
  belongs_to(:district)
  belongs_to(:budget)
  belongs_to(:timeslot)

  has_many(:match_as_user1, :class_name => 'Match', :foreign_key => 'user1_id')
  has_many(:match_as_user2, :class_name => 'Match', :foreign_key => 'user2_id')
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  CRITERIA = ['cuisine_id', 'district_id', 'budget_id', 'timeslot_id']

  def matchmake()
    result = []
    if self.gender_preference != ""
      users = User.where(:gender => self.gender_preference).where.not(id: self.id)
    else
      users = User.where.not(id: self.id)
    end
    filtered_criteria = self.attributes.delete_if{|key,name| not CRITERIA.include?(key)}
    filtered_criteria.keep_if{|key,name| name != nil}
    users.each do |user|
      temp_user = user.attributes.delete_if{|key,name| not CRITERIA.include?(key)}
      temp_user.keep_if{|key,name| name != nil}
      temp_me = filtered_criteria.select{|key,name| temp_user[key]}
      temp_user.keep_if{|key,name| filtered_criteria[key]}
      if temp_me == {}
        result.push(user)
      elsif temp_me == temp_user
        result.push(user)
      end
    end
    result
  end

  def user1_accept(user2_id)
    match = Match.create({:user1_id => self.id, :user2_id => user2_id, :user1_like => true })
  end

  def matchmake_invitations()
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
