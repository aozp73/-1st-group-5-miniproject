<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>구직사이트</title>
            <link rel="icon" href="/images/favicon.png" type="image/x-icon">
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
            <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <link rel="stylesheet" href="/css/style.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        </head>

        <body>
            <div class="container-fluid" style="width: 65%">
                <div style="height: 50px">
                    <nav class="navbar navbar-expand-sm">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav col-7">
                                <a class="nav-link" href="#"><i class="bi bi-list"></i></a>
                                <li class="nav-item">
                                    <a class="nav-link text-dark pt-1" href="/main"><img src="/images/projectLogo.png"
                                            alt="" style="width: 100px; height: 30px;"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-dark" href="/recruitment/list">채용</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-dark" href="/resumeMain">이력서</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav col-5 justify-content-end">
                                <a class="nav-link" href="#"><i class="bi bi-search"></i></a>
                                <c:choose>
                                    <c:when test="${not empty principal or not empty principalEnt}">
                                        <!-- 세션에 principal 또는 principalEnt 중 하나 이상이 존재하는 경우 -->
                                        <li class="nav-item">
                                            <a class="nav-link text-dark" href=""><i class=" bi
                                                bi-bell"></i></a>
                                        </li>
                                        <li class="nav-item">
                                            <div class="dropdown">
                                                <a class="btn btn-secondary dropdown-toggle" href="#" role="button"
                                                    id="dropdownMenuLink" data-bs-toggle="dropdown"
                                                    aria-expanded="false"
                                                    style="background-color: transparent; border: none;">
                                                    <img src="/images/profile.png" style="width: 35px;"
                                                        class="rounded-circle" alt="Cinque Terre">
                                                </a>

                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink" ">
                                                    <li><a class=" dropdown-item" href="logout">로그아웃</a>
                                        </li>
                                        <li class="nav-item">
                                        <li>
                                            <a class="dropdown-item" data-toggle="modal" data-target="#update"
                                                style="cursor: pointer;">회원수정</a>
                                        </li>
                            </ul>
                        </div>

                        </li>
                        </c:when>

                                    <c:otherwise>
                                        <!-- 세션에 principal 또는 principalEnt가 존재하지 않는 경우 -->
                                        <li class="nav-item">
                                            <a class="nav-link text-dark" data-toggle="modal" data-target="#login"
                                                style="cursor: pointer;">로그인</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-dark" data-toggle="modal" data-target="#join"
                                                style="cursor: pointer;">회원가입</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <hr class="my-1">
            </header>


            <%-- 회원가입 Modal --%>
                <!-- The Modal -->
                <div class="modal" id="login">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title ms-2">로그인</h4>
                                <!-- Modal footer -->
                                <button class="btn btn-custome" type="button" data-dismiss="modal">X</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="card-body">
                                    <ul class="nav my-nav-tabs nav-fill mb-4">
                                        <li class="nav-item">
                                            <a class="my-nav-link list-group-item list-group-item-action active"
                                                data-toggle="tab" href="#loginUser">개인회원</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="my-nav-link list-group-item list-group-item-action"
                                                data-toggle="tab" href="#loginEnterprise">기업회원</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content ">
                                        <div class="tab-pane fade show active" id="loginUser">
                                            <form action="/user/login" method="post">
                                                <table class="table table-borderless">

                                                    <tr class="text-center">
                                                        <!-- input의 크기는 class="form-control-lg" 로 늘린다. -->
                                                        <td><input type="text" class="form-control-lg w-100"
                                                                name="username" placeholder="아이디"></td>
                                                    </tr>

                                                    <tr class="text-center">
                                                        <td><input type="password" class="form-control-lg w-100"
                                                                name="password" placeholder="비밀번호"></td>
                                                    </tr>
                                                </table>
                                                <button type="submit" class="btn login-btn-custom btn-sm me-2"
                                                    style="float:right;">로그인</button>
                                                <input class="ms-2" type="checkbox" value="">로그인 상태 유지<br><br><br>
                                                <div class="d-inline-flex justify-content-between">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane fade" id="loginEnterprise">
                                            <form action="/enterprise/login" method="post">
                                                <table class="table table-borderless">

                                                    <tr class="text-center ">
                                                        <td><input type="text" class="form-control-lg w-100"
                                                                name="enterpriseName" placeholder="아이디"></td>
                                                    </tr>

                                                    <tr class="text-center">
                                                        <td><input type="password" class="form-control-lg w-100"
                                                                name="password" placeholder="비밀번호"></td>
                                                    </tr>
                                                </table>
                                                <button class="btn login-btn-custom btn-sm me-2"
                                                    style="float:right;">로그인</button>
                                                <input class="ms-2" type="checkbox" value="">로그인 상태 유지<br><br><br>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- The Modal -->
                <div class="modal" id="join">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header ms-2">
                                <h4 class="modal-title">회원가입</h4>
                                <!-- Modal footer -->
                                <button class="btn btn-custome" type="button" data-dismiss="modal">X</button>
                            </div>

                            <!-- Modal body -->
                            <div class="card-body">
                                <ul class="nav my-nav-tabs nav-fill my-2">
                                    <li class="nav-item">
                                        <a class="my-nav-link list-group-item list-group-item-action active"
                                            data-toggle="tab" href="#joinUser">개인회원</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="my-nav-link list-group-item list-group-item-action" data-toggle="tab"
                                            href="#joinEnterprise">기업회원</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="joinUser">
                                    <form action="/user/join" method="post" onsubmit="return valid()">
                                        <table class="table table-borderless">
                                            <div class="text-center d-flex justify-content-end"><br>
                                                <%-- input의 크기는 class="form-control-lg" 로 늘린다. --%>
                                                    <td><input type="text" id="username" class="form-control-lg col-9"
                                                            name="username" placeholder="아이디">
                                                        <button type="button"
                                                            class="btn btn-custom btn-sm col-2 my-2 me-3"
                                                            onclick="sameCheck()" style="float:right;">중복확인</button>
                                                    </td>
                                            </div>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100" name="password"
                                                        placeholder="비밀번호"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100"
                                                        name="passwordcheck" placeholder="비밀번호 중복검사">
                                                </td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="name"
                                                        placeholder="이름"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="email"
                                                        placeholder="이메일"></td>
                                            </tr>
                                            <div class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="contact"
                                                        placeholder="전화번호">
                                                </td>
                                            </div>
                                        </table>
                                        <div class="text-center">
                                            <tr>
                                                &nbsp;<input type="checkbox"
                                                    aria-label="Checkbox for following text input"> 필수 동의 항목 및 개인정보 수집 및
                                                이용 동의, 광고성 정보 수신에 동의합니다.
                                            </tr>
                                            <br>
                                            <button class="btn btn-custom btn-sm my-3 ms-3 me-4"
                                                style="float:right;">회원가입</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane fade" id="joinEnterprise">
                                    <form action="/enterprise/join" method="post" onsubmit="return valid()">
                                        <table class="table table-borderless">
                                            <div class="text-center d-flex justify-content-end"> <br>
                                                <%-- input의 크기는 class="form-control-lg" 로 늘린다. --%>
                                                    <td><input type="text" id="enterpriseName"
                                                            class="form-control-lg w-75 col-9" name="enterpriseName"
                                                            placeholder="아이디">
                                                        <button type="button"
                                                            class="btn btn-custom btn-sm col-2 my-2 me-3"
                                                            onclick="sameCheck()" style="float:right;">중복확인</button>
                                                    </td>
                                            </div>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100" name="password"
                                                        placeholder="비밀번호"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100"
                                                        name="passwordCheck" placeholder="비밀번호 중복검사">
                                                </td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="address"
                                                        placeholder="주소"></td>
                                            </tr>
                                            <div class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="contact"
                                                        placeholder="전화번호">
                                                </td>
                                            </div>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="email"
                                                        placeholder="이메일"></td>
                                            </tr>
                                        </table>
                                        <div class="form-control-sm">
                                            &nbsp;회사분류
                                            <label for="exampleFormControlSelect1"></label>
                                            <select class="form-control" id="exampleFormControlSelect1" name="sector">
                                                <option value="SI">SI</option>
                                                <option value="솔루션">솔루션</option>
                                                <option value="웹 에이젼시">웹 에이젼시</option>
                                                <option value="인력소싱">인력소싱</option>
                                                <option value="IT 대기업 계열사">IT 대기업 계열사</option>
                                                <option value="IT 스타트업">IT 스타트업</option>
                                                <option value="IT 서비">IT 서비스</option>
                                                <option value="IT 컨설팅 회사">IT 컨설팅 회사</option>
                                            </select>
                                        </div><br>

                                        <div class="form-control-sm">
                                            &nbsp;기업형태
                                            <label for="exampleFormControlSelect1"></label>
                                            <select class="form-control" id="exampleFormControlSelect1" name="size">
                                                <option value="스타트업">스타트업</option>
                                                <option value="중소기업">중소기업</option>
                                                <option value="중견기업">중견기업</option>
                                                <option value="대기업">대기업</option>
                                            </select>
                                        </div><br>
                                        <div class="text-center">
                                            <tr>
                                                &nbsp;<input type="checkbox"
                                                    aria-label="Checkbox for following text input"> 필수 동의 항목 및 개인정보 수집 및
                                                이용 동의, 광고성 정보
                                                수신에 동의합니다.
                                            </tr>
                                        </div>
                                        <br>
                                        <button class="btn btn-custom btn-sm m-1 my-3 ms-3 me-4"
                                            style="float:right;">회원가입</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    let submitCheck = false;
                    function valid() {
                        if (submitCheck) {
                            return true;
                        } else {
                            alert("유저네임 중복체크를 해주세요");
                            return false;
                        }
                    }
                    function sameCheck() {
                        let username = $("#username").val();
                        $.ajax({
                            type: "get",
                            url: "/user/usernameSameCheck?username=" + username
                        }).done((res) => {
                            //console.log(res);
                            if (res.data === true) {
                                alert(res.msg);
                                submitCheck = true;
                            } else {
                                alert(res.msg);
                                submitCheck = false;
                            }
                        }).fail((err) => {
                        });
                    }
                </script>





                <div class="modal" id="update">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header ms-2">
                                <h4 class="modal-title">회원수정</h4>
                                <!-- Modal footer -->
                                <button class="btn btn-custome" type="button" data-dismiss="modal">X</button>
                            </div>

                            <!-- Modal body -->
                            <%-- <div class="card-body">
                                <ul class="nav my-nav-tabs nav-fill my-2">
                                    <li class="nav-item">
                                        <a class="my-nav-link list-group-item list-group-item-action active"
                                            data-toggle="tab" href="#joinUser">개인회원</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="my-nav-link list-group-item list-group-item-action" data-toggle="tab"
                                            href="#joinEnterprise">기업회원</a>
                                    </li>
                                </ul>
                            </div> --%>
                            <div class="tab-content">
                            <c:choose>
                               <c:when test="${not empty principal}">
                               
                                <div class="tab-pane fade show active" id="updateUser">
                                    <form action="/user/update" method="post" >
                                        <table class="table table-borderless">
                                            
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100" name="password"
                                                        placeholder="비밀번호"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100"
                                                        name="passwordcheck" placeholder="비밀번호 중복검사">
                                                </td>
                                            </tr>
                                            
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="email"
                                                        placeholder="이메일"></td>
                                            </tr>
                                            <div class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="contact"
                                                        placeholder="전화번호">
                                                </td>
                                            </div>
                                        </table>
                                        <div class="text-center">
                                            
                                            <br>
                                            <button class="btn btn-custom btn-sm my-3 ms-3 me-4"
                                                style="float:right;">회원정보수정</button>
                                        </div>
                                    </form>
                                </div>
                                </c:when>
                            
                               <c:otherwise>
                               
                                <div class="tab-pane fade show active" id="updateEnterprise">
                                    <form action="/enterprise/update" method="post" >
                                        <table class="table table-borderless">
                                            
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100" name="password"
                                                        placeholder="비밀번호"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100"
                                                        name="passwordCheck" placeholder="비밀번호 중복검사">
                                                </td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="address"
                                                        placeholder="주소"></td>
                                            </tr>
                                            <div class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="contact"
                                                        placeholder="전화번호">
                                                </td>
                                            </div>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="email"
                                                        placeholder="이메일"></td>
                                            </tr>
                                        </table>
                                        <div class="form-control-sm">
                                            &nbsp;회사분류
                                            <label for="exampleFormControlSelect1"></label>
                                            <select class="form-control" id="exampleFormControlSelect1" name="sector">
                                                <option value="SI">SI</option>
                                                <option value="솔루션">솔루션</option>
                                                <option value="웹 에이젼시">웹 에이젼시</option>
                                                <option value="인력소싱">인력소싱</option>
                                                <option value="IT 대기업 계열사">IT 대기업 계열사</option>
                                                <option value="IT 스타트업">IT 스타트업</option>
                                                <option value="IT 서비">IT 서비스</option>
                                                <option value="IT 컨설팅 회사">IT 컨설팅 회사</option>
                                            </select>
                                        </div><br>

                                        <div class="form-control-sm">
                                            &nbsp;기업형태
                                            <label for="exampleFormControlSelect1"></label>
                                            <select class="form-control" id="exampleFormControlSelect1" name="size">
                                                <option value="스타트업">스타트업</option>
                                                <option value="중소기업">중소기업</option>
                                                <option value="중견기업">중견기업</option>
                                                <option value="대기업">대기업</option>
                                            </select>
                                        </div><br>
                                        
                                        <br>
                                        <button class="btn btn-custom btn-sm m-1 my-3 ms-3 me-4"
                                            style="float:right;">회원정보수정</button>
                                    </form>
                                </div>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </div>
                    </div>
                </div>