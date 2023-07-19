<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-06
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <my:font></my:font>
    <title>자주묻는질문</title>

</head>
<body>

<my:navBar/>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7">

                <h2>자주 묻는 질문</h2>
                <sec:authorize access="hasAuthority('admin')">
                    <button type="button" class="btn btn-dark write-faq-btn" data-bs-toggle="modal" data-bs-target="#faqWriteBtn">작성</button>
                </sec:authorize>

                <div id="list1">
                    <c:forEach items="${faq}" var="faq">
                        <div class="accordion">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapse-${faq.faqId}" aria-expanded="false"
                                            aria-controls="collapse-${faq.faqId}">
                                        <h3>Q</h3> <br/>${faq.title}
                                    </button>
                                </h2>
                                <div id="collapse-${faq.faqId}" class="accordion-collapse collapse"
                                     aria-labelledby="heading-${faq.faqId}">
                                    <div class="accordion-body faq-content">${faq.content}</div>
                                        <%--                        <sec:authorize access="hasAuthority('admin')">--%>
                                        <%--                            <!-- 수정, 삭제 -->--%>
                                        <%--                            <a class="btn btn-secondary" href="/faq/modify/${faq.faqId }">수정</a>--%>
                                        <%--                            <button id="removeButton-${faq.faqId}" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">삭제</button>--%>
                                        <%--                        </sec:authorize>--%>
                                </div>
                            </div>
                                <%--                <!-- 삭제 -->--%>
                                <%--                <div class="d-none">--%>
                                <%--                    <form action="/faq/remove" method="post" id="removeForm-${faq.faqId}">--%>
                                <%--                        <input type="text" name="id" value="${faq.faqId}" />--%>
                                <%--                    </form>--%>
                                <%--                </div>--%>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>

    <!-- FAQ 작성을 위한 모달 -->
    <div class="modal fade" id="faqWriteBtn" tabindex="-1" aria-labelledby="faqModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="faqModalLabel">FAQ 작성</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- FAQ 작성 폼 -->
                    <form id="faqForm">
                        <div class="form-group">
                            <label for="faqTitle">제목</label>
                            <input type="text" class="form-control" id="faqTitle" required>
                        </div>
                        <div class="form-group">
                            <label for="faqContent">내용</label>
                            <textarea class="form-control" id="faqContent" rows="3" required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="submit" form="faqForm" class="btn btn-primary">등록</button>
                </div>
            </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/customer/faq/faq.js"></script>
</body>
</html>
