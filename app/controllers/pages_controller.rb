class PagesController < ApplicationController
	def about
		@title = 'About Us';
		@content = 'This is the about page'
	end
	def news
		@title = 'Tech News';
		@content = 'This is the news page'
	end
	def contact
		@title = 'Contact';
		@content = 'This is the contact page'
	end
	def send_form
    ContactMailer.contact_email(params).deliver
  	end
	def index
	end 
end
