require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

  has n, :tags, :through => Resource
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Tag
	include DataMapper::Resource

	property :id, Serial
	property :name, String

	has n, :links, :through => Resource
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/tags_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

link = Link.create(title: 'google', url: 'google.com')
tag = Tag.create(name: )
