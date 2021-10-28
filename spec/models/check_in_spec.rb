require 'rails_helper'

RSpec.describe CheckIn, type: :model do
  # test for db columns
  # test validations
  describe "schema" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:role_happiness).of_type(:integer) }
    it { is_expected.to have_db_column(:company_happiness).of_type(:integer) }
    it { is_expected.to have_db_column(:comment).of_type(:text) }
    it { is_expected.to have_db_column(:emotion).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  context "validations" do
    describe "role_happiness" do
      it "throws an error if role_happiness is less than 1 or greater than 5" do
        expect do
          CheckIn.create!(role_happiness: 0, company_happiness: 3, emotion: "happy")
        end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Role happiness 0 must be between 1 and 5.")
      end

      it "is valid when role_happiness is between 1 and 5" do
        check_in = CheckIn.create!(role_happiness: 1, company_happiness: 3, emotion: "happy")

        expect(check_in).to be_valid
      end

      it "is valid when role_happiness is exactly 1 or 5" do
        check_in = CheckIn.create!(role_happiness: 3, company_happiness: 3, emotion: "happy")

        expect(check_in).to be_valid
      end
    end
  end
end
