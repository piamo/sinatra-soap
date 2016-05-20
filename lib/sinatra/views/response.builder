xml.instruct!
xml.tag! 'soap:Envelope', 'xmlns:soap' => 'http://schemas.xmlsoap.org/soap/envelope/',
        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance' do
  xml.tag! 'soap:Body' do
    xml.tag! "ns2:#{wsdl.action}Response", 'xmlns:ns2' => 'http://schemas.xmlsoap.org/wsdl/'  do
      params.each do |key, value| 
        xml.tag! key, value
      end
    end
  end
end
