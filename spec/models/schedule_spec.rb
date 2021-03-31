require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe '帰宅時間登録機能' do
    before do
      @schedule = FactoryBot.build(:schedule)
    end

    context '帰宅時間が登録できるとき' do
      it '必要項目が入力されていれば登録できる' do
        expect(@schedule).to be_valid
      end
    end

    context '帰宅時間が登録できないとき' do
      it 'dateが空だと登録できない' do
        @schedule.start_time = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Start time can't be blank")
      end
      it 'time_limit_idが空だと登録できない' do
        @schedule.time_limit_id = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Time limit can't be blank")
      end
      it 'user_idが既にdate登録されていると登録できない' do
        @schedule.save
        another_schedule = FactoryBot.build(:schedule)
        another_schedule.user_id = @schedule.user_id
        another_schedule.start_time = @schedule.start_time
        another_schedule.valid?
        expect(another_schedule.errors.full_messages).to include('Start time has already been taken')
      end
    end
  end
end
