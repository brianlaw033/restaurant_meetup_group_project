class CreateExtraTables < ActiveRecord::Migration
  def change
    create_table(:logistics) do |t|
      t.column(:match_id, :integer)
      t.column(:user1_choices, :integer, array:true)
      t.column(:user1_choices, :integer, array:true)
      t.timestamps()
    end

    create_table(:messages) do |t|
      t.column(:match_id, :integer)
      t.column(:sent_by, :integer)
      t.column(:message, :string)
      t.column(:read, :boolean)
      t.timestamps()
    end
  end
end
