class CreateFeedbackSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :feedback_sessions do |t|
      t.references :provider, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.date :session_date

      t.timestamps
    end
  end
end
