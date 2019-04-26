<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>舆情详细页面</title>


    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">

    <!-- echarts画图依赖包  -->
    <script src="js/echarts.min.js"></script>

    <!-- 词云依赖包  -->
    <script src="js/echarts-wordcloud.min.js"></script>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/jquery-3.3.1.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="js/bootstrap_3.3.7.js"></script>


    <link rel="stylesheet" href="css/bootstrap-table.min.css">
    <script src="js/bootstrap-table.min.js"></script>

</head>
<body>
${id }
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="jumbotron">
                <h1>
                    舆情系统
                </h1>
                <p>
                    舆情系统集成了舆情监测、舆情采集、舆情智能分析、舆情处理、舆情预警、舆情搜索、舆情报告辅助生成、舆情短信自动提醒等核心功能。帮助客户全面掌握舆情动态，正确进行舆论引导。为确保我国互联网络大众媒体的舆论导向的正确性起到一定的辅助作用，实现为政府分忧，对网络舆情进行监控和管理。用舆情系统，宣传部门可以有效的规范互联网信息，引导健康有益的舆论导向。系统对于促进加强互联网信息监管，组织力量展开信息整理和深入分析，应对网络突发的公共事件，全面掌握社情民意起决定性作用。
                </p>
            </div>
            <h3>
                ${sentiment.name }
            </h3>
            <h3>
                关键字：${sentiment.words }
            </h3>
            <h3>
                创建时间：${sentiment.date }
            </h3>
        </div>
        <a id="modal-74909" href="/" role="button" class="btn active btn-primary" data-toggle="modal">返回主页</a>
    </div>
</div>
</div>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="height:400px"></div>
<div id="main1" style="height:400px"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts图表
    var myChart = echarts.init(document.getElementById('main'));
    // 为echarts对象加载数据
    $.get("http://localhost:8080/getRealTimeSentiment?id=${sentiment.id }").done(function (data) {
        myChart.setOption({
            title: {
                text: '舆情走势'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['正面', '负面', '中性']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                data: data.x,
                splitLine: {
                    show: false
                }
            },
            yAxis: {
                type: 'value',
                boundaryGap: [0, '100%'],
                splitLine: {
                    show: false
                }
            },
            series: [
                {
                    name: '正面',
                    type: 'line',
                    stack: '总量',
                    data: data.y3
                },
                {
                    name: '负面',
                    type: 'line',
                    stack: '总量',
                    data: data.y1
                },
                {
                    name: '中性',
                    type: 'line',
                    stack: '总量',
                    data: data.y2
                }
            ]
        });
    })

</script>

<script type="text/javascript">

    var chart = echarts.init(document.getElementById('main1'));

    $.get("http://localhost:8080/getWordCloud/${sentiment.id }").done(function (data) {
        chart.setOption({
            series: [{
                //类型  词云
                type: 'wordCloud',
                // 文本的样式
                textStyle: {
                    normal: {
                        fontFamily: 'sans-serif',
                        fontWeight: 'bold',
                        // 获取颜色回调函数
                        color: function () {
                            // 随机产生颜色
                            return 'rgb(' + [
                                Math.round(Math.random() * 160),
                                Math.round(Math.random() * 160),
                                Math.round(Math.random() * 160)
                            ].join(',') + ')';
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowColor: '#333'
                    }
                },

                // 数据
                data: data
            }]
        });
    })


</script>

</body>
</html>