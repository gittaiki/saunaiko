require 'rails_helper'

RSpec.describe Active, type: :model do
  describe 'サ活記録の検証' do
    context '成功するとき' do
      it '全項目を入力の場合' do
        active = create(:active)
        expect(active).to be_valid
        expect(active.errors).to be_empty
      end
    end

    context '失敗するとき' do
      it '訪問日のみ未入力の場合' do
        active_without_visited_on = build(:active, visited_on: '')
        expect(active_without_visited_on).to be_invalid
        expect(active_without_visited_on.errors.full_messages).to eq ['訪問日を入力してください']
      end

      it 'サウナの入浴時間（分）のみ未入力の場合' do
        active_without_sauna_minute = build(:active, sauna_minute: '')
        expect(active_without_sauna_minute).to be_invalid
        expect(active_without_sauna_minute.errors.full_messages).to eq ['サウナの入浴時間（分）を入力してください']
      end

      it '水風呂の入浴時間（分）のみ未入力の場合' do
        active_without_water_bath_minute = build(:active, water_bath_minute: '')
        expect(active_without_water_bath_minute).to be_invalid
        expect(active_without_water_bath_minute.errors.full_messages).to eq ['水風呂の入浴時間（分）を入力してください']
      end

      it '外気浴の入浴時間（分）のみ未入力の場合' do
        active_without_break_minute = build(:active, break_minute: '')
        expect(active_without_break_minute).to be_invalid
        expect(active_without_break_minute.errors.full_messages).to eq ['外気浴の入浴時間（分）を入力してください']
      end

      it '合計セット回数のみ未入力の場合' do
        active_without_cycle_count = build(:active, cycle_count: '')
        expect(active_without_cycle_count).to be_invalid
        expect(active_without_cycle_count.errors.full_messages).to eq ['合計セット回数を入力してください']
      end
    end
  end
end
