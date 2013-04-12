require 'minitest/unit'
require 'page_cell'
MiniTest::Unit.autorun
class Env
  attr_accessor :name
  def initialize
    @name = 'abc'
  end
end
class PageCellTest < MiniTest::Unit::TestCase
  def setup
    @env = Env.new
  end
  def render(source, options = {}, &block)
    tmpl = PageCell::Template.new(options[:file], options) { source }
    #TODO: just for debugging...will remove later
    #    #puts '*'*40,tmpl.precompiled_template
    tmpl.render(options[:scope] || @env, &block)
  end

  def assert_cell(source,html)
    assert_equal html,render(source)
  end
  def test_call
    #puts PageCell::Template.new([:multi,[:pagecell,:code,"aaa", "bbb as aa"]])
    assert_cell "aaaa", "aaaa"
    assert_cell "aaaa ## {{name}} aa", "aaaa ## abc aa" 
    assert_cell "aaaa ## {%#name%} aa", "aaaa ##  aa" 
    assert_cell "aaaa ## {%#name aa", "aaaa ## {%#name aa" 
    assert_cell 'aaaa #{%if name%} aa', "aaaa #not support aa" 
    assert_cell 'aaaa {%render name%} aa', "aaaa render <name> aa" 
  end
end
