<#include "/admin/layout/layout.ftl">
<#import "/admin/layout/macro.ftl" as macro>
<#assign css>
<style>
</style>
</#assign>
<@layout title="用户管理" active="user">
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        用户列表
        <small>一切从这里开始</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-cog"></i> 系统</a></li>
        <li><a href="#"><i class="fa fa-list-ul"></i> 用户管理</a></li>
        <li class="active"><i class="fa fa-table"></i> 用户列表</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="box">
        <div class="box-body">
            <table class="table table-striped">
                <tr>
                    <th>ID</th>
                    <th>账户名</th>
                    <th>昵称</th>
                    <th>性别</th>
                    <th>电话</th>
                    <th>邮箱</th>
                    <th>住址</th>
                    <th>删除状态</th>
                    <th>锁定</th>
                    <th>创建时间</th>
                </tr>
                <#list pageInfo.content as userInfo>
                <tr>
                    <td>${userInfo.id}</td>
                    <td>${userInfo.userName}</td>
                    <td>${userInfo.nickName}</td>
                    <td>${userInfo.sex}</td>
                    <td>${userInfo.telephone}</td>
                    <td>${userInfo.email}</td>
                    <td>${userInfo.address}</td>
                    <td>${userInfo.deleteStatus}</td>
                    <td>${userInfo.locked}</td>
                    <td>${userInfo.createTime}</td>
                </tr>
                </#list>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <@macro.page pageInfo=pageInfo url="${ctx!}/admin/user/index?" />
        </div>
    </div>
    <!-- /.box -->

</section>
<!-- /.content -->
</@layout>