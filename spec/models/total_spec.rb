require 'rails_helper'

RSpec.describe Total, type: :model do
  describe '勤務時間入力' do
    before do
      @total = FactoryBot.build(:total)
    end

    context '勤務時間登録ができる時' do
      it '全項目入力すれば登録できる' do
        expect(@total).to be_valid
      end
    end

    context '勤務時間登録ができない時' do
      it 'start_timeが空では登録できない' do
        @total.start_time = nil
        @total.valid?
        expect(@total.errors.full_messages).to include("Start Time can't be blank")
      end
      it 'working_hourが空では登録できない' do
        @total.working_hour = nil
        @total.valid?
        expect(@total.errors.full_messages).to include("Working hour can't be blank")
      end
      it '同じstart_timeでuser_idが既に登録されている登録できない' do
        @total.save
        another_total = FactoryBot.build(:total)
        another_total.user_id = @total.user_id
        another_total.start_time = @total.start_time
        another_total.valid?
        expect(another_total.errors.full_messages).to include('Start Time has already been taken')
      end
      it 'working_hourは半角英字では登録できない' do
        @total.working_hour = 'a'
        @total.valid?
        expect(@total.errors.full_messages).to include('Working hour is not a number')
      end
      it 'working_hourは全角では登録できない' do
        @total.working_hour = '１'
        @total.valid?
        expect(@total.errors.full_messages).to include('Working hour is not a number')
      end
    end
  end
end
