require "rails_helper"

describe "when a user visits the index page" do
  it "they can create a new check in using the new button" do
    visit check_ins_path

    within "button" do
      click_on "New"
    end

    fill_in "Name", with: "Kurstyn"
    fill_in "check_in[role_happiness]", with: 5
    fill_in "check_in[company_happiness]", with: 5
    fill_in "Comment", with: "WOOOOOOOOOOOO"
    fill_in "Emotion", with: "On Brand"

    click_on "Create Check in"

    # expect(CheckIn.last.name).to eq "Kurstyn"
    expect(page).to have_content "Kurstyn"
    expect(page).to have_content "On Brand"
    expect(current_path).to eq check_in_path(CheckIn.last)
    # There's a new check in on the index
    # Should be on the new check in show page
    # Number of checkins increases by one
    # Show page displays info about newly created check in
    # Validations are important too, might need a separate scenario for that
  end

  it "they cannot create a new checkin if missing key data" do
    visit new_check_in_path

    fill_in "Name", with: "Kurstyn"
    fill_in "check_in[role_happiness]", with: 5
    fill_in "check_in[company_happiness]", with: 5
    fill_in "Comment", with: "WOOOOOOOOOOOO"

    expect{ click_on "Create Check in" }.to change(CheckIn, :count).by(0)
    # New check in is not persisted

    expect(page).to have_content "Your check-in didn't save"
    # Flash error message should be on the page

    expect(current_path).to eq "/check_ins"
    # Rerender new

    expect(page.find("#check_in_name").value).to eq "Kurstyn"
    # Previous form data still on page
  end
end