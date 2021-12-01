require 'rails_helper'
RSpec.describe HomeController, type: :controller do
    describe "GET #index" do
      let!(:products) { FactoryBot.create_list(:product,2)}\
      context "check list product" do
        it "check list product " do
          get :index
          expect(assigns(:products).size) ==  products.size
        end
      end
      context 'check product active' do
        let!(:product_active) {FactoryBot.create(:product, active: true)  } 
        let!(:product_deactive) {FactoryBot.create(:product, active: false)  } 
          it 'show all product is active' do
            get :index
            expect(assigns(:products).first) ==  product_active
          end
      end
    end
end