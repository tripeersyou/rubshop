class CreatePostings < ActiveRecord::Migration[5.2]
  def change
    create_table :postings do |t|
      t.string :item_type
      t.references :supplier, foreign_key: true
      t.integer :reserve_count, default: 0
      t.decimal :amount
      t.text :description
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
