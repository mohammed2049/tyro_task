class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :company_token
      t.integer :number
      t.integer :priority
      t.references :state

      t.timestamps
    end
    add_index :feedbacks, :company_token
    add_index :feedbacks, [:number, :company_token]
  end
end
