class ModifyCriteria < ActiveRecord::Migration[5.0]
  def change
    remove_column(:timeslots, :time)
    add_column(:timeslots, :time, :string)
  end
end
