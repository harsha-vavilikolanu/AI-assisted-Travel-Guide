<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>TravelGuide</title>
</head>
<body>
<h1>Welcome to TravelGuide</h1>

<ul>
    <li><a href="hostel-list.jsp">Hostels (static demo)</a></li>
    <li><a href="transport.jsp">Plan Transport</a></li>
    <li><a href="expense.jsp">Expense Tracker</a></li>
    <li><a href="translate.jsp">Translator (mock)</a></li>
    <li><a href="chat.jsp">Chatbot (mock)</a></li>
</ul>

<hr/>

<h2>Search Hotels in Bangkok</h2>
<s:form action="searchHotels" method="post">
    <table>
        <tr>
            <td>Check-in Date:</td>
            <td><s:textfield name="checkin" type="date"/></td>
        </tr>
        <tr>
            <td>Check-out Date:</td>
            <td><s:textfield name="checkout" type="date"/></td>
        </tr>
        <tr>
            <td>Adults:</td>
            <td><s:textfield name="adults" value="2"/></td>
        </tr>
        <tr>
            <td>Rooms:</td>
            <td><s:textfield name="rooms" value="1"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <s:submit value="Search Hotels"/>
            </td>
        </tr>
    </table>
</s:form>

</body>
</html>
