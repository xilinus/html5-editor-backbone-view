class exports.MainController extends Backbone.Controller
  routes :
    "home": "home"

  home: ->
    $('body').html app.views.editor.render().el
