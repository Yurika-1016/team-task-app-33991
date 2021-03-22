require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '新規タスク登録' do
    before do
      @task = FactoryBot.build(:task)
    end

    context '新規タスク登録ができる時' do
      it '全ての入力が適切にされていれば登録できる' do
        expect(@task).to be_valid
      end
    end

    context '新規タスク登録ができない時' do
      it 'nameが空だと登録できない' do
        @task.name = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Name can't be blank")
      end
      it 'time_required_idが空だと登録できない' do
        @task.time_required_id = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Time required can't be blank", 'Time required is not a number')
      end
      it 'time_required_idが0だと登録できない' do
        @task.time_required_id = 0
        @task.valid?
        expect(@task.errors.full_messages).to include('Time required must be other than 0')
      end
      it 'start_timeが空だと登録できない' do
        @task.start_time = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Start time can't be blank")
      end
      it 'dead_line_dateが空だと登録できない' do
        @task.dead_line_date = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Dead line date can't be blank")
      end
      it 'operator_idが空だと登録できない' do
        @task.operator_id = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Operator can't be blank", 'Operator is not a number')
      end
      it 'operator_idが0だと登録できない' do
        @task.operator_id = 0
        @task.valid?
        expect(@task.errors.full_messages).to include('Operator must be other than 0')
      end
    end
  end
end
