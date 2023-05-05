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
    height: calc(94vh);
    background-color: white;
    margin-left: 172px; 
    margin-right: 172px;
    padding-left: 70px;
    padding-right: 70px;
    padding-top: 40px;
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
    .logout >div button:nth-last-of-type(){
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.1/echarts.min.js" integrity="sha512-OTbGFYPLe3jhy4bUwbB8nls0TFgz10kn0TLkmyA+l3FyivDs31zsXCjOis7YGDtE2Jsy0+fzW+3/OVoPVujPmQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <div class="container-fluid text-center" id="app">
        <div class="row header-style">
            <div class="col-md-2" style="font-size: 18px;">
                经费管理系统
            </div>
            <div class="col-md-1">
                <button class="nonstyle-btn">
                    收支情况
                </button>
            </div>
            <div class="col-md-1" style="background-color: #e01818;">
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
                    <button class="nonstyle-btn" @click="manageUser($event)" :class="{'admin':isAdmin}">
                        <span>用户管理 |</span>&nbsp;
                    </button>
                    <button class="nonstyle-btn" @click="changeHidden($event)">
                        <span class="glyphicon glyphicon-user"></span>
                        <span>test</span>
                    </button>
                </div>
                <div class="row" >
                    <button class="btn btn-default" :class="{'hiddenState':isHidden}">
                        退出/注销
                    </button>
                </div>
            </div>
        </div>
        <div class="row" id="main-window">
            <div class="col-md-12">
                <div id="line-chart" style="width: 100%; height: 600px;"></div>

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
                {id:1,team:'团队',reason:'测试',time:'2018-03-18',cost:49,type:'支出',remain:7113.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:2,team:'团队',reason:'测试',time:'2018-03-17',cost:48,type:'支出',remain:7435.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:3,team:'团队',reason:'测试',time:'2018-03-16',cost:47,type:'支出',remain:7675,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:4,team:'团队',reason:'测试',time:'2018-03-15',cost:49,type:'支出',remain:6513.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:5,team:'团队',reason:'测试',time:'2018-03-14',cost:49,type:'支出',remain:7013.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:6,team:'团队',reason:'测试',time:'2018-03-13',cost:49,type:'支出',remain:6613.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:7,team:'团队',reason:'测试',time:'2018-03-12',cost:49,type:'支出',remain:5713.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:8,team:'团队',reason:'测试',time:'2018-03-11',cost:49,type:'支出',remain:4513.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:9,team:'团队',reason:'测试',time:'2018-03-10',cost:49,type:'支出',remain:6213.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:10,team:'团队',reason:'测试',time:'2018-03-09',cost:49,type:'支出',remain:7613.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:11,team:'团队',reason:'测试',time:'2018-03-08',cost:49,type:'支出',remain:7313.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:12,team:'团队',reason:'测试',time:'2018-03-07',cost:49,type:'支出',remain:8613.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:13,team:'团队',reason:'测试',time:'2018-03-06',cost:49,type:'支出',remain:8813.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                {id:14,team:'团队',reason:'测试',time:'2018-03-05',cost:49,type:'支出',remain:5431.39,recoder:'张三',reimbursementTime:'2018-03-18'},
                
            ],
            start : 0,
            nums : 6,
            isHidden:true,
            isAdmin:true,
            };
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
            }
        },
        methods:{

            changeHidden(event){
                this.isHidden = !this.isHidden;
            },
            manageUser(event){
                
            }
        },
        mounted(){
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('line-chart'));
            // 将data中的name作为横轴坐标
            var xAxisData = this.items.map(item => item.time).reverse()
            // 指定图表的配置项和数据
            var option = {
            title: {
                text: '收支历史情况',
                left:'center'
            },
            tooltip: {},

            xAxis: {
                name:'报销日期',
                data: xAxisData
            },
            yAxis: {
                name:'剩余总额',
                axisLine: {      // 添加纵轴竖线
                    show: true
                }
            },
            series: [{
                name: '剩余总额',
                type: 'line',
                lineStyle:{
                    color:'#e19c9a'
                },
                itemStyle:{
                    color:'#e19c9a'
                },
                data: this.items.map(item=>item.remain).reverse()
            }],
            dataZoom: [
                {
                    type: 'slider',
                    backgroundColor: '#dce2eb',
                    bottom:0,
                    xAxisIndex: 0,
                    start: 0,
                    end: 100
                }
            ],
            toolbox: {
                feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                restore: {},
                saveAsImage: {}
            }
        },
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    }).mount('#app')
</script>


</body>
</html>