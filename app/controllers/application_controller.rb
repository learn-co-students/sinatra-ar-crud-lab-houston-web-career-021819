
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/articles/new' do   # from create
    erb :new
  end

  get '/articles/:id/edit' do #from update
    @article = Article.find(params[:id])
    erb :edit
  end

  # Read
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end



  # Create
  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
    erb :index
  end

 

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end


  #DELETE

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    redirect '/articles'
  end
  
end
