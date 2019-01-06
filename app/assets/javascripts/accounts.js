$(document).ready(function() {
  $('#account_address_attributes_country_id').on('change', function() {
    var region_select = document.getElementById('account_address_attributes_region_id')
    var city_select = document.getElementById('account_address_attributes_city_id')
    var country_id = $(this).val()

    $.get('/admin/api/regions?country_id=' + country_id, function (data) {
      var regions_with_blank = [{
        name: '',
        id: ''
      }].concat(data.regions);

      region_select.options.length = 0
      city_select.options.length = 0

      $.each(regions_with_blank, function (pos, region) {
        region_select.options[region_select.options.length] = new Option(region.name, region.id, false, false)
      })
    })
  })

  $('#account_address_attributes_region_id').on('change', function() {
    var city_select = document.getElementById('account_address_attributes_city_id')
    var region_id = $(this).val()

    $.get('/admin/api/cities?region_id=' + region_id, function (data) {
      var cities_with_blank = [{
        name: '',
        id: ''
      }].concat(data.cities);

      city_select.options.length = 0

      $.each(cities_with_blank, function (pos, region) {
        city_select.options[city_select.options.length] = new Option(region.name, region.id, false, false)
      })
    })
  })
})
