class Contact
	attr_accessor :id, :first_name, :last_name, :email, :note
	def initialize(first_name, last_name, email, note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
	end

	def add_new_contact
		puts "Enter First Name: "
		first_name = gets.chomp
		puts "Enter Last Name: "
		last_name = gets.chomp
		puts "Enter Email Address: "
		email = gets.chomp
		puts "Enter a Note: "
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
	end
		#To be able to modify email addresses & notes. Gets the value of an attribute.
	def email
		@email
	end
		#Sets the value of an attribute
	def note(note)
		@note = note
	end
end