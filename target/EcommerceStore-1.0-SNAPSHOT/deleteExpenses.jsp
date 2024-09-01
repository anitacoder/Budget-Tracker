<%@ page import="java.util.List" %>
<%@ page import="org.example.Expense" %>

<%
    List<Expense> expenses = (List<Expense>) session.getAttribute("expensesIndex");

    String expenseNameToDelete = request.getParameter("expenseName");

    if (expenses != null && expenseNameToDelete != null) {
        expenses.removeIf(expense -> expense.getName().equals(expenseNameToDelete));
        session.setAttribute("expensesIndex", expenses);
    }

    response.sendRedirect("index.jsp");
%>
