post "/records" do |env|
  begin
    id = Record.create(env.params.body)
    record = Record.find(id)
    if env.json?
      env.json!
      record
    else
      "Record #{record} created"
      # TODO: redirect to /record/:id
    end
  rescue e
    "Cannot create this record"
    # TODO: http error
  end
end
