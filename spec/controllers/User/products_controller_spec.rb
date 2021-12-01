require 'rails_helper'
RSpec.describe ProductsController, type: :controller do
    describe "#show" do
        let!(:product){ FactoryBot.create(:product) }
          it "display a product" do
            get :show, params: {id: product.id}
            expect(assigns(:product).id).to eq product.id  
          end
    end
end