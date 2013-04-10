#encoding: utf-8
module PageCell
  TAG_START               = /\{\%/
  TAG_END                 = /\%\}/
  DYNAMIC_START          = /\{\{/
  DYNAMIC_END            = /\}\}/
  ANYSTARTINGTAG          = /\{\{|\{\%/
  PARTIAL_TEMPLATE_PARSER = /#{TAG_START}.*?#{TAG_END}|#{DYNAMIC_START}.*?#{DYNAMIC_END}/om
  ANY_STARTING_TAG        = /\{\{|\{\%|\}\}|\%\}/
  TEMPLATE_PARSER         = /(#{PARTIAL_TEMPLATE_PARSER}|#{ANY_STARTING_TAG})/o
end

require 'temple'
require 'page_cell/version'
require 'page_cell/wrapper'
require 'page_cell/view'
require 'page_cell/parser'
require 'page_cell/compiler'
require 'page_cell/engine'
require 'page_cell/template'


