<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <?xml version="1.0" encoding="UTF-8"?>
</head>
<style type="text/css">
    .container-fluid{
        margin: 0;
        height: calc(100vh);
        padding-top: 10%;
        background-color: #272121;
        font-family: "微软雅黑";
    }
</style>
<body>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <div class="container-fluid" id="app">
        <div class="row" >
            <div class="col-md-4 col-md-offset-4" style="background-color: #252e37; width: 482px; height: 363px;">
                <div class="row" style="margin-top: 10%;margin-bottom: 5%;">
                    <div class="col-md-12">
                            <h2 style="color: #237dd4; text-align: center;">用 户 登 录</h2>
                    </div>
                </div>
                <div class="row" style="margin:5%">
                    <div class="col-md-12">
                        <input type="text" class="form-control"  placeholder="用户名：" v-model="username">
                    </div>
                </div>
                <div class="row" style="margin:5%">
                    <div class="col-md-12">
                        <input type="password" class="form-control" placeholder="密码：" v-model="password">
                    </div>
                </div>
                <div class="row" style="margin-top: 5%;">
                    <div class="col-md-3 col-md-offset-5" style="padding: 2%;">
                        <button type="button" class="btn btn-default" @click="register()"
                            style="height: 48px; width: 100%; padding: 10px; background-color: #263f5e; color: #2785a2;">注 册</button>
                    </div>
                    <div class="col-md-3" style="padding: 2%;">
                        <button type="button" class="btn btn-default" @click="login()"
                        style="height: 48px; width: 100%; padding: 10px; background-color: #2a5492; color: #2785a2;">登 录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    const { createApp } = Vue

    createApp({
    data() {
        return {
            'username':'',
            'password':'',
        }
    },
    methods:{
        login(){
            var that = this
            $.ajax({
                type:"POST",
                url:"/financeManager/doLogin",
                data:{
                    "username":that.username,
                    "password":that.password,
                },
                dataType:'json',
                success:function(data){
                    if(data.success){
                        window.location.href="index";
                    }else{
                        alert(data.error)
                    }
                },
                error:function(data){
                    console.log(data)
                }
            })
        },
        register(){
            window.location.href="register";
        }
    }
    }).mount('#app')
</script>


</body>
</html>