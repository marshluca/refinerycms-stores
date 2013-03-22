__END__
class CreateStoresCategories < ActiveRecord::Migration

  def up
    create_table :refinery_categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    Refinery::Stores::Category.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-stores"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/stores"})
    end

    drop_table :refinery_categories

    Refinery::Stores::Category.drop_translation_table!

  end

end
