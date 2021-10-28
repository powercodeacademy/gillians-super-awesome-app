require "rails_helper"

describe "when a user visits the checkins index page", type: :feature do
  it "they see a list of all the checkins" do
    check_in = create_check_in
    another_check_in = create_another_check_in

    visit check_ins_path

    # expect check in and another check in to be on the page
    expect(page).to have_content "Happy"
    expect(page).to have_content another_check_in.emotion
    expect(page).to have_link(check_in.name, { href: check_in_path(check_in) })
  end

  def create_check_in
    check_in = CheckIn.create!(
      name: "Sebastian",
      emotion: "Happy",
      role_happiness: 4,
      company_happiness: 4
    )
  end

  def create_another_check_in
    check_in = CheckIn.create!(
      emotion: "Sad",
      role_happiness: 1,
      company_happiness: 1
    )
  end
end