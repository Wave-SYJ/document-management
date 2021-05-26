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
      url: '/paper',
      method: 'delete',
      data: Array.from(selectedSet)
    });
    location.reload();
  })

$('#admin-data-insert')
  .click(function () {
    $('#add-paper-modal').modal('show')
  });

$('#add-paper-form')
  .form({
    fields: {
      title: 'empty',
      author: 'empty',
      author_office: 'empty',
      abstract: 'empty',
      keyword: 'empty'
      //journal: 'empty',
      //publishtime: 'empty',
    }
  })
  ;

<<<<<<< HEAD
<<<<<<< HEAD
$("#add-paper-form input[name='journalTitle']").keyup(async function () {
  $("#submit-insert").attr('disabled',true);
  const title = $(this).val();
  const id = (await axios.get("/journal/id?title=" + title)).data;
  $("#add-paper-form input[name='journalId']").val(id)
  if (id || title === "")
    $("#submit-insert").attr('disabled',false);
});

$("#update-paper-form input[name='journalTitle']").keyup(async function () {
  $("#submit-update").attr('disabled',true);
  const title = $(this).val();
  const id = (await axios.get("/journal/id?title=" + title)).data;
  $("#update-paper-form input[name='journalId']").val(id)
  if (id || title === "")
    $("#submit-update").attr('disabled',false);
});
=======
=======
>>>>>>> scy

  $('.admin-data-bind')
  .click(async function () {
    const paperId = $(this).data("id");
    $('#bind-entry-modal').find(`*[name='id']`).val(paperId);
    const { data } = await axios({
      url: '/paper/entry?id=' + paperId
    });
    $('#bind-entry-modal').find(`*[name='entries']`).val(data.join("\n"));
    $('#bind-entry-modal').modal('show')
  });

<<<<<<< HEAD
>>>>>>> scy
=======
>>>>>>> scy

  $('.admin-data-update')
  .click(function () {
    const parent = $(this).parent().parent();
    const data = ["paperAbstract", "title", "keyword", "author", "authorOffice","publishTime"]
    data.forEach(item => $('#update-paper-modal').find(`*[name='${item}']`).val(parent.find(`td[data-name='${item}']`).text())
    )

    $('#update-paper-modal').find(`*[name='id']`).val($(this).data("id"));

    $('#update-paper-modal').modal('show')
  });
