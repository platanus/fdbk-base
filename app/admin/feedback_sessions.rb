ActiveAdmin.register FeedbackSession do
  permit_params :id, :provider_id, :receiver_id

  index do
    selectable_column
    id_column
    column :provider
    column :receiver
    actions
  end

  filter :provider
  filter :receiver

  show do
    attributes_table do
      row :id
      row :provider
      row :receiver

      panel "Comments" do
        table_for feedback_session.comments do
          column :id
          column :body
          column :created_at
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :provider
      f.input :receiver
    end

    f.inputs "Comments" do
      f.has_many :comments, allow_destroy: true, new_record: true do |c|
        c.input :body
      end
    end

    f.actions
  end
end
