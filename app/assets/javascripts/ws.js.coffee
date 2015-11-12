window.ws = do ->

  _initSorting = ->
    # el = document.getElementById('sortable-list');

    # options =
    #   handle: ".draghandle"
    #   onEnd: _handleOnEnd

    # sortable = Sortable.create(el, options);

    $('#sortable-list').sortable
      items: '.project'
      containment: 'parent'
      handle: ".draghandle"
      update: ->
        _updateSequence($(this).sortable('toArray'))

  _handleOnEnd = (evt) ->
    _updateSequence(evt.item.dataset.projectId, evt.newIndex)

  _updateSequence = (data) ->
    $.ajax
      type: 'POST'
      url: "/projects_sort"
      data:
        'ids': data
      onsuccess: (data) ->
        console.log data

  init: ->
    # ws.projects.init()
    ws.common.util.init()
    _initSorting()
    # ahoy.trackAll()
    return true


$(ws.init)
