var hoithao = {
    init: function () {
        hoithao.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/HoiThao/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                   
                    console.log(response);
                    btn.text('set Hội thảo');
                    window.location.reload();    
   
                }
            });
        });
    }
}
hoithao.init();