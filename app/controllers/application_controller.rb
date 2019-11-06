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
  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end 
  
  ##updates a recipe
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end 
  
  delete '/recipes/:id' do #destroy action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
