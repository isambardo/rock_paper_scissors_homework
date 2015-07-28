class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.integer :rock_won
      t.integer :rock_lost
      t.integer :rock_tied
      t.integer :paper_won
      t.integer :paper_lost
      t.integer :paper_tied
      t.integer :scissors_won
      t.integer :scissors_lost
      t.integer :scissors_tied

      t.timestamps null: false
    end
  end
end
