require_relative "contact.rb"

class CRM

  def initialize


  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.chomp.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
  puts '[1] Add a new contact'
  puts '[2] Modify an existing contact'
  puts '[3] Delete a contact'
  puts '[4] Display all the contacts'
  puts '[5] Search by attribute'
  puts '[6] Exit'
  puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then
    end
  end

  def add_new_contact
    print "enter first name"
    first_name = gets.chomp

    print "enter last name"
    last_name = gets.chomp

    print "enter email address"
    email = gets.chomp

    print "enter notes"
    notes = gets.chomp

    contact = Contact.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    note: notes
    )
  end


  def modify_existing_contact

      print "what attribute do you want to change?"
      attribute = gets.chomp
      print "what is the old value of this attribute"
      old_value = gets.chomp
      print "what is the new value of that attribute?"
      new_value = gets.chomp

      contact = Contact.find_by(
      attribute.to_sym => old_value
      )

      contact.update(
      attribute.to_sym => new_value
      )
  end


  def delete_contact
    puts "how do you want to locate this contact?"
    attribute = gets.chomp
    puts "whose the contact you want to delete?"
    value = gets.chomp
    contact = Contact.find_by(
    attribute.to_sym => value
    )
    contact.delete

  end


  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    puts "Do you want to search for contact using first name, last name, or email?"
    attribute = gets.chomp
    puts "what is this contact's name (first or last) or email address?"
    value = gets.chomp
    contact = Contact.find_by(

    attribute.to_sym => value
    )
    puts contact.full_name
  end

end




menu = CRM.new
menu.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
