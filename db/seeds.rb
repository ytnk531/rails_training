# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.create!(name: 'Admin1', email_address: 'admin1@example.com', password: 'test', password_confirmation: "test",role: 'admin')\
      .create_profile!(message: '管理者です。', github_id: 'ytnk531')\
      .work_experiences.create(company_name: '毎朝新聞株式会社', work_start_on: Date.new)
User.create!(name: 'Admin2', email_address: 'admin2@example.com', password: 'test', password_confirmation: 'test',role: 'admin')\
      .create_profile!(message: '管理者です。', github_id: 'ytnk531')\
      .work_experiences.create(company_name: '毎朝新聞株式会社', work_start_on: Date.new)
User.create!(name: 'User1', email_address: 'user1@example.com', password: 'test', password_confirmation: 'test',role: 'user')\
      .create_profile!(message: 'ユーザーです。', github_id: 'ytnk531')\
      .work_experiences.create(company_name: '毎朝新聞株式会社', work_start_on: Date.new)
User.create!(name: 'User2', email_address: 'user2@example.com', password: 'test', password_confirmation: 'test',role: 'user')\
      .create_profile!(message: 'ユーザーです。', github_id: 'ytnk531')\
      .work_experiences.create(company_name: '毎朝新聞株式会社', work_start_on: Date.new)
User.create!(name: 'User3', email_address: 'user3@example.com', password: 'test', password_confirmation: 'test',role: 'user')\
      .create_profile!(message: 'ユーザーです。', github_id: 'ytnk531')\
      .work_experiences.create(company_name: '毎朝新聞株式会社', work_start_on: Date.new)
User.create!(name: 'User4', email_address: 'user4@example.com', password: 'test', password_confirmation: 'test',role: 'user')\
      .create_profile!(message: 'ユーザーです。', github_id: 'ytnk531')\
      .work_experiences.create(company_name: '毎朝新聞株式会社', work_start_on: Date.new)

