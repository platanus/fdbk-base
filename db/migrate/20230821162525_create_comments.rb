class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :feedback_session_id
      t.text :body

      t.timestamps
    end
  end
end
