require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  let(:user) { create(:user) }

  describe 'プロフィールページにアクセス' do
    before do
      # sessionにUserIDを返し、ログインしたことにする
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
      visit profile_path
    end
    it '動画視聴状況が表示される' do
      expect(page).to have_content('動画視聴状況')
    end
  end
end
