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
      url: '/admin/entry',
      method: 'delete',
      data: Array.from(selectedSet)
    });
    location.reload();
  });

$('#admin-data-insert')
  .click(function () {
    $('#add-entry-modal').modal('show')
  });

$('#add-entry-form')
  .form({
    fields: {
      name: 'empty',
      description: 'empty',
    }
  })
  ;

$('#update-entry-modal')
  .form({
    fields: {
      name: 'empty',
      description: 'empty',
    }
  })
  ;

$('.admin-data-update')
  .click(function () {
    const parent = $(this).parent().parent();
    const data = ["name", "description"]
    data.forEach(item => $('#update-entry-modal').find(`*[name='${item}']`).val(parent.find(`td[data-name='${item}']`).text())
    )

    $('#update-entry-modal').find(`*[name='id']`).val($(this).data("id"));

    $('#update-entry-modal').modal('show')
  });