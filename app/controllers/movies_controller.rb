class MoviesController < ApplicationController 
  def index 
    #@movies = Movie.by_title(params[:title_query]).by_director(params[:director_query]).by_duration(params[:runtime])
    @movies = Movie.all
    @movies = @movies.where("title LIKE ? OR director LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%") if params[:query]
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path 
  end

  protected
  
  def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :poster_image_url, :release_date, :image)
  end
 
end
