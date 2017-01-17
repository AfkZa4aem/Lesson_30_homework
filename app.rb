#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database,  "sqlite3:blog.db"

class Post < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

get '/' do
	# get posts from db
	
	erb :index			
end

get '/new' do
	
	erb :new
end
