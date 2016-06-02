def hash_to_xml(local_xml, hash_params)
  hash_params.each do |key, value|
    if value.is_a? Hash
      local_xml.tag! key do
        hash_to_xml(local_xml, value)
      end
    else
      local_xml.tag! key, value
    end
  end
end

xml.instruct!
xml.tag! 'soap:Envelope', 'xmlns:soap' => 'http://schemas.xmlsoap.org/soap/envelope/',
        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance' do
  xml.tag! 'soap:Body' do
    xml.tag! "ns2:#{wsdl.action}Response", 'xmlns:ns2' => 'http://schemas.xmlsoap.org/wsdl/'  do
      hash_to_xml(xml, params)
    end
  end
end
