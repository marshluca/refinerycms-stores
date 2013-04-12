require 'minitest/unit'
require 'page_cell'
MiniTest::Unit.autorun
class CompilerTest < MiniTest::Unit::TestCase
  def test_call
    compiler = PageCell::Compiler.new

   assert_equal compiler.call([:multi,[:pagecell,:dynamic,"aaa"]]), [:multi, [:code, "_pcdict=PageCell::Wrapper.new(self)"], [:multi, [:dynamic, "_pcdict[:aaa]"]]]
   assert_equal compiler.call([:multi,[:pagecell,:static,"aaa"]]), [:multi, [:code, "_pcdict=PageCell::Wrapper.new(self)"], [:multi, [:static, "aaa"]]]
   assert_equal compiler.call([:multi,[:pagecell,:code,"aaa", "bbb as aa"]]), [:multi, [:code, "_pcdict=PageCell::Wrapper.new(self)"], [:multi, [:static, "not support"]]]
   assert_equal compiler.call([:multi,[:pagecell,:render, "aaa bbb as aa"]]),[:multi, [:code, "_pcdict=PageCell::Wrapper.new(self)"], [:multi, [:dynamic, 'PageCell::View.render_cell(_pcdict,:aaa,"bbb as aa")']]]
  end
end
