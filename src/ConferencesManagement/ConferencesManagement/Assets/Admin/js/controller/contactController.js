var contact = {
    init: function () {
        contact.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Contact/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {

                    console.log(response);
                    btn.text('set Contact');
                    window.location.reload();

                }
            });
        });
    }
}
contact.init();