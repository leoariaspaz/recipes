# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
remove_task = (e) ->
  e.preventDefault()
  console.log '.remove_task'
  $(this).closest('.task').remove()
  false

ready = ->
	$('#add_task').click (e) ->
    e.preventDefault()
    console.log '#add_task click'
    $.get('/tasks/new_task')
    false

  $('#tasks').on("click", '.remove_task', remove_task)


$(document).on("turbolinks:load", ready)