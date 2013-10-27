require_relative 'contact'
require_relative 'rolodex'

class CRM
	def initialize(name)
		@name = name
	end

#user selects from a menu
	def print_main_menu
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all the contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
		puts "Enter a number: "
  	end

	def main_menu
		print_main_menu
		user_selected = gets.to_i
		call_option(user_selected)
	end

	def call_option(user_selected)
		add_new_contact if user_selected == 1
		choose_contact if user_selected == 2
		delete_contact if user_selected == 3
		display_all_contacts if user_selected == 4
		display_by_attribute if user_selected == 5
		exit if user_selected == 6
	end

	def add_new_contact
		print "Enter First Name: "
		first_name = gets.chomp
		print "Enter Last Name: "
		last_name = gets.chomp
		print "Enter Email Address: "
		email = gets.chomp
		print "Enter a Note: "
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
		Rolodex.add_contact(contact)
		p Rolodex.contacts
		main_menu
	end

	def confirm_modifications(contact, field_to_change, new_value)
		#puts field_to_change
		#puts contact.first_name
		#puts new_value
		puts "Please confirm your changes: Y/N"
		user_selected = gets.chomp.downcase
		if user_selected == "yes" || user_selected == "y"
			puts "Your contact information has been modified according to your instructions."

			# contact.send(:first_name, new_value)
			if field_to_change == "first_name"
				contact.first_name = new_value
			puts contact.first_name + " " + contact.last_name
			end
			if field_to_change == "last_name"
				contact.last_name = new_value
			puts contact.first_name + " " + contact.last_name
			end
			if field_to_change == "email"
				contact.email = new_value
			puts contact.email
			end
			if field_to_change == "note"
				contact.note = new_value
			puts contact.note
			end
		else
			modify_existing_contact
		end
	end

	def choose_contact
		puts "Please enter the contact ID of the contact you would like to modify."
		input_id = gets.chomp
		index = Rolodex.contacts.index { |c| c.id == input_id.to_i}
		if !index.nil?
			contact = Rolodex.contacts[index]
			modify_existing_contact(contact)
		else
			puts "We could not find that contact. Please input another contact ID."
			main_menu
			# choose_contact
		end
	end

	def modify_existing_contact(contact)
		puts "Which attribute would you like to edit?"
		puts "[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email Address"
		puts "[4] Note"
		user_selected = gets.to_i
		if user_selected == 1
			puts "Please enter your new first name: "
			field_to_change = "first_name"
			new_value = gets.chomp 
		elsif user_selected == 2
			puts "Please enter your new last name: "
			field_to_change = "last_name"
			new_value = gets.chomp 
		elsif user_selected == 3
			puts "Please enter your new email address: "
			field_to_change = "email"
			new_value = gets.chomp
		elsif user_selected == 4
			puts "Please enter your new note: "
			field_to_change = "note"
			new_value = gets.chomp
		end
		confirm_modifications(contact, field_to_change, new_value)
	end

	def delete_contact
		puts "Please enter the contact ID."
		input_id = gets.chomp.to_i
		index = Rolodex.contacts.index { |c| c.id == input_id.to_i}

		if index.nil?
			puts "You did not enter a contact ID."
			main_menu
		else
			Rolodex.contacts.delete_if {|c| c.id == input_id.to_i}
			puts "This contact has been deleted according to your instructions."
		end

	end

	def display_all_contacts
		puts Rolodex.contacts

	end

	def display_by_attribute
		puts "Please enter the contact ID."
		input_id = gets.chomp.to_i
		index = Rolodex.contacts.index {|c| c.id == input_id.to_i}
		contact = Rolodex.contacts[index]

		if index.nil?
			puts "You did not enter a contact ID."
			main_menu

		else
			puts "Which attribute would you like to display?"
			puts "[1] First Name"
			puts "[2] Last Name"
			puts "[3] Email Address"
			puts "[4] Note"
		user_selected = gets.to_i
			

			if user_selected == 1
				puts contact.first_name
			elsif user_selected == 2
				puts contact.last_name	
			elsif user_selected == 3
				puts contact.email
			elsif user_selected == 4
				puts contact.note
			end
		end	
	end

	def exit
		puts "\e[H\e[2J"
	end
end



	

a_crm_app = CRM.new("crm")
a_crm_app.main_menu



# Rolodex.add_contact(contact)
# Rolodex.contacts

