<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <?xml version="1.0" encoding="UTF-8"?>
</head>
<style type="text/css">

    .head-title{
        text-align: right;
        color:#2d2f33;
        background-color: #F4F7Fd;
        margin-bottom: 20px;
    }
    .biaodan{
        margin-top: 20px;
        margin-bottom: 20px;
    }
    #username{
        height: 32px;
        width: 286px;
    }
</style>
<body>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<div id="app">
    <div class="container-fluid text-center" >
        <div class="row head-title">
            <div class="col-md-1">
                <h3>用户注册</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-1">
                <h4 style="color: #2d2f33;">基本信息</h4>
            </div>
            <div class="col-md-2" style=" padding-top: 10px; text-align: left; color: #a2aabb;">
                <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
                <span>默认密码 (000000)</span>
            </div>
        </div>
        <div class="row biaodan">
            <div class="col-md-1" >
                <span style="color: #ff0000;">*</span><span style="color: #73777d;">用户名</span>
            </div>
            <div class="col-md-5">
                <input type="text" class="form-control" id="loginName" placeholder="请输入用户名" v-model="loginName">
            </div>
            <div class="col-md-1" >
                <span style="color: #ff0000;">*</span><span style="color: #73777d;">姓名</span>
            </div>
            <div class="col-md-5">
                <input type="text" class="form-control" id="username" placeholder="请输入姓名" v-model="username">
            </div>
        </div>
        <div class="row biaodan">
            <div class="col-md-1" >
                <span style="color: #ff0000;">*</span><span style="color: #73777d;">密码</span>
            </div>
            <div class="col-md-5">
                <input type="text" class="form-control" id="password" placeholder="请输入密码" v-model="password">
            </div>
            <div class="col-md-1" >
                <span style="color: #ff0000;">*</span><span style="color: #73777d;">核对密码</span>
            </div>
            <div class="col-md-5">
                <input type="text" class="form-control" id="checkedPassword" placeholder="与上个密码保持一致" v-model="checkedPassword">
            </div>
        </div>
        <div class="row biaodan">
            <div class="col-md-1" >
                </span><span style="color: #73777d;">手机号</span>
            </div>
            <div class="col-md-5">
                <input type="text" class="form-control" id="phoneNo" placeholder="请输入手机号" v-model="phoneNo">
            </div>
            <div class="col-md-1" >
                <span style="color: #73777d;">身份证号</span>
            </div>
            <div class="col-md-5">
                <input type="text" class="form-control" id="idNo" placeholder="请输入身份证号" v-model="idNo">
            </div>
        </div>
    </div>
    <footer class="navbar-fixed-bottom">
        <hr>
        <div class="container-fluid text-center">
          <div class="row" style="margin-bottom: 20px;">
                <div class="col-md-2 col-md-offset-10">
                    <button type="button" class="btn btn-default" style="height: 32px; width: 62px;" @click="login()">取消</button>
                    <button type="button" class="btn btn-primary" style="background-color: #2985f7; height: 32px; width: 62px;" @click="register()">确认</button>
                </div>
          </div>
        </div>
    </footer>
</div>    
    
<script>
    const { createApp } = Vue
    
    createApp({
        data() {
            return {
                'loginName':'',
                'username':'',
                'password':'',
                'checkedPassword':'',
                'phoneNo':'',
                'idNo':''
            }
        },
        methods:{
            login(){
                window.location.href="login";
            },
            register(){
                if(this.loginName==null){
                    alert("请输入用户名")
                }else if(this.username==null){
                    alert("请输入昵称")
                }else if(this.password!=this.checkedPassword){
                    alert('两次输入的密码不一致')
                }else{
                    user = {}
                    user['loginName']=this.loginName,
                    user['userName']=this.username,
                    user['password']=this.password,
                    user['phoneNo']=this.phoneNo,
                    user['idNo']=this.idNo,
                    $.ajax({
                        type:"POST",
                        url:"/financeManager/doRegister",
                        contentType:'application/json',
                        data:JSON.stringify(user),
                        dataType:'json',
                        success:function(data){
                            alert('注册成功')
                            window.location.href="login";
                        },
                        error:function(data){
                            console.log(data)
                        }
                    })
                }
            }
        }
    }).mount('#app')
</script>


</body>
</html>