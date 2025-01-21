class AddEmailFormatConstraintToUsers < ActiveRecord::Migration[7.1]
  def change
    execute <<-SQL
    ALTER TABLE users
      ADD CONSTRAINT email_format_check
      CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
    SQL
  end
end