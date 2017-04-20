class AddTimeColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :timeslot_id, :integer)
  end
end
