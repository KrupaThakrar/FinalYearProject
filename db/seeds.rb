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

Topic.create(:title => "How to set up Whatsapp on your smart phone",
	:body => "To create a Facebook account:
1.	On the address bar, type in facebook.com and the main sign up page will appear.
2.	Enter the name you go by in everyday life.
3.	Enter your date of birth.
4.	Enter your mobile phone number. To use an email instead, tap Sign up with email.
5.	Tap Female or Male to select your gender.
6.	Choose a password and tap Sign Up.
To finish creating your account, you need to confirm your email or mobile number.
If you have difficulties signing up, here is a tutorial" ,:date => "2019/12/21")
