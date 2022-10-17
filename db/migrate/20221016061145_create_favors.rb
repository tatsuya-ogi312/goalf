class CreateFavors < ActiveRecord::Migration[6.0]
  def change
    create_table :favors do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
