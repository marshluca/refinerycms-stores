require 'minitest/unit'
require 'page_cell'
MiniTest::Unit.autorun 
class PraserTest < MiniTest::Unit::TestCase
  def test_tokenize
    parser = PageCell::Parser.new
    tokens = parser.send(:tokenize, "")
    assert_equal tokens, []

    tokens = parser.send(:tokenize, "aaaaaaaa")
    assert_equal tokens, ["aaaaaaaa"]

    tokens = parser.send(:tokenize, "aaaa{{aaaa")
    assert_equal tokens, ["aaaa","{{","aaaa"]

    tokens = parser.send(:tokenize, "aaaa{%aaaa")
    assert_equal tokens, ["aaaa","{%","aaaa"]

    tokens = parser.send(:tokenize, "aaaa{{aa}} aa")
    assert_equal tokens, ["aaaa","{{aa}}"," aa"]

    tokens = parser.send(:tokenize, "aaaa{%aa%} %}aa")
    assert_equal tokens, ["aaaa","{%aa%}"," ","%}","aa"]

    tokens = parser.send(:tokenize, "aaaa{%\n\n{%aa%} %}aa")
    assert_equal tokens, ["aaaa","{%\n\n{%aa%}"," ","%}","aa"]
  end

  def test_parse
    parser = PageCell::Parser.new
    sexps = parser.parse("")
    assert_equal sexps,[]

    sexps = parser.parse("aaa")
    assert_equal sexps,[:multi,[:pagecell,:static,"aaa"]]

    sexps = parser.parse("aaaa{{aa}} aa")
    assert_equal sexps,[:multi,[:pagecell,:static,"aaaa"],[:pagecell,:dynamic,'aa'],[:pagecell,:static,' aa']]

    sexps = parser.parse("aaaa{%aa%} aa")
    assert_equal sexps,[:multi,[:pagecell,:static,"aaaa"],[:pagecell,:code,'aa',''],[:pagecell,:static,' aa']]

    sexps = parser.parse("aaaa{%#aa  asdadfasd asdfasd \n\n\n\n\%} aa")
    assert_equal sexps,[:multi,[:pagecell,:static,"aaaa"],[:pagecell,:static,' aa']]

    sexps = parser.parse('aaaa #{%if name%} aa')
    assert_equal sexps,[:multi, [:pagecell, :static, "aaaa #"], [:pagecell, :code, "if", "name"], [:pagecell, :static, " aa"]]
  end
end
