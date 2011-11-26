require 'rubygems'
require 'highline/import'


ft = HighLine::ColorScheme.new do |cs|
       cs[:headline]        = [ :bold, :yellow, :on_black ]
       cs[:horizontal_line] = [ :bold, :white ]
       cs[:attribute]       = [ :blue ]
     end

HighLine.color_scheme = ft
     
say "<%= color('Let us create a user!', :headline) %>"
say("<%= color('-'*20, :horizontal_line) %>")

email_address = ask("<%= color('Email address?  ', :attribute) %>", String)  { |q| q.validate = /\w+\@\w+.\w/}
full_name = ask("<%= color 'Name?  (last, first)  ', :attribute %>", String) { |q| q.validate = /\A\w+, ?\w+\Z/ }
username = ask("<%= color 'UserName?  ', :attribute %>", String) { |q|
            q.default = email_address
            q.case = :downcase 
            q.whitespace =:remove
          }
client_ids = ask("<%= color 'Client IDs?  (comma sep list)  ', :attribute %>", lambda { |str| str.split(/,\s*/) })      
password = ask("<%= color 'Password?  ', :attribute %>", String) { |q| q.echo = false }      

say("<%= color('-'*20, :horizontal_line) %>")
say("<%= color('This will create the following user:', :headline) %>")
say "<%= color 'Email: ', :attribute %>#{email_address}"
say "<%= color 'Name: ', :attribute %>#{full_name}"
say "<%= color 'Username: ', :attribute %>#{username}"
say "<%= color 'Client IDs: ', :attribute %>#{client_ids.to_s}"

continue = ask("Create User? (y/n)", ["y", "n"]) { |q| q.case = :downcase }
if continue == "y"
  say "Saved!"
else
  say "User creation aborted."
end