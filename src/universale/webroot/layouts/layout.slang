doctype html
html
  head
    title
      | Universale Download
    link rel="stylesheet" type="text/css" href="/assets/css/bootstrap-3.3.7-dist/css/bootstrap.min.css"
    link rel="stylesheet" type="text/css" href="/assets/css/style.css"
    script type="text/javascript" src="/assets/js/jquery-3.1.0.slim.min.js"
    script type="text/javascript" src="/assets/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"
  body
    header
      h1
        img src="/assets/images/icon-h.png" alt="Universale Download" class="img-thumbnail"
      nav
        ul
          a.btn.btn-primary href="/"
            | Go Home
          /- Category.first(5).each do |category|
          /  - name = category["name"]
          /  a.btn.btn-default href="/categories/#{name}/records"
          /    = name
    #content.container
      == content
