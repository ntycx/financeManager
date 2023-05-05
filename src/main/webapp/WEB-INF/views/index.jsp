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
   .header-style{
    background-color: #252d47;
   }
   .header-style div{
    height: 55px; 
    line-height: 55px; 
    color: white;
    font-size: 16px;
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
    .btn{
        width: 80px;
        background-color: #e9f3fe;
        color: #216df5;
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
    .modal-body .row{
        font-size: 16px;
        color: #8f9092;
        margin-top: 22px;
    }
    .modal-body .row>div{
        padding: 0;
    }
    .modal-body .row div:nth-of-type(2) *{
        width: 282px;
    }
    .logout >div >button{
        position: relative;
    }
    .logout div:nth-of-type(2) >button{
        position: absolute;
        bottom: -20px;
        left: 55px;
    }
    .hiddenState{
        visibility: hidden;
    }
    .admin{
        visibility: hidden;
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
  <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="font-family: '微软雅黑';">
        <div class="modal-dialog" role="document" style="margin-top: 150px;">
        <div class="modal-content" style="width: 500px; height: 542px;">
            <div class="modal-header" style="border: 0;">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h2 class="modal-title text-center" id="myModalLabel" style="color: #2d2f33;">添加新数据</h2>
            </div>
            <div class="modal-body" style="margin-left: 40px;">
            <div class="row">
                <div class="col-md-3">
                    <span>报销人:</span>
                </div>
                <div class="col-md-7">
                    <select class="form-control" v-model="newItem['role']">
                        <option v-for="role in reimbursers">{{role}}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <span>报销事由:</span>
                </div>
                <div class="col-md-7">
                    <input type="text" class="form-control" v-model="newItem['reason']" placeholder="请输入事由：">
                </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <span>收入/支出时间:</span>
                    </div>
                    <div class="col-md-7 ">
                        <input type="text" class="form-control" v-model="newItem['time']" placeholder="请输入收入/支出时间:">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <span>收支金额</span>
                    </div>
                    <div class="col-md-7">
                        <input type="text" class="form-control" v-model="newItem['cost']" placeholder="请输入收支金额:">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <span>报销类型:</span>
                    </div>
                    <div class="col-md-7 ">
                        <select class="form-control" v-model="newItem['type']">
                            <option v-for="tp in types">{{tp}}</option>

                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <span>报销时间:</span>
                    </div>
                    <div class="col-md-7">
                        <input type="text" class="form-control" v-model="newItem['reimbursementTime']" placeholder="请输入报销时间:">
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="display: flex; justify-content: center;align-items: center;">
            <button type="button" @click="addComfirm($event)" data-dismiss="modal" class="btn btn-primary" style="background-color: #2985f7;">确定</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #2985f7;">取消</button>
            </div>
        </div>
        </div>
    </div>


    <div class="row header-style">
        <div class="col-md-2" style="font-size: 18px;">
            经费管理系统
        </div>
        <div class="col-md-1" style="background-color: #e01818;">
            <button class="nonstyle-btn">
                收支情况
            </button>
        </div>
        <div class="col-md-1" >
            <button class="nonstyle-btn">
                收支历史
            </button>
        </div>
        <div class="col-md-1">
            <button class="nonstyle-btn" >
                收支对比
            </button>
        </div>
        <div class="col-md-1 col-md-offset-6 logout text-left">
            <div class="row">
                <button class="nonstyle-btn" @click="manageUser($event)" :class="{'admin':!isAdmin}">
                    <span>用户管理 |</span>&nbsp;
                </button>
                <button class="nonstyle-btn" @click="changeHidden($event)">
                    <span class="glyphicon glyphicon-user"></span>
                    <span>test</span>
                </button>
            </div>
            <div class="row" >
                <button class="btn btn-default" :class="{'hiddenState':isHidden}" @click="logout()">
                    退出/注销
                </button>
            </div>
        </div>
    </div>
    <div class="row" id="main-window">
        <div class="col-md-12">
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-md-4">
                    <input type="text" class="form-control" placeholder="请输入报销人、报销时间" style="border-color: #216df5;">
                </div>
                <div class="col-md-1" style="padding-right: 5px;">
                    <input type="text" class="form-control" placeholder="开始时间" style="border-color: #216df5;">
                </div>
                <div class="col-md-1" style="padding-left: 5px;">
                    <input type="text" class="form-control" placeholder="结束时间" style="border-color: #216df5;">
                </div>
                <div class="col-md-1" style="padding: 0; text-align: left;">
                    <button type="button" class="btn" style="padding-left: 0px; border-color: #216df5; padding-left: 10px;">查询</button>
                </div>
                <div class="col-md-1 col-md-offset-4">
                    <button type="button" data-toggle="modal" data-target="#myModal" @click="add($event)" class="btn" style="border-color: #216df5;">添加数据</button>
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
                                    <template v-if="editIndex === line.id" >
                                        <div style="display: flex; justify-content: center;align-items: center;">
                                            <select class="form-control" style="width: 100px;" v-model="editItems['role']">
                                                <option v-for="role in reimbursers">{{role}}</option>
                                            </select>
                                        </div>
                                    </template>
                                    <template v-else>
                                        <span>{{line.role}}</span>
                                    </template>
                                </td>
                                <td>
                                    <template v-if="editIndex === line.id" >
                                        <div style="display: flex; justify-content: center;align-items: center;">
                                            <input type="text" class="form-control" v-model="editItems['reason']" style="width: 186px;">
                                        </div>
                                    </template>
                                    <template v-else>
                                        <span>{{line.reason}}</span>
                                    </template>
                                </td>
                                <td>
                                    <template v-if="editIndex === line.id" >
                                        <div style="display: flex; justify-content: center;align-items: center;">
                                            <input type="text" class="form-control" v-model="editItems['time']" style="width: 190px;">
                                        </div>
                                    </template>
                                    <template v-else>
                                        <span>{{line.time}}</span>
                                    </template>
                                </td>
                                <td>
                                    <template v-if="editIndex === line.id" >
                                        <div style="display: flex; justify-content: center;align-items: center;">
                                            <input type="text" class="form-control" v-model="editItems['cost']" style="width: 103px;">
                                        </div>
                                    </template>
                                    <template v-else>
                                        <span>{{line.cost}}</span>
                                    </template>
                                </td>
                                <td>
                                    <template v-if="editIndex === line.id" >
                                        <div style="display: flex; justify-content: center;align-items: center;">
                                            <select class="form-control" style="width: 100px;" v-model="editItems['type']">
                                                <option v-for="tp in types">{{tp}}</option>
                                            </select>
                                        </div>
                                    </template>
                                    <template v-else>
                                        <span>{{line.type}}</span>
                                    </template>
                                </td>
                                <td>
                                    <span>{{line.remain}}</span>
                                </td>
                                <td>
                                    <span>{{line.recoder}}</span>
                                </td>
                                <td>
                                    <template v-if="editIndex === line.id" >
                                        <div style="display: flex; justify-content: center;align-items: center;">
                                            <input type="text" class="form-control" v-model="editItems['reimbursementTime']" style="width: 190px;">
                                        </div>
                                    </template>
                                    <template v-else>
                                        <span>{{line.reimbursementTime}}</span>
                                    </template>
                                </td>
                                <td >
                                    <template v-if="editIndex === line.id" >
                                        <div style="color: #8685f7;">
                                            <button type="button" class="btn btn-primary" @click="confirm($event,line.id)">确认</button>
                                            <button type="button" class="btn btn-default" @click="cancel($event,line.id)">取消</button>
                                        </div>
                                    </template>
                                    <template v-else>
                                        <div style="color: #8685f7;">
                                            <button class="nonstyle-btn" @click="edit($event,line.id)">
                                                <span >编辑</span>
                                            </button>
                                            &nbsp;
                                            <button class="nonstyle-btn" @click="del($event,index)">
                                                <span >删除</span>
                                            </button>
                                        </div>
                                        
                                    </template>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2" style="padding-right: 0;">
                    <p style="height: 34px; margin: 0; line-height: 34px; font-size: 15px;" >{{recodeText}}</p>
                </div>
                <div class="col-md-1" style="padding-left: 0;">
                    <!-- Single button -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {{nums}} 条/页<span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        </ul>
                    </div>
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
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
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
    <script>
    const { createApp } = Vue
    createApp({
        data() {
            return {
            ths:["报销人","事由","收支/支出时间","收支金额","类型","剩余金额","记录人","报销时间","操作"],
            items:[
                {id:1,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:2,role:'团队',reason:'测试',time:'2018-03-18',cost:48,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:3,role:'团队',reason:'测试',time:'2018-03-18',cost:47,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:4,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:5,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:6,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:7,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:8,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:9,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:10,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:11,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:12,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:13,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:14,role:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
            ],
            start : 0,
            nums : 6,
            editIndex: -1,
            reimbursers:['团队','个人'],
            types:['支出','收入'],
            editItems:{},
            newItem:{},
            isHidden:true,
            isAdmin:false
            };
        },
        mounted:function(){
            var that = this
            $.ajax({
                type:"POST",
                url:"/financeManager/getUserInfo",
                dataType:'json',
                success:function(data){
                    if(data.success){
                        if(data.data.type==1){
                            that.isAdmin=true
                        }
                    }else{
                        window.location.href="login";
                    }
                },
                error:function(data){
                    console.log(data)
                }
            })
        },
        computed:{
            displayIines(){
                return this.items.slice(this.start,this.start+this.nums);
            },
            recodeText(){
                return "共"+this.items.length+"条记录，当前显示第"+(this.start+1)+"-"+(this.start+this.nums)+"条"
            },
            curPage(){
                return (this.start/this.nums+1)+"/"+Math.ceil(this.items.length/this.nums)
            },
            
        },
        methods:{
            edit(event,index){
                for(var obj in this.items[index-1]){
                    this.editItems[obj]=this.items[index-1][obj]
                }
                this.editIndex = index
                        
            },
            del(event,id){
                let del_id = this.start+id
                this.items.splice(del_id,1)
            },
            confirm(event,id){
                for(var title in this.items[id-1]){
                    this.items[id-1][title] = this.editItems[title]
                }
                this.editIndex=-1
                this.editItems={}
            },
            cancel(event,id){
                this.editIndex=-1
                this.editItems={}
            },
            add(event){
                this.newItem = {id:this.items.length+1,role:'团队',reason:'',time:'',cost:0,type:'支出',remain:0,recoder:'',reimbursementTime:''}
            },
            addComfirm(event){
                this.items.unshift(this.newItem)
                console.log(this.newItem)
            },
            changeHidden(event){
                this.isHidden = !this.isHidden;
            },
            manageUser(event){
                window.location.href="manageUser";
            },
            logout(){
                $.ajax({
                    type:"POST",
                    url:"/financeManager/logout",
                    dataType:'json',
                    success:function(data){
                        window.location.href="login";
                    },
                    error:function(data){
                        console.log(data)
                    }
                })
            }
        },
        
    }).mount('#app')
</script>


</body>
</html>