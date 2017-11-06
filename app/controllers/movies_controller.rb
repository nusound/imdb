class MoviesController < ApplicationController
  before_action :find_movie, only:[:show, :edit, :update, :delete]

  def index
    @movies = Movie.all.order('created_at DESC')
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :director)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
