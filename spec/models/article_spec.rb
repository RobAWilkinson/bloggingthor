require 'rails_helper'

describe Article, :type => :model do
	describe "Can we create an Article" do
		it "can be created" do
			a = Article.create( title: "title1", body: "body1")
			a.save
			expect(Article.find(5)).to eq(a)
		end
	end
end
