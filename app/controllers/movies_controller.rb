class MoviesController < ApplicationController 
  def index 
    @movies = Movie.all
    @movies = @movies.where('title LIKE ?', "%#{params[:title_query]}%") if params[:title_query]
    @movies = @movies.where('director LIKE ?', "%#{params[:director_query]}%") if params[:director_query]
    duration = case params[:runtime]
               when 'less than 90' 
                 'runtime_in_minutes < 90' 
               when 'between 90 & 120'
                 'runtime_in_minutes > 90 AND runtime_in_minutes < 120' 
               when 'greater than 120'
                 'runtime_in_minutes > 120' 
               else
                 nil
               end
    binding.pry
    @movies = @movies.where(duration) if duration
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
