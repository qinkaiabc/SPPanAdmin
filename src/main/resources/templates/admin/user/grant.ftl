<#include "/admin/layout/layout.ftl">
<#import "/admin/layout/macro.ftl" as macro>
<#assign css>

</#assign>
<#assign js>
<script>
    $(".btn-submit").click(function () {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${ctx!}/admin/user/grant/" + ${user.id},
            data: $(".form-grant").serialize(),
            success: function (res) {
                layer.msg(res.message, {time: 2000}, function () {
                    location.reload();
                });
            }
        });
    });
    $(".btn-back").click(function () {
        window.history.back();
    });
</script>
</#assign>
<@layout title="用户管理" active="user">
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        角色分配
        <small>一切从这里开始</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-cog"></i> 系统</a></li>
        <li><a href="#"><i class="fa fa-list-ul"></i> 用户管理</a></li>
        <li class="active"><i class="fa fa-edit"></i> 角色分配</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-10">
            <!-- Default box -->
            <div class="box  box-primary">
                <div class="box-body">
                    <form class="form-horizontal form-grant" method="post" action="${ctx!}/admin/user/save">
                        <input type="hidden" id="id" name="id" value="${user.id}">
                        <div class="form-group">
                            <#list roles as role>
                                <div class="col-sm-12">
                                    <div class="checkbox i-checks">
                                        <label>
                                        <#if roleIds?seq_contains(role.id)>
                                            <input type="checkbox" value="${role.id}" name="roleIds" checked="checked"> <i></i> ${role.name}
                                        <#else>
                                            <input type="checkbox" value="${role.id}" name="roleIds"> <i></i> ${role.name}
                                        </#if>
                                        </label>
                                    </div>
                                </div>
                            </#list>
                        </div>
                    </form>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-default btn-back">返回</button>
                    <button type="button" class="btn btn-info pull-right btn-submit">提交</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /.content -->
</@layout>