class AddCommentToFeedbackSession < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :feedback_sessions, :comment, null: true, index: {algorithm: :concurrently}
  end
end
