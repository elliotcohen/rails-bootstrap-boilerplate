desc "Collect GCM Contact Info for Northeast zipcodes"
task :gcm_contact_info do
  agent = Mechanize.new
  page = agent.get("http://memberfinder.caremanager.org/")
  gcm_form = page.form("advancedSearchForm")
  
  #set form values
  gcm_form.checkboxes[0].check
  gcm_form.checkboxes[1].check
  gcm_form.checkboxes[2].check
  gcm_form.location = "02138"
  gcm_form.searchType = "0"
  gcm_form.radiusSelect = "100"
  
  #submit form 
  results = agent.submit(gcm_form)
  
  #get the provider list from the resulting HTML
  providers = results.search("table#ProviderList")[0]
  #throw away first node cause it is just a header "Fellow / Certified GCM"
  provider_list = providers.children
  provider_list.delete(providers.children.first)
  
  provider_list_r = []
  header_row = ['Company Name', 'First Name', 'Last Name', 'Address', 'Phone', 'Fax', 'Email', 'Website', 'Description', 'Lead Source']
  provider_list_r << header_row
  
  #loop over list and pull out GCM info
  provider_list.each do |p|
    #for this provider, select the columns that have actual data
    p_cols = p.css('td.provider')
    if p_cols.length == 0
      next
    end
      
    #assume 3 columns 
    #first has name, cert, address
    names = p_cols[0].css('strong')[0].content.split(' ', 2)
    first_name = names[0]
    last_name = names[1]
    
    tmp_r = p_cols[0].inner_html.split('<br>')
    tmp_r = tmp_r.drop(2)
    tmp_r.delete(tmp_r.last)
    tmp_r.map!{|t| t.strip}
    company_name = tmp_r[0]
    address = tmp_r.join(', ')

    
    #second has contact
    phone = nil
    fax = nil
    email = nil
    web = nil
    contact_info = p_cols[1].children
    while contact_info.length > 0
      node = contact_info.delete(contact_info.first)
      if node.text.strip == "Phone:"
        phone = contact_info.delete(contact_info.first).text.strip
      end
      if node.text.strip == "Fax:"
        fax = contact_info.delete(contact_info.first).text.strip
      end
      if node.text.strip.include?('@')
        email = node.text.strip
      end
      if node.text.strip.include?('http://')
        web = node.text.strip
      end
    end    
    
    #third has association info
    description = ""
    p_cols[2].children.each do |a|
      description += a.text.strip + " "
    end

    row = [company_name, first_name, last_name, address, phone, fax, email, web, description, 'NAPGCM Member Finder']
    provider_list_r << row
  end
  
  #output provider_list_r as a CSV
  fname = Rails.root.join("tmp/gcm.csv")
  CSV.open(fname, 'wb') do |csv|
    provider_list_r.each do |row|
      csv << row
    end
  end
end