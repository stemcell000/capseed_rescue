
    console.debug('select2 is initialized in this DOM!');
  $(".select2-select").select2({
        theme: "bootstrap",
        tag: true,
        placeholder: "Select",
        tokenSeparators: [',', ' '],
        allowClear: true
    });
