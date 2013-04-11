#encoding: utf-8

module PageCell
  class Parser < Temple::Parser
    WHITE_SPACE = /(?:&#160;|&nbsp;|\s)*/
    CODE        = /^#{TAG_START}#{WHITE_SPACE}(\w+)#{WHITE_SPACE}(.*)?#{WHITE_SPACE}#{TAG_END}$/om
    COMMENT     = /^#{TAG_START}#{WHITE_SPACE}#(.*?)#{WHITE_SPACE}#{TAG_END}$/om
    DYNAMIC     = /^#{DYNAMIC_START}#{WHITE_SPACE}(.*?)#{WHITE_SPACE}#{DYNAMIC_END}$/om
    #class SyntaxError < StandardError
      #def initialize(message, position)
        #@message = message
        #@lineno, @column, @line = position
        #@stripped_line = @line.strip
        #@stripped_column = @column - (@line.size - @line.lstrip.size)
      #end

      #def to_s
        #<<-EOF
##{@message}
  #Line #{@lineno}
    ##{@stripped_line}
    ##{' ' * @stripped_column}^
#EOF
      #end
    #end


    def call(template)
      parse(template)
    end

    def parse(template)
      tokens = tokenize(template)
      return [] if tokens.empty?
      sexps = [:multi]
      while token = tokens.shift
        case token
        when  COMMENT
          #nothing
          #sexps << [:pagecell,:comment,$1]
        when  CODE
          case $1.downcase.to_s.strip 
          when 'render'
            sexps << [:pagecell,:render,$2.to_s.strip]
          else
            sexps << [:pagecell,:code,$1.to_s.strip,$2.to_s.strip]
          end
        when DYNAMIC
          sexps << [:pagecell,:dynamic,$1.to_s.strip]
        else
          sexps << [:pagecell,:static,token]
        end
      end
      sexps
    end

    private
    def tokenize(source)
      source = source.source if source.respond_to?(:source)
      return [] if source.to_s.empty?
      source.to_s.strip.split(TEMPLATE_PARSER)
    end
  end
end

