class ChangeNameInPostCommentsFromContentToCommentContent < ActiveRecord::Migration[6.0]
  def change
    rename_column :post_comments, :content, :message
  end
end
