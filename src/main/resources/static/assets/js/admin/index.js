function updatePwd(){
    layer.open({
        type: 2,
        title: '修改密码',
        shadeClose: true,
        shade: false,
        area: ['893px', '600px'],
        content: '${ctx!}/admin/user/updatePwd',
        end: function(index){
            window.location.reload();
        }
    });
}