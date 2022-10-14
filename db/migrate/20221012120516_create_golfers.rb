class CreateGolfers < ActiveRecord::Migration[6.0]
  def change
    create_table :golfers do |t|
      t.integer :average_score_id,      null: false
      t.integer :average_putt,          null: false
      t.integer :dominant_hand_id,      null: false
      t.integer :type_id,               null: false
      t.integer :golf_history_id,       null: false
      t.text :feature
      t.text :worries
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
