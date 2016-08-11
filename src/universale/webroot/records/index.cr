post "/records" do |env|
  begin
    id = Record.create(env.params.body)
    record = Record.find(id)
    if env.json?
      env.json!
      record
    else
      "Record #{record} created"
      # redirect to /record/:id
    end
  rescue e
    puts e.inspect
    "Cannot create this record"
    # raise error
  end
end
