class AddDoctorIdToPatients < ActiveRecord::Migration
   def up 
     add_column :patients, :doctor_id, :integer
 
     add_index :patients, :doctor_id 
    end 

    def down
      remove_index :patients, :doctor_id 

      remove_column :patients, :doctor_id

    end 
end
