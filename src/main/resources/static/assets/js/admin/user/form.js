$(document).ready(function () {
    //外部js调用
    laydate({
        elem: '#birthday', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    });

    $("#frm").validate({
        rules: {
            userName: {
                required: true,
                minlength: 4,
                maxlength: 10
            },
            nickName: {
                required: true,
                minlength: 4,
                maxlength: 10
            },
            sex: {
                required: true
            },
            birthday: {
                date:true,
                required: true
            },
            telephone: {
                required: true
            },
            email: {
                email:true,
                required: true
            },
            address: {
                required: true,
                maxlength: 40
            },
            locked: {
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
                url: "${ctx!}/admin/user/edit",
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