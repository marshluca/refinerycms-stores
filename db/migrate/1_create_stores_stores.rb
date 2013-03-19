class CreateStoresStores < ActiveRecord::Migration

  def up
    create_table :refinery_stores do |t|
      t.string :title
      t.text :description
      t.integer :image_id
      t.integer :file_id
      t.integer :position

      t.timestamps
    end

    Refinery::Stores::Store.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-stores"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/stores/stores"})
    end

    drop_table :refinery_stores

    Refinery::Stores::Store.drop_translation_table!

  end

end
