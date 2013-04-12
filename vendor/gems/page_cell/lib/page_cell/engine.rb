#encoding: utf-8
module PageCell
  class Engine < Temple::Engine
    use PageCell::Parser
    use PageCell::Compiler
    filter :ControlFlow
    filter :Escapable, :use_html_safe
    filter :MultiFlattener
    filter :DynamicInliner
    generator :ArrayBuffer
  end
end
