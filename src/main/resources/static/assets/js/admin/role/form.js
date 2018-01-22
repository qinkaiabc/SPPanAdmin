$(document).ready(function () {
    $("#frm").validate({
        rules: {
            roleKey: {
                required: true,
                minlength: 4,
                maxlength: 30
            },
            name: {
                required: true,
                minlength: 4,
                maxlength: 30
            },
            status: {
                required: true
            },
            description: {
                required: true,
                maxlength: 40
            }
        },
        messages: {},
        submitHandler:function(form){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${ctx!}/admin/role/edit",
                data: $(form).serialize(),
                success: function(msg){
                    layer.msg(msg.message, {time: 2000},function(){
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index);
                    });
                }
            });
        }
    });
});