__END__
class CreateStoresProducts < ActiveRecord::Migration

  def up
    create_table :refinery_products do |t|
      t.string :title
      t.text :description
      t.integer :image_id
      t.integer :file_id
      t.integer :position

      t.timestamps
    end

    Refinery::Stores::Product.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-stores"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/stores"})
    end

    drop_table :refinery_products

    Refinery::Stores::Product.drop_translation_table!

  end

end
