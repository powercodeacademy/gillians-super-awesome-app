require "rails_helper"

RSpec.describe CheckInsController, type: :controller do
  describe "GET #show" do
    it "renders the show template", :aggregate_failures do
      create_check_in

      get :show, params: { id: check_in.id }

      expect(response).to render_template(:show)
    end

    it "assigns @check_in to the correct instance" do
      create_check_in

      get :show, params: { id: check_in.id }

      expect(assigns[:check_in]).to eq check_in
    end

    it "the response status is a success" do
      create_check_in

      get :show, params: { id: check_in.id }

      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    describe "with valid attributes" do
      it "successfully create a new record with all params passed" do
        expect { post :create, params: valid_check_in_params }.to change(CheckIn, :count).by(1)

        new_check_in = CheckIn.find_by(comment: "these are excellent")

        expect(new_check_in).to be_present
      end

      it "redirects to a different page that gets updated with the recently created info" do
        post :create, params: valid_check_in_params

        new_check_in = CheckIn.find_by(comment: "these are excellent")

        expect(response).to redirect_to check_in_path(new_check_in)
      end
      # flash[:success], :notice, etc"
    end

    describe "with invalid attributes" do
      it "fails" do

        # not create a new record
        # fail a validation
        # re-render :new template
        # flash[:error, etc]
      end
    end
  end

  def create_check_in
    check_in = CheckIn.create!(
      emotion: "Happy",
      role_happiness: 4,
      company_happiness: 4
    )
  end

  def valid_check_in_params
    {
      check_in: {
        name: "gillian",
        emotion: "Happy",
        role_happiness: 4,
        company_happiness: 4,
        comment: "these are excellent"
      }
    }
  end

  def invalid_check_in_params
    {
      name: "gillian",
      role_happiness: 4,
      company_happiness: 4,
      comment: "these are excellent"
    }
  end
end
