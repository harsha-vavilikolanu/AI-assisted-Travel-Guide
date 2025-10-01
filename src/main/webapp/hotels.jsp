<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Hotels in Bangkok</title>
</head>
<body>
<h2>Hotels in Bangkok</h2>

<s:if test="hotels != null && !hotels.isEmpty()">
    <ul>
        <s:iterator value="hotels">
            <li>
                <strong><s:property value="name"/></strong><br/>
                Address: <s:property value="address"/><br/>
                Price: <s:property value="price"/><br/>
                Rating: <s:property value="rating"/><br/>
                <a href="<s:property value='url'/>" target="_blank">View Details</a><br/>
                <img src="<s:property value='imageUrl'/>" width="150" alt="Hotel Image"/><br/><br/>
            </li>
        </s:iterator>
    </ul>
</s:if>

<s:else>
    <p>No hotels found for your search.</p>
</s:else>

<br/>
<a href="index.jsp">Back to Home</a>
</body>
</html>
