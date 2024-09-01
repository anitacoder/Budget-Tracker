<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.Expense" %>

<html>
<head>
    <title>Dashboard</title>
    <style>
        footer {
            background-color: #333;
        }
        button {
            font-family: sans-serif;
            border-radius: 5px;
            padding: 5px;
            border: none;
            background-color: #333;
            color: white;
            cursor: pointer;
        }
        :root {
            --table-bg-color: #ffffff;
            --table-border-color: #ddd;
            --text-color: #333;
        }

        body {
            font-family: sans-serif;
            color: var(--text-color);
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #333;
            color: white;
            padding: 15px 0;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header .logo {
            margin-left: 20px;
            font-size: 24px;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            margin-right: 20px;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .container {
            display: flex;
            flex: 1;
        }

        aside {
            width: 200px;
            background-color: #2c3e50;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            height: 81vh;
        }

        aside ul {
            list-style: none;
            padding: 0;
        }

        aside ul li {
            margin-bottom: 20px;
        }

        aside ul li a {
            color: white;
            text-decoration: none;
            display: block;
            font-weight: bold;
        }

        main {
            flex-grow: 1;
            padding: 20px;
        }

        .add-expense, .budget-list {
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: var(--table-bg-color);
        }

        table th, table td {
            border: 1px solid var(--table-border-color);
            padding: 10px;
            text-align: left;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: relative;
            width: 100%;
            margin-top: auto;
        }

    </style>
</head>
<body>
<header>
    <div class="logo">Personal Budget Tracker</div>
    <nav>
        <ul>
            <li><a href="index.jsp">Dashboard</a></li>
            <li><a href="budget.jsp">History</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <main>
        <section class="add-expense">
            <h2>Add New Expense</h2>
            <form action="index.jsp" method="post">
                <label for="expenseName">Expense Name:</label>
                <input type="text" id="expenseName" name="expenseName" required>

                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required>

                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>

                <button type="submit">Add Expense</button>
            </form>
        </section>

        <%
            List<Expense> expenses = (List<Expense>) session.getAttribute("expensesIndex");
            List<Expense> expenses1 = (List<Expense>) session.getAttribute("expensesBudget");

            if (expenses == null) {
                expenses = new ArrayList<>();
            }
            if (expenses1 == null) {
                expenses1 = new ArrayList<>();
            }

            String expenseName = request.getParameter("expenseName");
            String amountStr = request.getParameter("amount");
            String date = request.getParameter("date");

            if (expenseName != null && amountStr != null && date != null) {
                double amount = Double.parseDouble(amountStr);
                Expense newExpense = new Expense(expenseName, amount, date);

                Expense newExpenseForIndex = new Expense(expenseName, amount, date);
                Expense newExpenseForBudget = new Expense(expenseName, amount, date);

                expenses.add(newExpenseForIndex);
                expenses1.add(newExpenseForBudget);

                session.setAttribute("expensesIndex", expenses);
                session.setAttribute("expensesBudget", expenses1);
            }
        %>

        <section class="budget-list">
            <h2>Expense List</h2>
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
                    if (expenses != null) {
                        for (Expense expense : expenses) {
                %>
                <tr>
                    <td><%= expense.getName() %></td>
                    <td><%= expense.getAmount() %></td>
                    <td><%= expense.getDate() %></td>
                    <td>
                        <form action="deleteExpenses.jsp" method="post">
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
