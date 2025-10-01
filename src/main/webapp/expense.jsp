<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><title>Expense Tracker</title></head>
<body>
<h2>Add Expense</h2>
<form action="addExpense" method="post">
  Category: <input name="category" /><br/>
  Amount: <input name="amount" /><br/>
  Date (yyyy-MM-dd): <input name="date" /><br/>
  Note: <input name="note" /><br/>
  <button type="submit">Save</button>
</form>
</body></html>
