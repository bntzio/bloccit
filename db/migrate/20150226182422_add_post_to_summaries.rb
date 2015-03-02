class AddPostToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :post_id, :integer
    add_index :summaries, :post_id
  end
end
