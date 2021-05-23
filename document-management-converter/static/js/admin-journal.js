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
  })

$('#admin-data-delete-selected')
  .click(async function () {
    await axios({
      url: '/journal',
      method: 'delete',
      data: Array.from(selectedSet)
    });
    location.reload();
  })

$('#admin-data-insert')
  .click(function () {
    $('#add-journal-modal').modal('show')
  });

$('#add-journal-form')
  .form({
    fields: {
      title: 'empty',
      organizerOffice: 'empty',
      image: 'empty',
      language: 'empty',
      issn: 'empty',
    }
  })
  ;

$('.admin-data-bind')
  .click(async function () {
    const paperId = $(this).data("id");
    $('#bind-entry-modal').find(`*[name='id']`).val(paperId);
    const {data} = await axios({
      url: '/journal/entry?id=' + paperId
    });
    $('#bind-entry-modal').find(`*[name='entries']`).val(data.join("\n"));
    $('#bind-entry-modal').modal('show')
  });