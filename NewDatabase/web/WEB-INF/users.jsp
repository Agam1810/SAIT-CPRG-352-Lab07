
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        
        <link type="text/css" rel="stylesheet" href="index.css">
    </head>
    <body>
        
        <h1>Users</h1>
        <div>
            <form class="forms" method="post" action="user">
                <h2>Add User</h2>
                <input id="add_email" class="box" type="email" name="add_email" placeholder="Email" value="${add_email}" required><br><br>
                Active: 
                    <input id="add_active_yes" type="radio" name="add_active[]" value="true"><label for="add_active_yes" required>Yes</label>
                    <input id="add_active_no" type="radio" name="add_active[]" value="false"><label for="add_active_no" required>No</label><br><br>
                <input id="add_first_name" class="box" type="text" name="add_first_name" placeholder="First Name" value="${add_first_name}" required><br><br>
                <input id="add_last_name" class="box" type="text" name="add_last_name" placeholder="Last Name" value="${add_last_name}" required><br><br>
                <input id="add_password" class="box" type="password" name="add_password" placeholder="Password" value="${add_password}" required><br><br>
                
                <select class="select" name="add_role">
                    <option value="">--choose--</option>
                    <c:forEach var="role" items="${roles}">
                        <option ${add_role=="${role.role_name}"?"selected":""} value="${role.role_name}">${role.role_name}</option>
                    </c:forEach>
                </select><br>
                
                <input class="button" type="submit" value="Save">
                <input type="hidden" name="action" value="add">
            </form>
    
                    
                    
            <form class="forms" method="post" action="user">
                <h2>Edit User</h2>
                <input id="edit_email" class="box" type="email" name="edit_email" value="${edit_email}" readonly><br><br>
                Active: 
                    <input id="edit_active_yes" type="radio" name="edit_active[]" value="true"><label for="edit_active_yes" required>Yes</label>
                    <input id="edit_active_no" type="radio" name="edit_active[]" value="false"><label for="edit_active_no" required>No</label><br><br>
                <input id="edit_first_name" class="box" type="text" name="edit_first_name" placeholder="First Name" value="${edit_first_name}" required><br><br>
                <input id="edit_last_name" class="box" type="text" name="edit_last_name" placeholder="Last Name" value="${edit_last_name}" required><br><br>
                <input id="edit_password" class="box" type="password" name="edit_password" placeholder="Password" value="${edit_password}" required><br><br>
                <select class="select" name="edit_role" required>
                    <option value="">--choose--</option>
                    <c:forEach var="role" items="${roles}">
                        <option ${edit_role=="${role.role_name}"?"selected":""} value="${role.role_name}">${role.role_name}</option>
                    </c:forEach>
                </select><br>
                <input class="button" type="submit" value="Update">
                <input type="hidden" name="action" value="edit">
            </form>
        </div>

        <div>
            <h2>Manage Users</h2>
            <table>
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td><a href="user?action=edit&amp;email=${user.email}">Edit</a></td>
                        <td><a href="user?action=delete&amp;email=${user.email}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <p>${message}</p>
    </body>
</html>