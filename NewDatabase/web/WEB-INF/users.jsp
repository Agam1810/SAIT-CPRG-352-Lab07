
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link rel="stylesheet" href="index.css" type="text/css">
        <link href="https://fonts.googleapis.com/css2?family=Kantumruy+Pro:wght@100&display=swap" rel="stylesheet">
    </head>
    <body>
        <!--Parent Container Div-->
        <div class="container">
            
            <!--Adding user form div-->
            <div class="addUser userForm divs">
            <h3 class="heading">Add User</h3>
            
            <form method="POST" action="users">
                <input class="fields" type="email" name="email" value="${add_email}" maxlength="40" placeholder="Email"> <br>
                <input class="fields" type="text" name="f_name" value="${add_f_name}" maxlength="20" placeholder="First Name"> <br>
                <input class="fields" type="text" name="l_name" value="${add_l_name}" maxlength="20" placeholder="Last Name"> <br>
                <input class="fields" type="password" name="password" value="${add_password}" maxlength="20" placeholder="Password"> <br>
                
                <select name="role" value="${add_role}" class="fields selectRole">
                    <option value="">---</option>
                    <option value="System Admin">System Admin</option>
                    <option value="Regular User">Regular User</option>
                    <option value="Company Admin">Company Admin</option>
                </select> <br>
                
                <div class="activeDiv">
                    <label class="active activeLabel" for="isActive">Active: </label>
                    <input class="active activeBox" type="checkbox" name="isActive" value="${addActive}">
                </div>
                
                <input type="hidden" name="action" value="add">
                <input class="btn fields" type="submit" value="Save">
            </form>
                
        </div>
        
        <!--Managing user form div-->
        <div class="manageUsers divs">
            <h3 class="mHeading">Manage Users</h3>
                
                <table class="userTable">
                    
                    <tr class="table-heading">
                        <th class="typeEmail">Email</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th class="typeRole">Role</th>
                        <th>Active</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>
                                <c:if test="${user.role eq 1}">System Admin</c:if>
                                <c:if test="${user.role eq 2}">Regular user</c:if>
                                <c:if test="${user.role eq 3}">Company Admin</c:if>
                            </td>
                            <td>
                                <c:if test="${user.active eq true}">Active</c:if>
                                <c:if test="${user.active eq false}">Inactive</c:if>
                            </td>
                            <td><a href="users?action=edit&amp;emailLink=${user.email}">Edit</a></td>
                            <td><a href="users?action=delete&amp;emailLink=${user.email}">Delete</a></td>
                        </tr>
                    </c:forEach>
                        
                </table>
            
        </div>
        
        <!--Updating user form div-->
        <div class="editUser userForm divs">
            
                <h3 class="heading" >Edit User</h3>

                <form method="POST" action="users">

                    <input class="fields" type="text" name="f_name" value="${update_f_name}" maxlength="20" placeholder="First Name"> <br>
                    <input class="fields" type="text" name="l_name" value="${update_l_name}" maxlength="20" placeholder="Last Name"> <br>
                    <input class="fields" type="password" name="password" value="${update_password}" maxlength="20" placeholder="Password"> <br>
                    <select name="role" value="${update_role}" class="fields selectRole">
                        <option value="">---</option>
                        
                        <c:if test="${update_role eq 1}">
                            <option value="System Admin" selected>System Admin</option>
                            <option value="Regular User">Regular User</option>
                            <option value="Company Admin">Company Admin</option>
                        </c:if>
                        <c:if test="${update_role eq 2}">
                            <option value="System Admin">System Admin</option>
                            <option value="Regular User" selected>Regular User</option>
                            <option value="Company Admin">Company Admin</option>
                        </c:if>
                        <c:if test="${update_role eq 3}">
                            <option value="System Admin">System Admin</option>
                            <option value="Regular User">Regular User</option>
                            <option value="Company Admin" selected>Company Admin</option>
                        </c:if>
                    </select> <br>
                    
                    <div class="activeDiv">
                    <label class="active activeLabel" for="isActive">Active: </label>
                        <c:if test="${update_active eq true}">
                            <input class="active activeBox" type="checkbox" name="isActive" checked>
                        </c:if>
                        <c:if test="${update_active eq false or update_active eq null}">
                            <input class="active activeBox" type="checkbox" name="isActive">
                        </c:if>
                    </div>
                    
                    <input type="hidden" name="action" value="update">
                    <input class="btn fields updateBtn" type="submit" value="Update">
                </form>
                
            </div>
                            
                         
                            
                           
        </div>
    </body>
</html>