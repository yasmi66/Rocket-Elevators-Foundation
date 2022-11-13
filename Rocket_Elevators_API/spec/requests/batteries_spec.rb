 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/batteries", type: :request do
  # Battery. As you add validations to Battery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Battery.create! valid_attributes
      get batteries_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      battery = Battery.create! valid_attributes
      get battery_url(battery)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_battery_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      battery = Battery.create! valid_attributes
      get edit_battery_url(battery)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Battery" do
        expect {
          post batteries_url, params: { battery: valid_attributes }
        }.to change(Battery, :count).by(1)
      end

      it "redirects to the created battery" do
        post batteries_url, params: { battery: valid_attributes }
        expect(response).to redirect_to(battery_url(Battery.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Battery" do
        expect {
          post batteries_url, params: { battery: invalid_attributes }
        }.to change(Battery, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post batteries_url, params: { battery: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested battery" do
        battery = Battery.create! valid_attributes
        patch battery_url(battery), params: { battery: new_attributes }
        battery.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the battery" do
        battery = Battery.create! valid_attributes
        patch battery_url(battery), params: { battery: new_attributes }
        battery.reload
        expect(response).to redirect_to(battery_url(battery))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        battery = Battery.create! valid_attributes
        patch battery_url(battery), params: { battery: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested battery" do
      battery = Battery.create! valid_attributes
      expect {
        delete battery_url(battery)
      }.to change(Battery, :count).by(-1)
    end

    it "redirects to the batteries list" do
      battery = Battery.create! valid_attributes
      delete battery_url(battery)
      expect(response).to redirect_to(batteries_url)
    end
  end
end
