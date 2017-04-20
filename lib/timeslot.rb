class Timeslot < ActiveRecord::Base
  has_many(:users)
end
