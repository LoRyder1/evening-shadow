class ArticlesController < ApplicationController
	before_filter :redirect_if_not_logged_in

	def index
		@articles = current_user.articles		
	end

	def show
		@article = Article.find(params[:id])		
	end

	def new
		@article = Article.new		
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = current_user.articles.new(article_params)
		if @article.save
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path		
	end

	private
	def article_params
		params.require(:article).permit(:title,:text)
	end

	def redirect_if_not_logged_in
		redirect_to root_path unless logged_in?
	end

end
