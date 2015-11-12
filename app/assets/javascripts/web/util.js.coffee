ws.common = {} unless ws.common?

ws.common.util = do ->

  initAceEditor = ->
    # $('#project_description')
    $(document).ready ->
      if $('#textEditor').length > 0
        editor = ace.edit('textEditor')
        editor.setTheme "ace/theme/twilight"
        editor.getSession().setMode("ace/mode/html")
        editor.session.setUseWrapMode(true)

        editor.getSession().setValue($("#project_description").val())

        $("#project_description").hide()
        $(".edit_project").submit (e) ->
          #e.preventDefault()
          $("#project_description").val editor.getSession().getValue()
          #$(this).submit()
          return
        return



  initFoundaiton = ->
    $(document).foundation()

  init: ->
    # This should run all the time
    initFoundaiton()
    initAceEditor()
