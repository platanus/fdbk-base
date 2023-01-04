class Api::Internal::CommentSerializer < ActiveModel::Serializer
  type :comment

  attributes(
    :id,
    :feedback_session_id,
    :body,
    :created_at,
    :updated_at
  )
end
