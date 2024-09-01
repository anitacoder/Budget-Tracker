package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/deleteExpense")
public class DeleteServelet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String expenseName = request.getParameter("expenseName");

        ExpenseDAO expenseDAO = new ExpenseDAO();
        expenseDAO.deleteExpense(expenseName);

        List<Expense> expenses = expenseDAO.getAllExpenses();
        request.setAttribute("expenses", expenses);

        request.getRequestDispatcher("index.jsp").forward(request, response);

    }
}
