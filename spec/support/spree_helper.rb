
module Refinery
  module Testing
    module RequestMacros
      module Authentication

        def login_refinery_superuser
          before(:each) do
            password = '123456'
            refinery_superuser = FactoryGirl.create(:refinery_superuser, {
              :username => "refinerycms",
              :password => password,
              :password_confirmation => password,
              :email => "refinerycms@refinerycms.com"
            })
            refinery_superuser.spree_roles << Spree::Role.find_or_create_by_name('admin')

            visit refinery.new_refinery_user_session_path

            fill_in "Login", :with => refinery_superuser.username
            fill_in "Password", :with => password

            click_button "Sign in"
          end
        end
      end
    end
  end
end

