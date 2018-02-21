FactoryBot.define do
  factory :book do
    sequence(:isbn)   { |n| "000-0-0000-0000-#{n}" }
    sequence(:title)  { |n| "Mybook no.#{n}" }
    price 1000
    publish "技術評論社"
    sequence(:title) { |n| "2018-01-#{n}" }
    dl false
  end
end