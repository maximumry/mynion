class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :opinion, foreign_key: true
      t.timestamps
    end
  end
end