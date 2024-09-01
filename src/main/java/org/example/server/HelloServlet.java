//package org.example.server;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//@WebServlet(name = "registrationServlet", urlPatterns = "/registrationServlet")
//public class registrationServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("firstname");
//        String lastname = req.getParameter("lastname");
//        String email = req.getParameter("email");
//        String phoneNumber = req.getParameter("phone");
//        String stack = req.getParameter("stack");
//
//        if (name != null && lastname != null && email != null && phoneNumber != null && stack != null) {
//////            FillForm fillform = new FillForm();
//////            fillform.setFirstName(name);
//////            fillform.setLastName(lastname);
//////            fillform.setEmail(email);
//////            fillform.setPhoneNumber(phoneNumber);
//////            fillform.setStack(stack);
//////            AptechDao aptechDao = new AptechDao();
////            int result  = aptechDao.register(fillform);
////            if(result > 0) {
////                req.setAttribute("message", "You have successfully registered!");
////                this.getServletContext().getRequestDispatcher("/Successfully.jsp").forward(req, resp);
////            }else {
////                req.setAttribute("error", "Something went wrong!");
////                this.getServletContext().getRequestDispatcher("/ClassWork.jsp").forward(req, resp);
////            }
////
////
////        } else  {
////            System.out.println("You have successfully registered" + " " + name + " " + lastname + " " + email + " " + phoneNumber + " " + stack);
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        getServletContext().getRequestDispatcher("/ClassWork.jsp").forward(request, response);
//        getServletContext().getRequestDispatcher("/Successfully.jsp").forward(request, response);
//    }
//}
