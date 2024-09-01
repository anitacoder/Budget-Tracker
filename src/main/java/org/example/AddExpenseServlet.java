package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/addExpense")
public class AddExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String expenseName = request.getParameter("expenseName");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String date = request.getParameter("date");

        Expense newExpense = new Expense(expenseName, amount, date);

        ExpenseDAO expenseDAO = new ExpenseDAO();
        expenseDAO.addExpense(newExpense);

        List<Expense> expenses = expenseDAO.getAllExpenses();
        request.setAttribute("expenses", expenses);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
