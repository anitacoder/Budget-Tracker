package org.example;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ExpenseDAO {
    private static List<Expense> expenses = new ArrayList<>();

    public void addExpense(Expense expense) {
        expenses.add(expense);
    }

    public List<Expense> getAllExpenses() {
        return new ArrayList<>(expenses);
    }

    public void deleteExpense(String expenseName) {
        Iterator<Expense> iterator = expenses.iterator();
        while (iterator.hasNext()) {
            Expense expense = iterator.next();
            if (expense.getName().equals(expenseName)) {
                iterator.remove();
                break;
            }
        }
    }
}
