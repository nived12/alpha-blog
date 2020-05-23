class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find_by( id: params[:id] )
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params_permitted)
        if @article.save
            flash[:notice] = "Article was successfully created."
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
        @article = Article.find_by(id: params[:id])
    end

    def update
        @article = Article.find_by(id: params[:id])
        if @article.update(params_permitted)
            flash[:notice] = "Article was updated created."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        # @article = Article.find_by(id: params[:id]).destroy
    end

    private
    
    def params_permitted
        params.require(:article).permit(:title, :description)
    end

end
