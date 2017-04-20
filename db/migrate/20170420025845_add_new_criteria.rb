class AddNewCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table(:timeslots) do |t|
      t.column(:time, :integer)
      t.timestamps()
    end
    add_column(:users, :gender, :string)
  end
end
