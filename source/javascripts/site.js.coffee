#= require vendor/jquery
#= require foundation/foundation
#= require foundation/foundation.abide
#= require foundation/foundation.alert
#= require foundation/foundation.dropdown
#= require foundation/foundation.joyride
#= require foundation/foundation.magellan
#= require foundation/foundation.orbit
#= require foundation/foundation.tab
#= require foundation/foundation.topbar
#= require foundation/foundation.accordion
#= require foundation/foundation.clearing
#= require foundation/foundation.interchange
#= require foundation/foundation.offcanvas
#= require foundation/foundation.reveal
#= require foundation/foundation.tooltip
#= require vendor/readmore

jQuery ->
  $(document).foundation()        

  $('.active .readmore').readmore
    maxHeight: 100
    moreLink: '<a href="#" class="button secondary radius tiny">Read More</a>'
    lessLink: '<a href="#" class="button secondary radius tiny">Close</a>'

  $('#scholarship-tabs').on 'toggled', (event, tab, target) ->
    $('.readmore', target).readmore
      maxHeight: 100
      moreLink: '<a href="#" class="button secondary radius tiny">Read More</a>'
      lessLink: '<a href="#" class="button secondary radius tiny">Close</a>'
  
$('[data-tab-proxy]').on 'change', (e) ->
  tabs = $(e.target).attr('data-tab-proxy')
  id   = $(e.target).val()
  $("[href='#{id}']", tabs).click()
  
  
