class CreateImageTests < ActiveRecord::Migration
  def self.up
    create_table :image_tests do |t|
      t.string :name
      t.text :body
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :image_tests
  end
end
