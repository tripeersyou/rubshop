class CreatePostings < ActiveRecord::Migration[5.2]
  def change
    create_table :postings do |t|
      t.string :title
      t.string :type
      t.references :supplier, foreign_key: true
      t.integer :reserve_count
      t.decimal :amount

      t.timestamps
    end
  end
end
