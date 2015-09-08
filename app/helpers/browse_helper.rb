module BrowseHelper
  
  def get_prefixes_of_results(list)
    prefixes_with_values = {}
    list.each do |item|
      if item
        if prefixes_with_values[item.value[0,1].upcase]
          prefixes_with_values[item.value[0,1].upcase] << { name: item.value, count: item.hits }
        else
          prefixes_with_values[item.value[0,1].upcase] = [{ name: item.value, count: item.hits }]
        end
      end
    end
    Hash[prefixes_with_values.sort]
  end
end