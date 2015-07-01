require 'rails_helper'

describe Post do
  it { should validate_presence_of :title }
  it { should validate_presence_of :image }
  it { should validate_presence_of :description }
  it { should validate_uniqueness_of :image }
  it { should belong_to :user}
end
