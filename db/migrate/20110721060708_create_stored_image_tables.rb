class CreateStoredImageTables < ActiveRecord::Migration
  def self.up
    
    create_table :stored_images do |t|
      t.string     :name,       :limit => 32
      t.string     :image_type, :limit => 3
      t.integer    :size
      t.integer    :width
      t.integer    :height
      t.integer    :refcount
      t.datetime   :keep_till
      t.binary     :data,       :limit => 16777215
      t.timestamps
    end

    add_index :stored_images, [:name]
    add_index :stored_images, [:keep_till]


  end

  def self.down
    drop_table :stored_images
  end
end
