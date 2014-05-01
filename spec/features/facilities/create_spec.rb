require 'spec_helper'

describe "Creating Facilities"  do
	it "redirects to the facilities index page on success" do
		visit "/facilities"
		click_link "New Facility"
		expect(page).to have_content("New facility")
	
		fill_in "Title", with: "My Facility"
		fill_in "Description", with: "Description of facility."
		click_button "Create Facility"

		expect(page).to have_content("My Facility")
	end

	it "displays an error when the facility has no title" do
		expect(Facility.count).to eq(0)

		visit "/facilities"
		click_link "New Facility"
		expect(page).to have_content("New facility")
	
		fill_in "Title", with: ""
		fill_in "Description", with: "Description of facility."
		click_button "Create Facility"

		expect(page).to have_content("error")

		expect(Facility.count).to eq(0)

		visit "/facilities"
		expect(page).to_not have_content("Description of facility.")
	end

	it "displays an error when the facility has less than three letters in the title" do
		expect(Facility.count).to eq(0)

		visit "/facilities"
		click_link "New Facility"
		expect(page).to have_content("New facility")
	
		fill_in "Title", with: "Be"
		fill_in "Description", with: "Description of facility."
		click_button "Create Facility"

		expect(page).to have_content("error")

		expect(Facility.count).to eq(0)

		visit "/facilities"
		expect(page).to_not have_content("Description of facility.")
	end
	
	
end