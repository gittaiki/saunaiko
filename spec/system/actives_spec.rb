require 'rails_helper'

RSpec.describe 'Actives', type: :system do
  let(:active) { create(:active) }

  describe 'サ活一覧' do
    context 'ページにアクセス' do
      before do
        # sessionにUserIDを返し、ログインしたことにする
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: active.user_id)
        create(:video)
        visit actives_path
      end

      it 'サ活の記録が表示される' do
        expect(page).to have_content active.visited_on
        expect(Active.count).to eq 1
      end

      it '先月のサ活の記録が表示される' do
        find('.fa-circle-chevron-left').click
        expect(page).to have_content "#{Time.zone.today.prev_month.month}月のサ活レポート"
        expect(current_path).to eq actives_path
      end

      it '次月のサ活の記録が表示される' do
        find('.fa-circle-chevron-right').click
        expect(page).to have_content "#{Time.zone.today.next_month.month}月のサ活レポート"
        expect(current_path).to eq actives_path
      end

      it 'サ活の記録が削除される' do
        find('.fa-trash-can').click
        # confirmダイアログをOK
        page.accept_confirm
        expect(page).to have_content('サ活の記録を削除しました')
        expect(current_path).to eq actives_path
        expect(Active.count).to eq 0
      end
    end
  end

  describe 'サ活新規作成' do
    context 'ページにアクセス' do
      before do
        # sessionにUserIDを返し、ログインしたことにする
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: active.user_id)
        create(:video)
        visit new_active_path
      end

      it 'キャンセルをクリックした場合、サ活一覧ページにアクセスされる' do
        click_link 'キャンセル'
        expect(current_path).to eq actives_path
      end

      it '全項目を入力した場合、サ活が記録される' do
        fill_in 'active[visited_on]', with: 'Time.zone.today'
        fill_in 'active[sauna_minute]', with: '1'
        fill_in 'active[water_bath_minute]', with: '1'
        fill_in 'active[break_minute]', with: '1'
        fill_in 'active[cycle_count]', with: '1'
        click_button '記録する'
        expect(page).to have_content('サ活を記録しました。')
        expect(current_path).to eq actives_path
      end

      it '未入力の項目がある場合、サ活が記録されない' do
        fill_in 'active[visited_on]', with: ''
        fill_in 'active[sauna_minute]', with: '1'
        fill_in 'active[water_bath_minute]', with: '1'
        fill_in 'active[break_minute]', with: '1'
        fill_in 'active[cycle_count]', with: '1'
        click_button '記録する'
        expect(page).to have_content('サ活を記録できませんでした')
      end
    end
  end
end
