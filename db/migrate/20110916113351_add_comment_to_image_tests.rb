class AddCommentToImageTests < ActiveRecord::Migration
  def self.up
    add_column :image_tests, :comment, :text
  end

  def self.down
    remove_column :image_tests, :comment
  end
end
