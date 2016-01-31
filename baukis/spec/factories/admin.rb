# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :administrator do
    sequence(:email) {|n| "member#{n}@example.com"}
    password 'pw'
    suspended false
  end
end
