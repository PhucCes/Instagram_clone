require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    Warden.test_mode!
    user = FactoryBot.create :user
    sign_in user
  end

  let(:post) { FactoryBot.create(:post) }

  describe 'GET #index' do
    subject { get :index }

    it 'renders the index template' do
      expect(subject).to render_template(:index)
    end
  end

  describe 'GET #show"' do
    subject { get :show, :id => post.to_param }

    it 'render the show template' do
      expect(subject).to render_template(:show)
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'render the new template' do
      expect(subject).to render_template(:new)
    end
  end

  describe 'GET #edit' do

    subject { get :edit, :id => post.id.to_param }

    it 'render the edit template' do
      expect(subject).to render_template(:edit)
    end
  end

  # describe 'POST #create' do
  #   let(:post_params) do
  #     {
  #       post: {
  #         title: post.title,
  #         image: post.image
  #       }
  #     }
  #   end
  #
  #   before do
  #     put :create, post_params
  #   end
  #
  #   it 'redirects_to :action => :show' do
  #     expect(subject).to redirect_to :action => :show, :id => assigns(:post).id
  #   end
  # end

  # describe 'PUT update' do
  #   let(:post_params) do
  #     {
  #       post: {
  #         title: post.title,
  #         image: post.image
  #       }
  #     }
  #   end
  #
  #   before do
  #     put :update, post_params
  #   end
  #
  #   it 'redirects to post detail page' do
  #     expect(response).to redirect_to(post_path(post))
  #   end
  #
  #   it 'assigns correct variables' do
  #     expect(expected_post).to eq post
  #   end
  # end
  #
  describe 'DELETE #destroy' do
    subject { delete :destroy, :id => post.to_param }

    it 'redirects_to :action => :index' do
      expect(subject).to redirect_to :action => :index
    end
  end
end
