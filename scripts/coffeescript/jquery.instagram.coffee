(($) ->
  $.fn.instagram = (options) ->
    createPhotoElement = (photo) ->
      $("<div>").addClass("instagram-placeholder").attr("id", photo.id).append $("<a>").attr("target", "_blank").attr("href", photo.link).append($("<img>").addClass("instagram-image").attr("src", photo.images.thumbnail.url))
    createEmptyElement = ->
      $("<div>").addClass("instagram-placeholder").attr("id", "empty").append $("<p>").html("No photos for this query")
    composeRequestURL = ->
      url = apiEndpoint
      params = {}
      return settings.next_url  if settings.next_url?
      if settings.hash?
        url += "/tags/" + settings.hash + "/media/recent"
      else if settings.search?
        url += "/media/search"
        params.lat = settings.search.lat
        params.lng = settings.search.lng
        settings.search.max_timestamp? and (params.max_timestamp = settings.search.max_timestamp)
        settings.search.min_timestamp? and (params.min_timestamp = settings.search.min_timestamp)
        settings.search.distance? and (params.distance = settings.search.distance)
      else if settings.userId?
        url += "/users/" + settings.userId + "/media/recent"
      else if settings.locationId?
        url += "/locations/" + settings.locationId + "/media/recent"
      else
        url += "/media/popular"
      settings.accessToken? and (params.access_token = settings.accessToken)
      settings.clientId? and (params.client_id = settings.clientId)
      settings.minId? and (params.min_id = settings.minId)
      settings.maxId? and (params.max_id = settings.maxId)
      url += "?" + $.param(params)
      url
    that = this
    apiEndpoint = "https://api.instagram.com/v1"
    settings =
      hash: null
      userId: null
      locationId: null
      search: null
      accessToken: null
      clientId: null
      show: null
      onLoad: null
      onComplete: null
      maxId: null
      minId: null
      next_url: null

    options and $.extend(settings, options)
    settings.onLoad? and typeof settings.onLoad is "function" and settings.onLoad()
    $.ajax
      type: "GET"
      dataType: "jsonp"
      cache: false
      url: composeRequestURL()
      success: (res) ->
        length = (if typeof res.data isnt "undefined" then res.data.length else 0)
        limit = (if settings.show? and settings.show < length then settings.show else length)
        if limit > 0
          i = 0

          while i < limit
            that.append createPhotoElement(res.data[i])
            i++
        else
          that.append createEmptyElement()
        settings.onComplete? and typeof settings.onComplete is "function" and settings.onComplete(res.data, res)

    this
) jQuery