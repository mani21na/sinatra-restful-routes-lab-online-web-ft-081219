class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ##loads index page 
  get '/recipes'
    @recipes = Recipes.all 
    erb :index 
  end

  ##loads new form
  get '/recipes/new' do #loads new form
    erb :new
  end
  
  ##creates a recipe
  post '/recipes' do
    @recipe = Recipe.new(params)
    redirect '/recipes/#{@recipe.id}'
  end
  
  ##loads show page
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  ##loads edit form
  get "/recipes/"
end
