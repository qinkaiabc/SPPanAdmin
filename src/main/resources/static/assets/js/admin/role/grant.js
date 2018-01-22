var setting = {
    check : {
        enable : true
    },
    data : {
        simpleData : {
            enable : true
        }
    }
};
setting.check.chkboxType = {
    "Y" : "ps",
    "N" : "s"
};
$(document).ready(function() {
    $.ajax({
        type : "POST",
        url : "${ctx!}/admin/resource/tree/" + $("#roleId").val(),
        dataType : 'json',
        success : function(msg) {
            $.fn.zTree.init($("#tree"), setting, msg);
        }
    });

    $("#btnSave").click(function (){
        var treeObj = $.fn.zTree.getZTreeObj("tree");
        var nodes = treeObj.getCheckedNodes(true);
        var selectIds="";
        for(var index in nodes){
            var item=nodes[index];
            selectIds+=item.id+",";
        }
        $.ajax({
            url : "${ctx!}/admin/role/grant/" + $("#roleId").val() + "?t=Math.random()",
            type : "post",
            dataType : "json",
            data : {"resourceIds":selectIds},
            success : function(msg) {
                layer.msg(msg.message, {time: 2000},function(){
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index);
                });
            },
            error : function(r,s,m) {
            }
        });

    });
});