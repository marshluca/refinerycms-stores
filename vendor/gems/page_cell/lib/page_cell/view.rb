require 'cell/rails'
module PageCell
  class View

    def self.parse_for_tag(dict, tag, args='')
      "#{tag} #{args.inspect}"
    end

    def self.render_cell(dict,name, args = '')
      #"render <#{name}>"
      name, state = name.to_s.strip.split("#")
      puts "aaaaaaaaaaaaaaaaaaa"
      p name,state,dict['controller']
      p dict['controller'].value.class
      p dict['controller'].value.class.ancestors

      ::Cell::Rails.render_cell_for(name, state.to_sym, dict['controller'].value)#, *args, &block)
    end
  end
end
