class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	
       t.datetime :appointment_date
      t.timestamps
    end
  end
end
