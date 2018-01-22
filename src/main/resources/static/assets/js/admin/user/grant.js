$(document).ready(function () {
    $("#frm").validate({
        rules: {},
        messages: {},
        submitHandler:function(form){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${ctx!}/admin/user/grant/" + $(form).getElementsByTagName("id").val(),
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