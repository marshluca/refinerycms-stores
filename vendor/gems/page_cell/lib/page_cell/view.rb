module PageCell
  class View

    def self.parse_for_tag(dict, tag, args='')
      "#{tag} #{args.inspect}"
    end

    def self.render_cell(dict,name, args = '')
      "render <#{name}>"
    end
  end
end
