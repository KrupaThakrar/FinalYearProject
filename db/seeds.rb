# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.create(:title => "How to set up Whatsapp on your smart phone",
	:body => "1.	Open WhatsApp.
2.	Tap Agree and Continue at the bottom of the screen.
3.	Tap Continue on the pop-up.
4.	Tap Allow on both boxes to grant WhatsApp access to your files and contacts.
5.	Enter your phone number.
6.	Tap OK to confirm the number you entered.
7.	Enter the verification code that's texted to you.
8.	Tap Next.
9.	You should reach the page where you type your name and upload a picture
10.	You are all set!" ,:date => "2019/12/31")

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?