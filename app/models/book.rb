class Book < ApplicationRecord

	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	# has_many :follower
	# has_many :followed



	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  	end
  	#引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）
  	#するかどうかを調べる


  def self.looks(searches, words)
  	if searches == "perfect_match"
  		@book = Book.where("title LIKE ?", "#{words}")
  	else
  		@book = Book.where("body LIKE ?", "%#{words}%")
  	end
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
