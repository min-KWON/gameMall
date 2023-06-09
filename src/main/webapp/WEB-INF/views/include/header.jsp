<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <!-- <a href="./index.html">
                            <h5 class="my-0 mr-md-auto font-weight-normal">GaMEMall</h5>
                        </a> -->
                        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  							<h5 class="my-0 mr-md-auto font-weight-normal">GaME Mall</h5>
  						</div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="#">메인페이지</a></li>
                                <li><a href="./category">카테고리</a></li>
                                <li><a href="/logout">로그아웃</a></li>
                                <li><a href="./modify">회원수정</a></li>
                                <li><a href="./mypage">마이페이지</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        <a href="./member/login"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"><div class="slicknav_menu"><a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a><nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
                            <ul>
                                <li class="active"><a href="./index.html" role="menuitem">Homepage</a></li>
                                <li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"><a href="./categories.html">Categories <span class="arrow_carrot-down"></span></a>
                                    <span class="slicknav_arrow">►</span></a><ul class="dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
                                        <li><a href="./include/categoryMenu" role="menuitem" tabindex="-1">Categories</a></li>
                                        <li><a href="./anime-details.html" role="menuitem" tabindex="-1"> Details</a></li>
                                        <li><a href="./anime-watching.html" role="menuitem" tabindex="-1"> Watching</a></li>
                                        <li><a href="./blog-details.html" role="menuitem" tabindex="-1">Blog Details</a></li>
                                        <li><a href="./member/join" role="menuitem" tabindex="-1">Sign Up</a></li>
                                        <li><a href="./member/login" role="menuitem" tabindex="-1">Login</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.html" role="menuitem">Our Blog</a></li>
                                <li><a href="#" role="menuitem">Contacts</a></li>
                            </ul>
                        </nav></div></div>
        </div>
    </header>