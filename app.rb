#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def init_db
	@db = SQLite3::Database.new 'Blog1.db'
	@db.results_as_hash = true
end


before do
			init_db
end

configure do
	init_db # тк before do не исполняется при конфигурации
	@db.execute'create table if not exists "Posts"
	(
		"id" integer primary key autoincrement,
		"ptitle" text,
		"ptext" text,
		"pdate" date
	)'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/new' do
	erb :new
end

post '/new' do



	posttitle = params[:title]
	posttext = params[:text]

	erb "<h3>Entered posts:</h3> </br> <h4><u>#{posttitle}</u></h4>#{posttext}"
end
