#encoding: utf-8
module PageCell
  class Compiler < Temple::Filter
    def initialize(options = {})
      @options = options
    end

    def call(exp)
      [:multi,
        [:code, "_pcdict=PageCell::Wrapper.new(self)"],
        super]
    end

    def on_pagecell_dynamic(name)
      [:dynamic, "_pcdict[#{name.to_s.inspect}]"]
    end

    def on_pagecell_render(args,n='')
      t = args.to_s.strip.split(/\s/)
      name = t.shift
      args = t.join(' ')
      [:dynamic, "PageCell::View.render_cell(_pcdict,#{name.to_s.inspect},#{args.inspect})"]
    end

    def on_pagecell_static(text)
      [:static, text]
    end

    def on_pagecell_code(tag,args)
      #TODO
      [:static,'not support']
    end
    #def on_pagecell_comment(comment)
    #[:text, text]
    #end
  end
end
