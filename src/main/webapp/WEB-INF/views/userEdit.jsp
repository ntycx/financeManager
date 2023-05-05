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
    .biaodan >div{
        height: 32px;
        line-height: 32px;
    }
    #input{
        height: 32px;
        width: 286px;
        padding: auto;
    }
   #app{
        font-family: '微软雅黑';
        font-size: 16px;
   }
</style>
<body>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <div class="container-fluid text-center" id="app">
        <div class="row head-title">
            <div class="col-md-1 col-md-offset-2">
                <h3>用户修改</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 col-md-offset-2">
                <div class="row">
                    <div class="col-md-2">
                        <h4 style="color: #2d2f33;">基本信息</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <div class="row biaodan">
                    <div class="col-md-1" >
                        <span style="color: #ff0000;">*</span><span style="color: #73777d;">用户名</span>
                    </div>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="input" placeholder="请输入用户名" v-model="loginName">
                    </div>
                    <div class="col-md-1" >
                        <span style="color: #ff0000;">*</span><span style="color: #73777d;">姓名</span>
                    </div>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="input" placeholder="请输入姓名" v-model="userName">
                    </div>
                </div>
                <div class="row biaodan">
                    <div class="col-md-1" >
                        <span style="color: #ff0000;">*</span><span style="color: #73777d;">密码</span>
                    </div>
                    <div class="col-md-5">
                        <input type="password" class="form-control" id="input" placeholder="请输入密码" v-model="password">
                    </div>
                    <div class="col-md-1" >
                        <span style="color: #ff0000;">*</span><span style="color: #73777d;">核对密码</span>
                    </div>
                    <div class="col-md-5">
                        <input type="password" class="form-control" id="input" placeholder="与上个密码保持一致" v-model="check">
                    </div>
                </div>
                <div class="row biaodan">
                    <div class="col-md-1" >
                        </span><span style="color: #73777d;">手机号</span>
                    </div>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="input" placeholder="请输入手机号" v-model="phoneNo">
                    </div>
                    <div class="col-md-1" >
                        <span style="color: #73777d;">身份证号</span>
                    </div>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="input" placeholder="请输入身份证号" v-model="idNo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 col-md-offset-8">
                        <button type="button" class="btn btn-default" style="height: 32px; width: 62px;" @click="cancel()">取消</button>
                        <button type="button" class="btn btn-primary" style="background-color: #2985f7; height: 32px; width: 62px;" @click="confirm()">确认</button>
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
                userName:'',
                loginName:'',
                password:'',
                check:'',
                phoneNo:'',
                idNo:''
            }
        },
        mounted:function(){
            var that = this
            $.ajax({
                type:"POST",
                url:"/financeManager/getEditUserInfo",
                dataType:'json',
                success:function(data){
                    user = data.data
                    that.userName = user.userName
                    that.loginName = user.loginName
                    that.phoneNo = user.phoneNo
                    that.idNo = user.idNo
                },
                error:function(data){
                    console.log(data)
                }
            })
        },
        methods:{
            cancel(){
                window.location.href="manageUser";
            },
            confirm(){
                if(this.loginName==null){
                    alert("请输入用户名")
                }else if(this.userName==null){
                    alert("请输入昵称")
                }else if(this.password!==this.check){
                    alert('两次输入的密码不一致')
                }else{
                    user = {}
                    user['loginName']=this.loginName,
                    user['userName']=this.userName,
                    user['password']=this.password,
                    user['phoneNo']=this.phoneNo,
                    user['idNo']=this.idNo,
                    $.ajax({
                        type:"POST",
                        url:"/financeManager/updateUser",
                        contentType:'application/json',
                        data:JSON.stringify(user),
                        dataType:'json',
                        success:function(data){
                            alert('更新成功')
                            window.location.href="manageUser";
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