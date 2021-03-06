class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
    end
    
    def show 
        @recipe = Recipe.find(params[:id])
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_param)
        @recipe.chef = Chef.find(3)
        if @recipe.save
            flash[:success] = "Your recipe successfully created"
            redirect_to recipes_path
            else
            render :new
        end
        
    end
    
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def update 
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_param)
            flash[:success] = "Your recipe was updated successfully"
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end
    
    private
    
    def recipe_param
        params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
end
