class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :favorite_posts
  has_many :favorited_by, through: :posts, source: :user

  def self.search(search_term)
    where("title ILIKE ?", "%#{search_term}%")
  end

  def self.get_favorite(id)
    favorited = FavoritePost.where(post_id: id)
    if favorited.length > 0
      return true
    else
      return false
    end
  end

end
