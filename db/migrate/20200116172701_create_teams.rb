class CreateTeams < ActiveRecord::Migration
  def change
    create_table :Teams do |t|
      t.string :name
      t.integer :user_id
      t.integer :captian_id
      t.integer :mascot_id
      t.integer :squaddie_1_id
      t.integer :squaddie_2_id
      t.integer :squaddie_3_id
      t.integer :squaddie_4_id
    end
  end
end
