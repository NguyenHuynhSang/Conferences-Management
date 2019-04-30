var contact = {
    init: function () {
        contact.registerEvents();
    },
    registerEvents: function () {
        $('#btnSend').off('click').on('click', function () {
            var name = $('#txtName').val();
            var email = $('#txtEmail').val();
            var tieude = $('#txtTieuDe').val();
            var content = $('#txtContent').val();


            $.ajax({
                url: '/Contact/Send',
                type: 'POST',
                dataType: 'json',
                data: {
                    name: name,
                    email: email,
                    tieude: tieude,
                    content: content

                },
                success: function (res) {
                    if (res.status == true) {
                        window.alert('Gửi thành công');
                        contact.resetForm();

                    }

                }

            });
        });

    },
    resetForm: function () {
        $('#txtName').val();
        $('#txtEmail').val();
        $('#txtTieuDe').val();
        $('#txtContent').val();
    }
}

contact.init();