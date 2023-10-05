require 'sqlite3'
require 'active_record'
require 'byebug'


ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'customers.sqlite3')
# Mostrar consultas en la consola.
# Comenta esta linea para desactivar la visualización de consultas SQL sin formato.
ActiveRecord::Base.logger = Logger.new(STDOUT)

class Customer < ActiveRecord::Base 
  def to_s
    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}"
  end

  # Devuelve todos los clientes cuyo nombre sea Candice
  def self.any_candice
    Customer.where(first: 'Candice')
  end 

  # Devuelve solo clientes con direcciones de correo electronico validas (que contengan '@')
  def self.with_valid_email
    Customer.where('email LIKE ?', '%@%')
  end

  # Devuelve clientes con emails .org
  def self.with_org_email
    Customer.where('email LIKE ?', '%.org')
  end

  # Devuelve con correo electronico no valido pero que no este en blanco (no contiene "@")
  def self.with_invalid_email
    Customer.where('email NOT LIKE ? AND email != ""', '%@%')
  end

  # Devuelve con correo electronico en blanco
  def self.with_blank_email
    Customer.where(email: '')
  end

  # Devuelve clientes nacidos antes del 1 Enero 1980
  def self.born_before_1980
    Customer.where('birthdate < ?', Date.new(1980,1,1))
  end

  # Devuelve con correo electronico valido Y nacidos antes del 1/1/1980
  def self.valid_email_and_born_before_1980
    Customer.where('email LIKE ? AND birthdate < ?', '%@%', Date.new(1980,1,1))
  end

  # Devuelve con apellidos que comienzan con "B", ordenados por fecha de nacimiento
  def self.last_name_starts_with_b
    Customer.where('last LIKE ?', 'B%').order(:birthdate)
  end

  # Devuelve 20 clientes mas jovenes, en cualquier orden
  def self.twenty_youngest
    Customer.order(birthdate: :desc).limit(20)
  end

  # Actualiza la fecha de nacimiento de Gussie Murray hasta el 8 de febrero de 2004
  def self.update_gussie_birthdate
    Customer.find_by(first: 'Gussie', last: 'Murray').update(birthdate: Date.new(2004,2,8))
  end

  # Actualiza: Todos los correos electronicos no validos deben estar en blanco.
  def self.blank_invalid_emails
    Customer.where('email NOT LIKE ?', '%@%').update_all(email: '')
  end

  # Elimina al cliente Meggie Herman
  def self.delete_meggie
    Customer.where(first: 'Meggie', last: 'Herman').destroy_all
  end


  def self.with_dot_org_email
    where("email LIKE ?", "%.org%")
  end
  
  # Método para encontrar clientes con correo electrónico en blanco
  def self.with_blank_email
    where(email: '')
  end

  # Método para encontrar clientes con correo válido Y nacidos antes del 1/1/1980
  def self.with_valid_email_born_before_1980
    where("email LIKE ? AND birthdate < ?", "%@%", "1980-01-01")
  end
  
  # Método para encontrar clientes con apellidos que comienzan con "B", ordenados por fecha de nacimiento
  def self.last_name_starts_with_b_ordered_by_birthdate
    where("last LIKE ?", "B%").order(:birthdate)
  end

  # Método para actualizar la fecha de nacimiento de Gussie Murray hasta el 8 de febrero de 2004
  def self.update_gussie_murray_birthdate
    find_by(first: 'Gussie', last: 'Murray').update(birthdate: "2004-02-08")
  end

  # Método para actualizar y poner en blanco todos los correos electrónicos no válidos
  def self.invalidate_blank_emails
    where("email NOT LIKE ?", "%@%").update_all(email: "")
  end

  # Método para eliminar al cliente Meggie Herman
  def self.delete_meggie_herman
    find_by(first: 'Meggie', last: 'Herman').destroy
  end


  def self.change_all_invalid_emails_to_blank
    where("email IS NOT NULL AND email NOT LIKE '%@%'").update_all(email: '')
  end

  def self.delete_born_on_dec_31_1977
    where(birthdate: Date.new(1977, 12, 31)).delete_all
  end

  def self.delete_everyone_born_before_1978
    where('birthdate < ?', Date.new(1978, 1, 1)).delete_all
  end

  def self.with_valid_email_and_born_before_1980
    where("email LIKE ? AND birthdate < ?", "%@%", "1980-01-01")
  end

  def self.last_names_starting_with_b
    where("last LIKE ?", "B%").order(:birthdate)
  end

  def self.with_blank_email
    where("email = '' OR email IS NULL OR TRIM(email) = ''")
  end
  
  
end

