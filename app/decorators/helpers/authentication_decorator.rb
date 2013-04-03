Refinery::User.class_eval do
    def create_first
      if valid?
        # first we need to save user
        save
        # add refinery role
        role = Spree::Role.find_or_create_by_name 'admin'
        self.spree_roles << role
        add_role(:refinery)
        # add superuser role if there are no other users
        add_role(:superuser) if ::Refinery::Role[:refinery].users.count == 1
        # add plugins
        self.plugins = Refinery::Plugins.registered.in_menu.names
      end

      # return true/false based on validations
      valid?
    end
end

