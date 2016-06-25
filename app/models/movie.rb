class Movie < ActiveRecord::Base
  scope :by_title, -> title_query {where('title LIKE ?', "%#{title_query}%")}
  scope :by_director, -> director_query {where('director LIKE ?', "%#{director_query}%")}
  scope :by_duration, -> runtime do
    duration = case runtime  
               when 'less than 90' 
                 'runtime_in_minutes < 90' 
               when 'between 90 & 120'
                 'runtime_in_minutes > 90 AND runtime_in_minutes < 120' 
               when 'greater than 120'
                 'runtime_in_minutes > 120' 
               else
                 nil
               end

    where(duration)
  end
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
end
