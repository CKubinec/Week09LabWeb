/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import services.UserService;

/**
 *
 * @author 758688
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserService userService = new UserService();
        List<User> users;

        try {
           
            users = userService.getAll();
            request.setAttribute("users", users);

        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        UserService userService = new UserService();

        switch (action) {
            case "add": {
                String email = request.getParameter("addEmail");
                String fname = request.getParameter("addFName");
                String lname = request.getParameter("addLName");
                String pw = request.getParameter("addPassword");
                int role = Integer.parseInt(request.getParameter("addRole"));
                try {
                    userService.insert(email, true, fname, lname, pw, role);
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                break;
            }
            case "edit":
                String editEmail = request.getParameter("email_e");
                String editFName = request.getParameter("FName_e");
                String editLName = request.getParameter("LName_e");
                String editPassword = request.getParameter("pw_e");
                String editRole = request.getParameter("role_e");
                request.setAttribute("editEmail", editEmail);
                request.setAttribute("editFName", editFName);
                request.setAttribute("editLName", editLName);
                request.setAttribute("editPassword", editPassword);
                request.setAttribute("editRole", editRole);
                break;

            case "delete":
                String deleteEmail = request.getParameter("email_d");
                System.out.println(deleteEmail + "deleting");
                try {
                    userService.delete(deleteEmail);
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;

            case "save": {
                String email = request.getParameter("editEmail");
                String fname = request.getParameter("editFName");
                String lname = request.getParameter("editLName");
                String pw = request.getParameter("editPassword");
                int role = Integer.parseInt(request.getParameter("editRole"));
                try {
                    userService.update(email, true, fname, lname, pw, role);
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            }
            case "cancel":
                request.setAttribute("editEmail", "");
                request.setAttribute("editFName", "");
                request.setAttribute("editLName", "");
                request.setAttribute("editPassword", "");
                request.setAttribute("editPassword", "");
                break;

            default:
                break;
        }

        List<User> users;
        try {
            users = userService.getAll();
            request.setAttribute("users", users);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

}
