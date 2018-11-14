class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to ("recipes/#{@recipe.id}")
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do    
    @recipe = Recipe.find(params[:id]).delete
    redirect to("/recipes")
  end

end
