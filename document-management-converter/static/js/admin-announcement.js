const selectedSet = new Set();
let totalItem = $('.data-item-checkbox-item').length;

$('.ui.dropdown')
  .dropdown()
  ;

function checkAllChecked() {
  if (selectedSet.size === totalItem)
    $('.data-item-checkbox-all').checkbox('set checked');
  else if (selectedSet.size === 0)
    $('.data-item-checkbox-all').checkbox('set unchecked');
  else
    $('.data-item-checkbox-all').checkbox('set indeterminate');

  if (selectedSet.size === 0)
    $('#admin-data-delete-selected').addClass("disabled");
  else
    $('#admin-data-delete-selected').removeClass("disabled");
}

checkAllChecked();

$('.data-item-checkbox-item')
  .checkbox({
    onChecked() {
      selectedSet.add($(this).data("id"));
      checkAllChecked();
    },
    onUnchecked() {
      selectedSet.delete($(this).data("id"));
      checkAllChecked();
    }
  });

$('.data-item-checkbox-all')
  .checkbox({
    onChecked() {
      $('.data-item-checkbox-item').checkbox('check')
    },
    onUnchecked() {
      $('.data-item-checkbox-item').checkbox('uncheck')
    }
  });

$('#admin-data-delete-selected')
  .click(async function () {
    await axios({
      url: '/admin/announcement',
      method: 'delete',
      data: Array.from(selectedSet)
    });
    location.reload();
  });

$('#admin-data-insert')
  .click(function () {
    $('#add-announcement-modal').modal('show')
  });

$('#add-announcement-form')
  .form({
    fields: {
      content: 'empty',
    }
  })
  ;