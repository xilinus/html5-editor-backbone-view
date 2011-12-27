window.app = {}
app.controllers = {}
app.models = {}
app.collections = {}
app.views = {}

MainController = require('controllers/main_controller').MainController
EditorView     = require('views/editor_view').EditorView 
Editor         = require('models/editor').Editor

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.controllers.main = new MainController()
    app.models.editor = new Editor(id: "demo")
    if app.models.editor.isNew()
      app.models.editor.save()
    else
      app.models.editor.fetch()
      
    app.views.editor = new EditorView(model: app.models.editor)    
    Backbone.history.saveLocation("home") if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
