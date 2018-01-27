class CreateReservePostings < ActiveRecord::Migration[5.2]
  def change
    create_table :reserve_postings do |t|
      t.references :posting, foreign_key: true
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
