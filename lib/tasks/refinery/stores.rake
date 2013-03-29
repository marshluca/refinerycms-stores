namespace :refinery do

  namespace :stores do

    desc "Create admin username and password"
    task :create_administrator => :environment do
      require File.join(File.dirname(__FILE__), '..', '..', '..', 'db', 'default', 'users.rb')
      puts "Done!"
    end
  end

end
