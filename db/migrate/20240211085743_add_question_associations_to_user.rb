class AddQuestionAssociationsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :asked_to, null: false, foreign_key: { to_table: :users }
    add_reference :questions, :asker, null: false, foreign_key: { to_table: :users }
  end
end
