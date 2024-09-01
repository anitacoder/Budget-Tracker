<%@ page import="java.util.List" %>
<%@ page import="org.example.ExpenseDAO" %>
<%@ page import="org.example.Expense" %>

<html>
<head>
    <title>Personal Budget Tracker</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <div class="logo">Personal Budget Tracker</div>
    <nav>
        <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Budget</a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Profile</a></li>
        </ul>
    </nav>
</header>
<div class="container">
    <aside>
        <ul>
            <li><a href="#">Add Expense</a></li>
            <li><a href="#">View Budget</a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Settings</a></li>
        </ul>
    </aside>

    <main>
        <section class="add-expense">
            <h2>Add New Expense</h2>
            <form action="addExpense" method="post">
                <label for="expenseName">Expense Name:</label>
                <input type="text" id="expenseName" name="expenseName" required>

                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required>

                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>

                <button type="submit">Add Expense</button>
            </form>
        </section>

        <section class="budget-list">
            <h2>Budget List</h2>
            <table>
                <thead>
                <tr>
                    <th>Expense Name</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
                    if (expenses != null) {
                        for (Expense expense : expenses) {
                %>
                <tr>
                    <td><%= expense.getName() %></td>
                    <td><%= expense.getAmount() %></td>
                    <td><%= expense.getDate() %></td>
                    <td>
                        <form action="deleteExpense" method="post">
                            <input type="hidden" name="expenseName" value="<%= expense.getName() %>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </section>
    </main>
</div>

<footer>
    <p>&copy; Built by Anita Nkwocha</p>
</footer>
</body>
</html>
