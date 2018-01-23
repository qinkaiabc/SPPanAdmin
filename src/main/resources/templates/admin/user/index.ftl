<#include "/admin/layout/layout.ftl">
<#import "/admin/layout/macro.ftl" as macro>
<#assign css>
<style>
</style>
</#assign>
<#assign js>
    <script>

    </script>
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
                    <th>操作</th>
                </tr>
                <#list pageInfo.content as userInfo>
                <tr>
                    <td>${userInfo.id}</td>
                    <td>${userInfo.userName}</td>
                    <td>${userInfo.nickName}</td>
                    <td>
                        <#if userInfo.sex == 1>
                            <span class="label label-success">男</span>
                        <#elseif userInfo.sex == 0>
                            <span class="label label-danger">女</span>
                        <#else >
                            <span class="label label-warning">未知</span>
                        </#if>
                    </td>
                    <td>${userInfo.telephone}</td>
                    <td>${userInfo.email}</td>
                    <td>${userInfo.address}</td>
                    <td>
                        <#if userInfo.deleteStatus == 1>
                            <span class="label label-danger">已删除</span>
                        <#else>
                            <span class="label label-success">未删除</span>
                        </#if>
                    </td>
                    <td>
                        <#if userInfo.locked == 1>
                            <span class="label label-danger">已锁定</span>
                        <#else>
                            <span class="label label-success">未锁定</span>
                        </#if>

                    </td>
                    <td>${userInfo.createTime}</td>
                    <td>
                    <@shiro.hasPermission name="system:user:edit">
                        <a class="btn btn-sm btn-primary" href="${ctx!}/admin/user/edit/${userInfo.id}">编辑</a>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="system:user:grant">
                        <button class="btn btn-sm btn-success">分配角色</button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="system:user:deleteBatch">
                        <button class="btn btn-sm btn-danger">删除</button>
                    </@shiro.hasPermission>
                    </td>
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