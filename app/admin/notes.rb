ActiveAdmin.register Note do
  scope :all, default: true
  permit_params :title, :description, :important, :tag_list, :created_by_id

  filter :title
  filter :important
  filter :user, collection: proc { User.all.map { |c| [c.email, c.id] } }

  # Customize columns displayed on the index screen in the table
  index do
    column :title
    column :description
    column :important
    column :tag_list
    actions
  end

  show do
    panel 'Note Details' do
      attributes_table_for note do
        row :id
        row :title
        row :description
        row :user
        row 'Tags' do
          note.tags.each do |tag|
            a tag, href: admin_note_path(q: { tagged_with_contains: tag })
            text_node '&nbsp;'.html_safe
          end
        end
      end
    end
  end


  # form title: 'A custom title' do |f|
  #   inputs 'Details' do
  #     input :title
  #     input :user
  #     input :description
  #
  #     li "Created at #{f.object.created_at}" unless f.object.new_record?
  #   end
  #   panel 'Markup' do
  #     "The following can be used in the content below..."
  #   end
  #
  #   para "Press cancel to return to the list without saving."
  #   actions
  # end

end
