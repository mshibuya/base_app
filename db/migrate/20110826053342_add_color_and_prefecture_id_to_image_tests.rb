class AddColorAndPrefectureIdToImageTests < ActiveRecord::Migration
  def self.up
    add_column :image_tests, :color, :string
    add_column :image_tests, :prefecture_id, :integer
  end

  def self.down
    remove_column :image_tests, :prefecture_id
    remove_column :image_tests, :color
  end
end
