<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 02.01.2016
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHead.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1>Новости компании</h1>
            <hr>

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img class="img-responsive center-block" src="/resources/images/slide1.jpg" alt="Chania">

                        <div class="carousel-caption">
                            <h3>Chania</h3>

                            <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img class="img-responsive center-block" src="/resources/images/slide2.jpg" alt="Chania">

                        <div class="carousel-caption">
                            <h3>Chania</h3>

                            <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img class="img-responsive center-block" src="/resources/images/slide3.jpg" alt="Flower">

                        <div class="carousel-caption">
                            <h3>Приходи со своим</h3>

                            <p>Лучший тариф месяца</p>
                        </div>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div id="NewsPage_Index" class="content-block common">
                <div id="NewsPage_Index_Content">
                    <div id="NewsPage_YearNews_Content" class="news-wrap">
                        <ul class="list-news" id="NewsPage_ScrollLoading">
                            <li>
                                <div class="news-block ">
                                    <h3>
                                        <a href="#">
                                            Акция – денежные переводы в офисах «T-mobile» с комиссией 1% по России и в
                                            СНГ</a>
                                    </h3>
                                    <div class="news-article">
                                        <p></p>
                                        <p>С 01.02.2016</p>
                                        <p></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="news-block ">
                                    <h3><a href="#">Изменение правил участия в Программе «Карта T-Mobile»</a></h3>
                                    <div class="news-article">
                                        <p></p>
                                        <p>С 15 февраля 2016 года изменятся правила участия в Программе «Карта
                                            T-Mobile».</p>
                                        <p></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="news-block ">
                                    <h3>
                                        <a href="#">Новые
                                            тарифы «ВСЁ!»</a></h3>
                                    <div class="news-article">
                                        <p></p>
                                        <p>С 11 февраля 2016 г.</p>

                                        <p></p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="NewsPage_Index_Loading" class="b-loader hidden" style="">
                    <div class="load-overlay">&nbsp;</div>
                    <div class="load" style="">&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
