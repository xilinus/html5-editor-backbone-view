editorTemplate = require('templates/editor')

class exports.EditorView extends Backbone.View
  tagName: "div"
  className: "editor"
    
  events: 
    'click .control_B': 'bold'
    'click .control_I': 'italic'
    'click .control_U': 'underline'
    'click .save'     : 'save'

  initialize: ()->
    key('⌘+b, ctrl+b', @bold)
    key('⌘+i, ctrl+i', @italic)
    key('⌘+u, ctrl+u', @underline)
    $(@el).delegate('.message', 'keyup', @save)

  bold: () ->
    document.execCommand('bold', false, '')
    false

  italic: () ->
    document.execCommand('italic', false, '')
    false
    
  underline: () ->
    document.execCommand('underline', false, '')
    false
    
  save: (event) =>
    @model.set(text: @$(".message").html()).save()    
  
  render: () ->
    $(@el).html editorTemplate()
    @$(".message").html(@model.get('text'))
    @$(".message").attr('contenteditable', true)
    @
