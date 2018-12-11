require 'rails_helper'
require 'pry'

describe Article do
  describe 'vote system' do
    it "add_points to the local and database for an article object" do
      user = User.new({
        :username => 'user'
      })
      user.save
      tester = Article.new({
        :user_id => user.id,
        :link => '/',
        :title => 'title',
        :points => 0
      })
      tester.save
      tester.increment!(:points)
      expect(Article.find(tester.id).points).to eq 1
      expect(tester.points).to eq 1
    end

    it "returns a list of all articles by from most to least points." do
      user = User.new({
        :username => 'user'
      })
      user.save
      tester = Article.new({
        :user_id => user.id,
        :link => '/',
        :title => 'title',
        :points => 0
      })
      tester.save
      tester2 = Article.new({
        :user_id => user.id,
        :link => '/dog',
        :title => 'nope',
        :points => 10
      })
      tester2.save
      expect(Article.order(points: :desc)).to eq([tester2, tester])
    end
  end
end
