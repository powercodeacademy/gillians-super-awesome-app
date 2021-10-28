require "rails_helper"

describe "a user when first visiting the app", type: :system do
  it "they can create a new account" do
    visit sign_up_path

    fill_in "Username", with: "professorSteve"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"

    expect { click_on "Sign Up" }.to change(User, :count).by(1)

    expect(page).to have_content "Congrats! You Signed Up!"

    expect(current_path).to eq check_ins_path
  end

  it "they cannot create a new account if passwords dont match" do
    visit sign_up_path

    fill_in "Username", with: "professorSteve"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "notthesamepassword"

    expect { click_on "Sign Up" }.to change(User, :count).by(0)

    expect(page).to have_content "Somethings wrong, try again"

    expect(current_path).to eq "/users"
  end
end