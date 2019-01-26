FactoryBot.define do
  factory :user do
    sequence(:name) {|n|"user#{n}"}
    sequence(:email_address) {|n| "user#{n}@example.com" }
    password { "test" }
    password_confirmation { "test" }
    role { "user" }
  end

  factory :profile do
    message {"Hello.This is my profile."}
    github_id {"some_github_id"}
    facebook_id {"some.facebook.id"}
    twitter_id {"some_twitter_id"}
    user

    after(:create) do |profile|
      create_list(:work_experience, 2, profile: profile)
    end
  end

  factory :work_experience do
    company_name {"some company"}
    work_start_on {Date.current}
    work_end_on {Date.current}
  end
end