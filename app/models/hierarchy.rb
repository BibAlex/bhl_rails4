class Hierarchy < EOLBase
  establish_connection(:eol)
  
  has_many :hierarchy_entries
end
