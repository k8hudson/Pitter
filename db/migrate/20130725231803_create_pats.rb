class CreatePats < ActiveRecord::Migration
  def change
    create_table :pats do |t|
      t.text :content
      t.references :user, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
