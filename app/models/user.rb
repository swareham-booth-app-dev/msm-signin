# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "user_id" })

  def has_bookmarked_movie(movie_id)
    self.bookmarks.each do |bookmark|
       if movie_id == bookmark.movie.id
        return true
       end
    end
  return false
  end

  def get_first_bookmark(movie_id)
    self.bookmarks.each do |bookmark|
       if movie_id == bookmark.movie.id
        return bookmark
       end
    end
  return nil
  end
end
