require 'rails_helper'

RSpec.describe University, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:campi) }
    it { is_expected.to have_many(:semesters) }
  end

  describe 'methods' do
    let!(:university) { create(:university) }

    describe '#current_semester' do
      it 'should return semester when has current semester' do
        semester = FactoryBot.create :semester, university: university
        expect(university.current_semester).to eq(semester)
      end

      it 'should return nil when all semesters passed' do
        FactoryBot.create :semester, :past_semester, university: university
        expect(university.current_semester).to equal(nil)
      end

      it 'should return nil when there is only future semesters' do
        semester = FactoryBot.create :semester, :future_semester, university: university
        expect(university.current_semester).to equal(nil)
      end
    end
  end
end
