.record-new.col-md-12
  form action="/records" method="post"
    fieldset
      legend New record
      label.label-control for="title" Title
        input.form-control name="title" type="text"
      label.label-control for="data" Data
        input.form-control name="data" type="text"
      label.label-control for="description" Description
        input.form-control name="description" type="text"
      label.label-control for="category_id" Category ID
        input.form-control name="category_id" type="text"
      input.form-control type="submit" value="Save"

#recents.record-list.col-md-6
  h2
    | Recents
  - recents.each_with_index do |recent, i|
    - data = recent["data"]
    - title = recent["title"]
    - description = recent["description"]
    .panel.panel-default
      .panel-heading
        a href="#{data}"
          = "#{title}"
        a href="\#recent-#{i}" aria-expanded="false" data-toggle="collapse"
          | More
      .collapse id="recent-#{i}"
        .panel-body
          = "#{description}"

#bests.record-list.col-md-6
