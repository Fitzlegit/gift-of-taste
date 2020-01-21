require './config/environment'

#handles recipes routes

class RecipeController < ApplicationController

  get '/recipes/new' do #load creates new recipe
    if logged_in?
      erb :'/recipes/new'
    else
      redirect to '/'
    end
  end

  get '/recipes' do #loads all the recipes
    if logged_in?
      @recipes = Recipe.all.order(id: :asc)
      erb :'/recipes/all'
    else
      redirect to '/'
    end
  end

  get '/recipes/:id' do #loads recipe page
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :'/recipes/show'
    else
      redirect to '/'
    end
  end

  post '/recipes/:id' do #create a recipe
    if logged_in?
      @recipe = Recipe.create(params[:recipe])
      redirect to "/recipes/#{@recipe.id}"
    else
      redirect to '/'
    end
  end

  get '/recipes/:id/edit' do #loads updates recipe
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :'/recipes/edit'
    else
      redirect to '/'
    end
  end

  patch '/recipes/:id' do #edits and updates recipe
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.update(params[:recipe])
      redirect to "/recipes/#{@recipe.id}"
    else
      redirect to '/'
    end
  end

  delete '/recipes/:id' do #destroys recipe
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.delete
      redirect to '/profile'
    else
      redirect to '/'
    end
  end
end
