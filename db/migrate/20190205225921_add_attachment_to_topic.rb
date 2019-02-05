class AddAttachmentToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :attachment, :string
  end
end
