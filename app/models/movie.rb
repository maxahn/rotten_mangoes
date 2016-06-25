class Movie < ActiveRecord::Base
  scope :by_title, -> title_query {where('title LIKE ?', "%#{title_query}%")}
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, presence: true, numericality: {only_integer: true}
  validates :description, presence: true
  #validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_past

  has_many :reviews

  mount_uploader :image, AvatarUploader  

  def review_average
   reviews.length.zero? ? nil : reviews.sum(:rating_out_of_ten)/reviews.size 
  end
    
  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, 'should be in the past') if release_date > Date.today
    end
  end

  class << self 
    def title_like(title_query)
      where('title LIKE ?', "%#{title_query}%") if title_query  
    end

    def director_like(director_query)
      where('director LIKE ?', "%#{director_query}%") if director_query  
    end

    def duration_is(runtime_query)
      duration = case runtime_query
                 when 'less than 90' 
                   'runtime_in_minutes < 90' 
                 when 'between 90 & 120'
                   'runtime_in_minutes > 90 AND runtime_in_minutes < 120' 
                 when 'greater than 120'
                   'runtime_in_minutes > 120' 
                 else
                   nil
                 end

      @movies = @movies.where(duration) if duration
    end
  end
end
