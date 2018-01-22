$(document).ready(function () {
    $("#frm").validate({
        rules: {
            name: {
                required: true,
                minlength: 4,
                maxlength: 20
            },
            sourceKey: {
                required: true,
                minlength: 4,
                maxlength: 40
            },
            type: {
                required: true
            },
            sourceUrl: {
                required: true
            },
            level: {
                required: true,
                number:true
            },
            sort: {
                number:true,
                required: true
            },
            icon: {
                maxlength: 40
            },
            isHide: {
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
                url: "${ctx!}/admin/resource/edit",
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