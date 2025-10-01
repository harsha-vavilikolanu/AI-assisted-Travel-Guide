<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head><title>Language Translator</title></head>
<body>
<h2>Language Translator</h2>

<s:actionerror/>

<s:form action="translate">
    Enter text: <s:textarea name="inputText" rows="4" cols="50" />
    Source lang: <s:textfield name="sourceLang" value="en" /> 
    Target lang: <s:textfield name="targetLang" value="fr" /> 
    <s:submit value="Translate"/>
</s:form>

<s:if test="translatedText != null">
    <h3>Translated Text:</h3>
    <div style="border:1px solid #ddd; padding:8px;">
        <s:property value="translatedText" escape="false"/>
    </div>
</s:if>

<p><a href="index.jsp">Home</a></p>
</body>
</html>
