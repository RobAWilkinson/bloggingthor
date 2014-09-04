require 'rails_helper'
feature "Enter comments on an article" do
	scenario "enters a new comment on an article" do
		visit '/articles'
		click_link('Article 1')
		within find('.new_comment') do
			fill_in('comment[author_name]', with: 'James Joyce')
			fill_in('comment[body]', with: 'This article sucks')
			click_button 'Create Comment'
		end
		expect(page).to have_content("James Joyce")
	end
end

