
require 'rails_helper'
feature "visit the articles page" do
	scenario "can create a new article" do
		visit '/articles'
		click_link('New Article')
		within find('.new_article') do
			fill_in('Title', with: 'Newly Created Title')
			fill_in('Body', with: 'Article about leaked celbrity nudes')	
			click_button 'Create Article'
		end
		expect(page).to have_content( "Newly Created Title")
	end
	scenario "loads up a bunch of articles" do
		visit "/articles"
		expect(page.find('#1').text).to eq("Article 1")
	end
	scenario "lets user see article title if they click on a link" do
		visit "/articles"
		click_link('Article 1')
		expect(page).to have_content('body1')
	end
	scenario "lets users destroy an article" do
		visit "/articles"
		click_link('Article 1')
		click_link('Delete Article')
		expect(page).to have_no_content('Article 1')
	end
	scenario "lets user edit an article" do
		visit "/articles"
		click_link('Article 1')
		click_link('Edit Article')
		within find('form') do
			fill_in('Title', with: 'Edited Title')
			fill_in('Body', with: 'Edited Body')
			click_button 'Update Article'
		end
		expect(page).to have_content('Edited Title')
	end

end
