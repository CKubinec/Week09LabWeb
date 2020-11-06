<%-- 
    Document   : users
    Created on : Oct 29, 2020, 10:29:19 AM
    Author     : 789648
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="users.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif:300&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Oxanium&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato:900|Creepster" rel="stylesheet">
        <title>SPOOKY User Editing</title>
    </head>
    <body>
        <div class="column">
            <div class="col-30">
                <h1>Add Users</h1>
                <form method="post" action="user">
                    Email: <input type="text" name="addEmail"/><br>
                    First Name: <input type="text" name="addFName"/><br>
                    Last Name: <input type="text" name="addLName"/><br>
                    Password: <input type="password" name="addPassword"/><br>
                    Role: <select name="addRole">
                        <option value="1">System Admin</option>
                        <option value="2">Regular User</option>
                        <option value="3">Company Admin</option>
                    </select><br>

                    <input type="submit" value="Add">
                    <input type="hidden" name="action" value="add">
                </form>       
            </div>
        </div> 

        <div class="column">
            <div class="col-30"> 
                <h1>Edit Users</h1>
                <form method="post" action="user">
                    Email: <input type="text" name="editEmail" value="${editEmail}"/><br>
                    First Name: <input type="text" name="editFName" value="${editFName}"/><br>
                    Last Name: <input type="text" name="editLName" value="${editLName}"/><br>
                    Password: <input type="password" name="editPassword" value="${editPassword}"/><br>
                    Role:   <select name="editRole" value="${editRole}">
                        <option value="1">System Admin</option>
                        <option value="2">Regular User</option>
                        <option value="3">Company Admin</option>
                    </select><br>        
                    <input type="submit" value="Save">
                    <input type="hidden" name="action" value="save">
                    <input type="submit" value="Cancel">
                    <input type="hidden" name="action" value="cancel">
                </form> 
            </div>
        </div>
        <div class="columnWide">
            <div class="col-30">
                <h1>Manage Users</h1>
                <table>
                    <tr name="labels">
                        <td> Email </td>
                        <td> First Name </td>
                        <td> Last Name </td>
                        <td> Role </td>
                    </tr>

                    <c:forEach var="user" items="${users}">
                        <tr> 
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>

                            <c:if test="${user.role.roleId eq 1}"><td>System Admin</td></c:if>
                            <c:if test="${user.role.roleId eq 2}"><td>Regular User</td></c:if>
                            <c:if test="${user.role.roleId eq 3}"><td>Company Admin</td></c:if>

                            <form method="post" action="user">
                                <input type="hidden" name="email_e" value="${user.email}">
                            <input type="hidden" name="FName_e" value="${user.firstName}">
                            <input type="hidden" name="LName_e" value="${user.lastName}">
                            <input type="hidden" name="pw_e" value="${user.password}">
                            <input type="hidden" name="role_e" value="${user.role.roleId}">
                            <td><input type="submit" value="Edit" >
                                <input type="hidden" name="action" value="edit"></td>
                        </form>

                        <form method="post" action="user">
                            <input type="hidden" name="email_d" value="${user.email}">
                            <td><input type="submit" value="Delete">
                                <input type="hidden" name="action" value="delete"></td>
                        </form>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div> 

        <img src="skeltor.gif" alt="Skeletor">

    </body>
</html>
