#encoding: utf-8

require 'sass'
require 'redcarpet'

layout 'layout.html.slim'

before /.*html\.markdown/ do
  @post = true
end