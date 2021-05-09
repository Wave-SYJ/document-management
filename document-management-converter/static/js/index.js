
$('#search-pane-type-menu.ui.menu .ui.dropdown').dropdown({
  on: 'hover'
});

$('#search-pane-type-menu.ui.menu a.item')
  .on('click', function () {
    $("#search-input input[name='searchType']")
      .val($(this).data('type'));

    $(this)
      .addClass('active')
      .siblings()
      .removeClass('active');
  })