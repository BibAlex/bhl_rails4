class HierarchyEntry < EOLBase
  establish_connection(:eol)

  belongs_to :hierarchy

  def self.find_siblings(hierarchy_id, parent_id)
    self.find_by_sql("select string as taxon_concept, h1.id, h1.parent_id,
                        (select count(*) from hierarchy_entries as h2 where h2.parent_id=h1.id)
                          as siblings_count,
                          h1.taxon_concept_id
                        from hierarchy_entries h1
                          left outer join names on names.id=name_id
                        where hierarchy_id=#{hierarchy_id.to_i} and parent_id=#{parent_id.to_i} and published=1
                        order by string;")
  end

  def self.find_taxon(id)
    self.find_by_sql("select string as taxon_concept,
                            (select count(*) from hierarchy_entries as h2 where h2.parent_id=h1.id)
                              as siblings_count,
                            h1.taxon_concept_id
                          from hierarchy_entries h1
                            left outer join names on names.id=name_id
                          where published=1 and h1.id=#{id.to_i};").first
  end

  def clean_taxon_concept
    taxon_concept.gsub("\n", ' ').gsub("\'", "\\\'")
  end

  def self.get_taxon_concept_id(hierarchy_entry_id)
    self.find_by_id(hierarchy_entry_id.to_i).taxon_concept_id
  end
end
