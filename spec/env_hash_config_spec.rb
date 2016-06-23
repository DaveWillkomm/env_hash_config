require 'spec_helper'

describe EnvHashConfig do
  subject { described_class.create }

  it 'has a version number' do
    expect(EnvHashConfig::VERSION).not_to be nil
  end

  describe '#create' do
    it 'converts option hash keys to lowercase symbols' do
      expect(subject.compound_word).to eq('compound word')
      expect(subject.lowercase).to eq('lowercase')
      expect(subject.mixedcase).to eq('MixedCase')
      expect(subject.uppercase).to eq('UPPERCASE')
    end

    it 'does not implicitly convert option values' do
      expect(subject.array_one).to eq('a,b')
      expect(subject.integer_one).to eq('1')
    end

    it 'supports hashes other than ENV' do
      config = described_class.create options: { 'THIS_IS_NOT_AN_ENV_KEY' => 'this is not an env value' }
      expect(config.this_is_not_an_env_key).to eq('this is not an env value')
    end

    describe 'given array options' do
      subject { described_class.create array_options: [:array_one, :array_two] }

      it 'converts array options' do
        expect(subject.array_one).to eq(['a','b'])
        expect(subject.array_two).to eq(['1','2'])
      end
    end

    describe 'given boolean options' do
      subject { described_class.create boolean_options: [:boolean_true, :boolean_false, :boolean_other, :boolean_blah] }

      it 'converts boolean options' do
        expect(subject.boolean_true).to be(true)
        expect(subject.boolean_false).to be(false)
        expect(subject.boolean_other).to be(false)
      end

      it 'does not default boolean options' do
        expect(subject.boolean_blah).to be_nil
      end
    end

    describe 'given default options' do
      subject do
        described_class.create(
          default_options: { default: 'value', default_integer: '216' },
          integer_options: [:default_integer],
        )
      end

      it 'adds default options to the configuration' do
        expect(subject.default).to eq('value')
      end

      it 'does not convert default values' do
        expect(subject.default_integer).to eq('216')
      end

      it 'allows overriding default values' do
        default_options = { default: 'value' }
        config = described_class.create options: {}, default_options: default_options
        expect(config.default).to eq('value')
        config = described_class.create options: { default: 'overridden' }, default_options: default_options
        expect(config.default).to eq('overridden')
      end
    end

    describe 'given integer options' do
      subject { described_class.create integer_options: [:integer_one, :integer_two] }

      it 'converts integer values' do
        expect(subject.integer_one).to eq(1)
        expect(subject.integer_two).to eq(2)
      end
    end

    describe 'given a block' do
      it 'allows manipulating processed options before creating the configuration' do
        config = described_class.create integer_options: [:integer_one, :integer_two] do |h|
          h[:sum] = h[:integer_one] + h[:integer_two]
          h.delete :integer_one
          h.delete :integer_two
          h
        end

        expect(config.sum).to eq(3)
        expect(config.integer_one).to be_nil
        expect(config.integer_two).to be_nil
      end
    end
  end
end
