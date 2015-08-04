class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

end
