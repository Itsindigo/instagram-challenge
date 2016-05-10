class AddCommentEntryToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_entry, :text
  end
end
