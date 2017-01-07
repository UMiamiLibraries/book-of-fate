class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :number
      t.string :question
      t.boolean :locked

      t.timestamps
    end
  end
end
