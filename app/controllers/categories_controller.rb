class CategoriesController < ApplicationController
  #before_action :get_categories, :only =>[:new, :edit, :create, :update]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
    @title = 'index'
  end

  # GET /categories/1
  def show
    @title = 'Show Category'
    @recipes = @category.recipes
  end

  # GET /categories/new
  def new
    @category = Category.new
    @title = 'New Category'
  end

  # GET /categories/1/edit
  def edit
  @title = 'Edit Category'

  end

  # POST /recipes
  # POST /recipes.json
  def create
    @category = Category.new(category_params)
    @title = 'Create Category'

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
  @title = 'Update Category'
  
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    @title = 'Delete Category'
    
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
