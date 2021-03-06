class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true
  belongs_to :user

  def create_review(params, user)
     self.reviews.create(options = {:thoughts => params[:thoughts], :rating => params[:rating], :user => user} )
  end  

  def average_rating
    return 'N/A' if reviews.none?
    reviews.inject(0) {|memo, review| memo + review.rating} / reviews.count
    # reviews.average(:rating)
  end  

end
