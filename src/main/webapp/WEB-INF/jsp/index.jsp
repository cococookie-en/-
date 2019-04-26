<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>舆情系统</title>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">

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
            <nav class="navbar navbar-default" role="navigation">
                <div class="modal fade" id="modal-container-74909" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">
                                    增加舆情
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="col-md-12 column">
                                    <form role="form" action="addSentiment" method="post">
                                        <div class="form-group">
                                            <label>舆情名称</label><input type="text" name="name" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>关键字</label><input type="text" name="words" class="form-control"/>
                                            <span class="help-block">多个关键字用空格或者逗号隔开</span>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-default active btn-primary">提交
                                            </button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">

                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-md-12 column">
                    <h3>
                        舆情列表
                    </h3>
                    <a id="modal-74909" href="#modal-container-74909" role="button" class="btn active btn-primary"
                       data-toggle="modal">增加舆情</a>
                </div>

                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table
                                data-toggle="table"
                                data-url="getSentimentList"
                                data-pagination="true"
                                data-search="true">
                            <thead>
                            <tr>
                                <th data-sortable="id" data-field="id">编号</th>
                                <th data-field="name">舆情名称</th>
                                <th data-field="words">关键字</th>
                                <th data-field="date">创建时间</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
</body>

</html>
