# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe Admin::CategoryController, type: :controller do
  describe '#index' do
    let!(:categories) { FactoryBot.create_list(:category,2)}
   context "check list category" do
      it 'check list category' do
        get :index
        expect(assigns(:categories).size) == categories.size
      end 
   end
   context "show all category" do
    let!(:category_active) { FactoryBot.create(:category,active: true) } 
    let!(:category_deactive) { FactoryBot.create(:category,active: false) } 
     it 'show category is active' do
       get :index
        expect(assigns(:categories).first) == category_active
     end
   end
  end
  describe '#show' do
    let!(:category) { FactoryBot.create(:category) } 
    it 'show a category' do
      get :show, params: { id: category.id}
      expect(assigns(:category).id).to eq category.id  
    end
  end
  describe "#create" do
    context 'success' do
      it 'create new category' do
        expect{ 
          post :create, params: FactoryBot.attributes_for(:category, active: true)
        }.to change(Category, :count).by(1)
      end
    it 'redirect to admin category page' do
      post :create, params: FactoryBot.attributes_for(:category, active: true)
      expect(response).to redirect_to admin_category_index_path
    end
  end
  context "failure" do
      it 'with invalid attributes' do
        post :create, params: FactoryBot.attributes_for(:invalid_category)
        expect(response).to redirect_to admin_category_index_path
      end
    end
  end

  describe "#update" do
    let!(:category) { FactoryBot.create(:category) } 
    context "success" do
      it 'update a product' do
        put :update, params: FactoryBot.attributes_for(:category, id: category.id, name: 'Tui xach')
        expect(response).to redirect_to  admin_category_index_path
      end
    end
    context 'failure' do
      it 'invalid category' do
        put :update, params: FactoryBot.attributes_for(:category, id: category.id, name:'')
        expect(response).to redirect_to  admin_category_index_path
      end
    end
  end
  
  describe '#destroy' do
    let!(:category) { FactoryBot.create(:category) }
    it 'delete a category' do
      expect{ 
        delete :destroy, params: {id: category.id}
      }.to change(Category, :count).by(-1)
    end

    it 'redirect to category page' do
      delete :destroy, params: {id: category.id}
      expect(response).to redirect_to admin_category_index_path
    end
  end

end
