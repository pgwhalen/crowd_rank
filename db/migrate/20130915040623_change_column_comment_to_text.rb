class ChangeColumnCommentToText < ActiveRecord::Migration
  def change
  	change_column :ranks, :comment, :text, :limit => nil
  end
end
