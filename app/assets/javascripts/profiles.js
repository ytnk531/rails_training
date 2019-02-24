$(document).on('turbolinks:load', function() {
  $('select').formSelect();
  $('#work_experiences')
      .on('cocoon:after-insert', function() {
          $('select').formSelect();
      });
});
