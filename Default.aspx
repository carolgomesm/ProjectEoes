<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <main class="bs-docs-masthead" id="content" role="main" tabindex="-1"> 
        <!-- search -->
        <div class="searchBar">
            <form class="form-horizontal" runat="server">
                <div class="form-group">
                    <div class="input-group search">
                        <div class="input-group-addon">◎</div>
                        <%--<input type="text" class="form-control" id="search" placeholder="Search Menu or Restaurant" />--%>
                
                        <asp:TextBox ID="search" runat="server" class="form-control" placeholder="Search by Restaurant"></asp:TextBox>
                
                        <div class="input-group-addon" id="searchDiv" runat="server">
                            <img src="/images/search.png" class="search_ico" />
                        </div>
                    </div>
                </div>
                <div class="form-group checkbox-group">
                    <label class="checkbox-inline">
                        <input type="checkbox" id="search_location" value="location" /> Location
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="search_allergy" value="allergy" /> Allergy
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="search_food" value="food" /> Food
                    </label>
                </div>
            </form>
        </div>
    </main>
    <div class="bs-docs-featurette"> 
        <div class="container"> 
            <br />

            <!-- list title -->
            <% if (searchStr == ""){ %>
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Top Restaurants
                            <small>check out best reviews!!</small>
                        </h1>
                    </div>
                </div>
                <div class="row">
            <% } else { %>
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Your Search Result
                            <small>find your best fits!!</small>
                        </h1>
                    </div>
                </div>
            <% } %>

            <!-- list title -->
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <% if (searchStr == ""){ %>
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <img src="<%# Eval("mainImg_path") %>\<%#  Eval("mainImg_name") %>" />
                                <div class="caption">
                                    <h4 class="pull-right">*</h4>
                                    <h4>
                                        <a href="#">
                                            <%# Eval("Res_name") %>
                                        </a>
                                    </h4>
                                    <p>
                                        <%# Eval("Res_Description").ToString().Length > 100 ?
                                                Eval("Res_Description").ToString().Substring(0, 100) + " ..." : 
                                                Eval("Res_Description").ToString() %>
                                    </p>
                                </div>
                                <div class="ratings">
                                    <p>
                                        <%# Eval("Rate").ToString().Equals("")?
                                                 "<span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'>" +
                                                 "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                            : (Eval("Rate").ToString().Equals("1.0") ?
                                                 "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'>" +
                                                 "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                            : (Eval("Rate").ToString().Equals("2.0") ?
                                                 "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'>" +
                                                 "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                            : (Eval("Rate").ToString().Equals("3.0") ?
                                                 "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'>" +
                                                 "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                            : (Eval("Rate").ToString().Equals("4.0") ?
                                                 "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'>" +
                                                 "</span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'></span>" 
                                            : (Eval("Rate").ToString().Equals("5.0") ?
                                                 "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'>" +
                                                 "</span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span>"
                                            : "" )))))%>
                                        <%# Eval("Total_review") %> reviews 
                                    </p>
                                </div>
                            </div>
                        </div>
                    <% } else {%>
                        <div class="row">
                            <div class="col-md-3">
                                <a href="#">
                                    <img class="img-responsive" src="<%# Eval("mainImg_path") %>\<%#  Eval("mainImg_name") %>" alt="">
                                </a>
                            </div>
                            <div class="col-md-9">
                                <div class="ratings pull-right">
                                    <%# Eval("Rate").ToString().Equals("")?
                                                "<span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'>" +
                                                "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                        : (Eval("Rate").ToString().Equals("1.0") ?
                                                "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'>" +
                                                "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                        : (Eval("Rate").ToString().Equals("2.0") ?
                                                "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'>" +
                                                "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                        : (Eval("Rate").ToString().Equals("3.0") ?
                                                "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'>" +
                                                "</span><span class='glyphicon glyphicon-star-empty'></span><span class='glyphicon glyphicon-star-empty'></span>"
                                        : (Eval("Rate").ToString().Equals("4.0") ?
                                                "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'>" +
                                                "</span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star-empty'></span>" 
                                        : (Eval("Rate").ToString().Equals("5.0") ?
                                                "<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'>" +
                                                "</span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span>"
                                        : "" )))))%>
                                    <%# Eval("Total_review") %> reviews
                                </div><br />
                                <h3><%# Eval("Res_name").ToString().HighlightKeyWords(searchStr, "yellow", true) %></h3>
                                <p>
                                    <%# Eval("Res_Description").ToString().Length > 200 ? 
                                                    Eval("Res_Description").ToString().Substring(0, 200).HighlightKeyWords(searchStr, "yellow", true) + " ..." : 
                                                    Eval("Res_Description").ToString().HighlightKeyWords(searchStr, "yellow", true) %>
                                </p>
                                <a class="btn btn-primary" onclick="" >More <span class="glyphicon glyphicon-chevron-right"></span></a>
                            </div>
                        </div>
                        <hr>
                    <% } %>
                </ItemTemplate>
            </asp:Repeater>

            </div>
        </div>
    </div>

</asp:Content>

