<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>经费管理系统</title>
    <?xml version="1.0" encoding="UTF-8"?>
</head>
<style type="text/css">
    .container-fluid{
        font-family: "微软雅黑";
        background-color: #e6ebf5;
        height: calc(100vh);
    }
   #main-window{
    height: calc(100vh);
    background-color: white;
    margin-left: 172px; 
    margin-right: 172px;
    padding-left: 70px;
    padding-right: 70px;
    padding-top: 40px;
    }
    .striped {
        width: 100%;
        border-collapse: collapse;
    }

    .striped th,
    .striped td {
        border-bottom: 1px solid #b4bccc;
        padding: 10px;
    }
    .striped tbody tr{
        color: #2d2f33;
    }

    .striped tbody tr:nth-child(odd) {
        background-color: #fff;
    }
    .striped th{
        background-color: #ecf1f9;
        color: #a08d99;
    }
    .striped tbody tr:nth-child(even) {
        background-color: #ecf1f9;
    }
    .nonstyle-btn{
        border: none;
        outline: none;
        background-color: transparent;
        color: inherit;
        font-size: inherit;
        cursor: pointer;
        padding: 0;
        margin: 0;
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
        <div class="row" id="main-window">
            <div class="col-md-12" >
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-md-2 col-md-offset-10">
                        <button class="btn btn-default"  @click="exportUser($event)" class="btn" style="border-color: #cfd6e4; width: 118px;">导出用户信息</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" style="font-size: 16px;">
                        <table class="table striped" style="margin-bottom: 10px;">
                        <thead>
                                <tr>
                                <th v-for="th in ths" class=" text-center">
                                        <span>{{th}}</span>
                                </th>
                                </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(line,index) in displayIines" :key="index">
                                <td>
                                    <span>{{line.userName}}</span>
                                </td>
                                <td>
                                        <span>{{line.loginName}}</span>
                                </td>
                                <td>
                                        <span>{{line.idNo}}</span>
                                </td>
                                <td>
                                        <span>{{line.phoneNo}}</span>
                                </td>                             
                                <td >
                                    <div style="color: #2d2f33;">
                                        <button class="nonstyle-btn" @click="edit($event,line.id)">
                                            <span >编辑 |</span>&nbsp;
                                        </button>
                                        <button class="nonstyle-btn" @click="del($event,index)">
                                            <span >删除</span>
                                        </button>
                                    </div>
                                        
                                </td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3" style="padding-right: 0;">
                        <p style="height: 34px; margin: 0; line-height: 34px; font-size: 15px;" >{{recodeText}}</p>
                    </div>
                    
                    <div class="col-md-3 col-md-offset-6">
                        <nav aria-label="Page navigation" style="text-align: right;">
                            <ul class="pagination" style="margin: 0;">
                            <li>
                                <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="active"><a href="#">1</a></li>
                            <li class="disabled"><a href="#">{{curPage}}页</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            </ul>
                        </nav>
                    </div>
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
                ths:["姓名","用户名","身份证号","手机号","操作"],
                items:[
                    {id:1,userName:'张三',loginName:'zhangsan',idNo:'320121199999999',phoneNo:'13888888888'},
                    {id:2,userName:'李四',loginName:'lisi',idNo:'320121188888888',phoneNo:'13999999999'},
                ],
                start : 0,
                nums : 6,
                editIndex: -1,
                editItems:{},

            };
        },
        mounted:function(){
            var that = this
            $.ajax({
                type:"POST",
                url:"/financeManager/getUsers",
                dataType:'json',
                success:function(data){
                    console.log(data)
                    that.items = data.data
                },
                error:function(data){
                    console.log(data)
                }
            })
        },
        computed:{
            displayIines(){
                var end = this.start+this.nums
                end = end>this.items.length?this.items.length:end
                return this.items.slice(this.start,end);
            },
            recodeText(){
                var end = this.start+this.nums
                end = end>this.items.length?this.items.length:end
                
                return "共"+this.items.length+"条记录，当前显示第"+(this.start+1)+"-"+end+"条"
            },
            curPage(){
                return (this.start/this.nums+1)+"/"+Math.ceil(this.items.length/this.nums)
            },
            
        },
        methods:{
            edit(event,index){
                var that = this
                $.ajax({
                    type:"POST",
                    url:"/financeManager/editUser",
                    data:{
                        "id":index,
                    },
                    dataType:'json',
                    success:function(data){
                        window.location.href="userEdit";
                    },
                    error:function(data){
                        console.log(data)
                    }
                })   
            },
            del(event,id){
                var that = this

                let del_id = this.start+id
                console.log(del_id)
                $.ajax({
                    type:"POST",
                    url:"/financeManager/deleteUser",
                    data:{
                        "id":that.items[del_id].id,
                    },
                    dataType:'json',
                    success:function(data){
                        that.items.splice(del_id,1)
                    },
                    error:function(data){
                        console.log(data)
                    }
                })
            },
            exportUser(event){
                window.location.href="download";
            }
        }
    }).mount('#app')
</script>


</body>
</html>