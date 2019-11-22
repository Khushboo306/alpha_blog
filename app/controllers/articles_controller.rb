class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    def index #to list articles route is localhost:3000/article
      @articles=Article.all
    end
    
    def new
     @article=Article.new
    end

    def create
     # render plain: params[:article].inspect
     @article=Article.new(article_params)
     if @article.save
       flash[:notice]="Article was successfully created"
       redirect_to article_path(@article)
     else
       render 'new' # or :new
     end
    end
    
    def show
      
    end
    
   #  Route for editing articles takes the form ->
   #  /articles/:id/edit

    def edit 

    end

    def update
     

      if @article.update(article_params)
         flash[:notice]="Articl was successfully updated"
         redirect_to article_path(@article)
      else
          render 'edit'
      end
    end
    
    def destroy
    
      @article.destroy
      flash[:notice]="Article was deleted"
      redirect_to articles_path
    end

    private
     def set_article
      @article =Article.find(params[:id])
     end
     def article_params
        params.require(:article).permit(:title, :description)
     end
end