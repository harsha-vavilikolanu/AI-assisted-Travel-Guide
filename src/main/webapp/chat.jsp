<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<html>
<head><title>Chatbot</title></head>
<body>
<h2>Gemii Chatbot</h2>

<s:form action="chatbotAction" method="post">
    <s:textfield name="userMessage" label="Your Message"/>
    <s:submit value="Send"/>
</s:form>

<s:if test="botResponse != null">
    <h3>Bot Response:</h3>
    <p><s:property value="botResponse"/></p>
</s:if>

</body>
</html>
