class Comment < ApplicationRecord
    belongs_to :feedback_session
end

# == Schema Information
#
# Table name: comments
#
#  id                  :bigint(8)        not null, primary key
#  feedback_session_id :bigint(8)
#  body                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
