$('.data-item-checkbox-item')
  .checkbox({
    onChecked() {
      console.log($(this).data(index))
    }
  });

console.log("hello")