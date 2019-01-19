$(document).on('turbolinks:load', function() {
  $('#country_id').on('change', function() {
    var region_select = document.getElementById('region_id')
    var country_id = $(this).val()

    $.get('/admin/api/regions?country_id=' + country_id, function (data) {
      var regions_with_blank = [{
        name: '',
        id: ''
      }].concat(data.regions);

      region_select.options.length = 0

      $.each(regions_with_blank, function (pos, region) {
        region_select.options[region_select.options.length] = new Option(region.name, region.id, false, false)
      })
    })
  })
})
