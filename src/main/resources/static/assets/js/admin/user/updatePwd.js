$(document).ready(function () {
    $("#frm").validate({
        rules: {
            oldPassword: {
                required: true,
                minlength: 4,
                maxlength: 10
            },
            password1: {
                required: true,
                minlength: 4,
                maxlength: 10
            },
            password2: {
                required: true,
                minlength: 4,
                maxlength: 10
            }
        },
        messages: {},
        submitHandler:function(form){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${ctx!}/admin/user/updatePwd",
                data: $(form).serialize(),
                success: function(msg){
                    if(msg.code ==0){
                        window.location.href = "${ctx!}/admin/logout";
                    }
                    layer.msg(msg.message, {time: 2000},function(){
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index);
                    });
                }
            });
        }
    });
});