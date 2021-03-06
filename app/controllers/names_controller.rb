class NamesController < ApplicationController
  # This controller serves the names tab, which displays EOL hierarchies. Each Hierarchy (classification) has a tree
  # on which a classification is displayed. This tree is implemented in Ajax. Once clicking on any entry, it should
  # display the species name, image from EOL, and a link to books which include this name.

  include SolrHelper

  def index
    @page_title = I18n.t('common.tree_of_life_title')
    @entries = Hierarchy.where(browsable: 1).order('label')
  end

  def show
    parent_id = params[:id] || 0
    hierarchy_id = params[:h_id] || DEFAULT_HIERARCHY_ID
    @hierarchy_entries = HierarchyEntry.find_siblings(hierarchy_id, parent_id)
    render layout: 'main' # this is a blank layout as I don't need any layout in this action
  end

  def get_content
    @id = params[:id]
    he = HierarchyEntry.find_taxon(@id)
    return resource_not_found unless he
    @taxon_concept_id = he.taxon_concept_id
    return resource_not_found unless @taxon_concept_id
    @name = he.clean_taxon_concept
    image_source = TaxonConcept.get_image(@taxon_concept_id)
    if image_source.nil?
      @image = nil
    else
      @image = EOL_CONTENT_PATH + image_source.to_s.from(0).to(3) + '/' +
                  image_source.to_s.from(4).to(1) + '/' +
                  image_source.to_s.from(6).to(1) + '/' +
                  image_source.to_s.from(8).to(1) + '/' +
                  image_source.to_s.from(10) + '_580_360.jpg'
    end

    unless @name.blank?
      @name.gsub('"', '\"')
      @books_count = get_volumes_contain_sci_name([@name], ' OR ').count
    else
      @books_count = 0
    end
    render layout: 'main' #Again: this is a blank layout as I don't need any layout in this action
  end


end
