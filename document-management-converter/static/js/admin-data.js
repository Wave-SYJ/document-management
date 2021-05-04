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
}

$('.data-item-checkbox-item')
  .checkbox({
    onChecked() {
      selectedSet.add($(this).data("index"));
      checkAllChecked();
    },
    onUnchecked() {
      selectedSet.delete($(this).data("index"));
      checkAllChecked();
    }
  });

$('.data-item-checkbox-all')
  .checkbox({
    onChecked() {
      $('.data-item-checkbox-item').checkbox('set checked')
    },
    onUnchecked() {
      $('.data-item-checkbox-item').checkbox('set unchecked')
    }
  })
