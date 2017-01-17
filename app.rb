#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database,  "sqlite3:blog.db"

class Post < ActiveRecord::Base
	validates :content, presence: true
end

class Comment < ActiveRecord::Base
end

get '/' do
	# get posts from db
	@posts = Post.order "created_at DESC"
	erb :index			
end

get '/new' do
	@content = Post.new
	erb :new
end

post '/new' do
	@content = Post.new params[:post]
		if @content.save
			erb :index
		else
			@error = @content.errors.full_messages.first
			erb :new
		end
end