require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'given a user and a session' do
    before :each do
      @andre = User.new()
      @andre.email = 'test@test.com'
      @andre.password = 'test'
      @andre.save
      login_user(@andre)
    end

    describe 'GET /users/new' do
    before :each do
      get :new
    end

      it 'responds successfully' do
        expect(response.code).to eq('200')
      end

      it 'assigns @user to a new user model' do
        expect(assigns(:user)).to be_instance_of(User)
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
  end

end
