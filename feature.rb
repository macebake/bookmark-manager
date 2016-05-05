require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './app/data_mapper_setup'
require_relative './models/link.rb'
require_relative './models/tag.rb'

link = Link.create(title: 'google', url: 'google.com')
p tag = Tag.create(name: 'bubbles')
