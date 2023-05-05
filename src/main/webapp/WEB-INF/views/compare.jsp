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
            <div class="col-md-1">
                <button class="nonstyle-btn">
                    收支历史
                </button>
            </div>
            <div class="col-md-1"  style="background-color: #e01818;">
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
            <div class="col-md-8 col-md-offset-2">
                <div id="pie-chart" style="width: 100%; height: 300px;"></div>
            </div>
        </div>
       
    </div>
    
    <script>
    const { createApp } = Vue
    createApp({
        data() {
            return {
                compare:[{value: 335, name: '收入金额'},
                        {value: 310, name: '支出金额'},
                    ],
                isHidden:true,
                isAdmin:true
            };
        },
        methods:{
            changeHidden(event){
                this.isHidden = !this.isHidden;
            },
            manageUser(event){
                
            }
        },
        mounted() {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('pie-chart'));
            const options = {
            title: {
                text: '收支对比情况',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b}: {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['收入金额', '支出金额']
            },
            color: ['#c23531', '#2f4554'],
            series: [
                {
                    name: '收支对比情况',
                    type: 'pie',
                    radius: '50%',
                    itemStyle: {
                        emphasis: {
                            opacity: 1,
                            label: {
                                show: true,
                            }
                        }
                    },
                    data: this.compare
                }
            ],
            dataZoom:[{
                type: 'slider',//这个 dataZoom 组件是 slider 型 dataZoom 组件（只能拖动 dataZoom 组件导致窗口变化）
	            xAxisIndex: 0, //控制x轴
	            start: 0, 	// 左边在 10% 的位置
	            end: 100 	// 右边在 60% 的位置

            }],
            toolbox: {
                feature: {
                    dataZoom: {
                        show: true,
                        yAxisIndex: 'none',
                    },
                    restore: {},
                    saveAsImage: {}
                }
            }
        };
            // 绘制图表
            myChart.setOption(options)
        }
    }).mount('#app')
</script>


</body>
</html>