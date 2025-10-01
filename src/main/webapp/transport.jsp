<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><title>Transport Planner</title></head>
<body>
<h2>Plan Transport</h2>
<form action="planTransport" method="post">
  Mode: <input name="mode" /><br/>
  From: <input name="fromPlace" /><br/>
  To: <input name="toPlace" /><br/>
  Depart (yyyy-MM-ddTHH:mm): <input name="depart" /><br/>
  Arrive (yyyy-MM-ddTHH:mm): <input name="arrive" /><br/>
  Price: <input name="price" /><br/>
  <button type="submit">Save Plan</button>
</form>
</body></html>
