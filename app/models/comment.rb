class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  def update_comments_count
    post.increment!(:comments_counter)
  end
end
