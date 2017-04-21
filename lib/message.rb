class Message < ActiveRecord::Base
  belongs_to(:match)
  belongs_to(:sent_by, :class_name => 'User')


end
