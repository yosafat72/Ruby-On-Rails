class User < ActiveRecord::Base
    self.table_name = "tbl_user"
    self.primary_key = "id_user"
end
