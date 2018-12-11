require 'rails_helper'

describe Comment do
  describe 'initialize' do
    it "creates a new instance of a comment, with a user id and an article id." do
      user = User.new({
        :username => 'user'
      })
      user.save
      article = Article.new({
        :user_id => user.id,
        :link => '/',
        :title => 'title',
        :points => 0
      })
      article.save
      comment = Comment.new({
        :user_id => user.id,
        :article_id => article.id,
        :content => 'comment content fills the page'
      })
      expect(comment.save).to eq true
    end
  end
end
