class User < ActiveRecord::Base
  belongs_to(:cuisine)
  belongs_to(:district)
  belongs_to(:budget)
  belongs_to(:timeslot)
  has_many(:message_as_sent_by, :class_name => 'Message', :foreign_key => 'sent_by_id')

  has_many(:match_as_user1, :class_name => 'Match', :foreign_key => 'user1_id')
  has_many(:match_as_user2, :class_name => 'Match', :foreign_key => 'user2_id')
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  CRITERIA = ['cuisine_id', 'district_id', 'budget_id', 'timeslot_id']

  def matchmake()
    result = []
    if self.gender_preference != ""
      users = User
      .where(:gender => self.gender_preference)
      .where.not(id: self.id)
      .where.not(id: self.match_as_user1.map{|match| match.user2_id})
      .shuffle()
    else
      users = User
      .where.not(id: self.id)
      .where.not(id: self.match_as_user1.map{|match| match.user2_id})
      .shuffle()
    end
    filtered_criteria = User.select_criteria_only(self)
    users.each do |user|
      temp_user = User.select_criteria_only(user)
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

  def accept(target)
    scenario = Match.where(:user1 => target,:user2 => self)
    if scenario != []
      scenario.first.update({:user2_like => true})
    elsif scenario == []
      match = Match.create({:user1 => self, :user2 => target, :user1_like => true })
    end
  end

  def bingo()
    result = []
    scenario1 = Match.where(:user1 => self, :user2_like => true )
    scenario2 = Match.where(:user2 => self, :user2_like => true )
    if scenario1 != []
      scenario1.each do |match|
        result.push(match.user2)
      end
    end
    if scenario2 != []
      scenario2.each do |match|
        result.push(match.user1)
      end
    end
    result
  end

  def self.select_criteria_only(user)
    criteria = user.attributes.delete_if{|key,name| not CRITERIA.include?(key)}
    criteria.keep_if{|key,name| name != nil}
    criteria
  end

  def find_match(matched_user)
    result = []
    scenario1 = Match.where(user1: self, user2: matched_user)
    scenario2 = Match.where(user2: self, user1: matched_user)
    if scenario1 != []
      result = scenario1
    elsif scenario2 !=[]
      result = scenario2
    end
    result.first
  end

end


=begin
# help to understand has_many(:match_as_user1, :class_name => 'Match', :foreign_key => 'user1_id')
# http://stackoverflow.com/questions/18154736/has-many-through-with-class-name-and-foreign-key
=end
