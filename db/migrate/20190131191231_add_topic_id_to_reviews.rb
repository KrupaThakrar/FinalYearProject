class AddTopicIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :topic_id, :integer
  end
end
