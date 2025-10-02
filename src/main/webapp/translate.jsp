<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Language Translator</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0d0d0d, #1a1a1a);
            color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            padding: 3rem 1rem;
        }

        h2 {
            font-size: 2.2rem;
            margin-bottom: 2rem;
            background: linear-gradient(90deg, #00ffff, #ff00ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 10px rgba(255,0,255,0.3);
            animation: glowText 2s infinite alternate;
        }

        @keyframes glowText {
            0% { text-shadow: 0 0 8px #00ffff, 0 0 10px #ff00ff; }
            100% { text-shadow: 0 0 20px #00ffff, 0 0 25px #ff00ff; }
        }

        .translator-container {
            background-color: rgba(20,20,20,0.95);
            padding: 2rem;
            border-radius: 20px;
            width: 500px;
            max-width: 95%;
            box-shadow: 0 8px 40px rgba(0,255,255,0.2);
            transition: all 0.3s ease;
        }

        .translator-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .translator-textarea {
            width: 100%;
            padding: 1rem;
            border-radius: 15px;
            border: 2px solid #00ffff;
            background-color: #1a1a1a;
            color: #f0f0f0;
            font-size: 1rem;
            resize: none;
            outline: none;
            transition: all 0.4s ease;
            box-shadow: inset 0 0 8px rgba(0,255,255,0.2);
        }

        .translator-textarea:focus {
            border-color: #ff00ff;
            box-shadow: 0 0 12px #ff00ff, 0 0 25px rgba(255,0,255,0.4), inset 0 0 6px rgba(255,0,255,0.2);
        }

        .translator-input {
            padding: 0.7rem 1rem;
            border-radius: 15px;
            border: 2px solid #00ffff;
            background-color: #1a1a1a;
            color: #f0f0f0;
            font-size: 1rem;
            outline: none;
            transition: all 0.4s ease;
            box-shadow: inset 0 0 8px rgba(0,255,255,0.2);
        }

        .translator-input:focus {
            border-color: #ff00ff;
            box-shadow: 0 0 12px #ff00ff, 0 0 25px rgba(255,0,255,0.4), inset 0 0 6px rgba(255,0,255,0.2);
        }

        .translator-submit {
            padding: 0.8rem 2rem;
            border-radius: 25px;
            border: none;
            background: linear-gradient(135deg, #ff00ff, #ff66ff, #ff33ff);
            background-size: 200% 200%;
            color: #0d0d0d;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.4s ease;
            box-shadow: 0 0 12px #ff00ff, 0 0 25px rgba(255,0,255,0.4);
        }

        .translator-submit:hover {
            background-position: right center;
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 0 20px #ff66ff, 0 0 40px rgba(255,102,255,0.5);
        }

        .translated-text {
            margin-top: 1rem;
            padding: 1rem;
            border-radius: 15px;
            background-color: #111;
            box-shadow: 0 0 10px rgba(255,0,255,0.2);
            border: 1px solid #ff00ff;
            animation: fadeIn 0.5s ease-in-out;
        }

        a {
            color: #00ffff;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        a:hover {
            color: #ff00ff;
            text-shadow: 0 0 8px #ff00ff;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(10px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @media screen and (max-width: 550px) {
            .translator-container { width: 95%; padding: 1.5rem; }
        }

    </style>
</head>
<body>

<h2>Language Translator</h2>

<div class="translator-container">

    <s:actionerror/>

    <s:form action="translate" cssClass="translator-form">
        <s:textarea name="inputText" rows="4" cols="50" cssClass="translator-textarea" placeholder="Enter text to translate..." />
        <div style="display:flex; gap:1rem; flex-wrap: wrap;">
            Source lang: <s:textfield name="sourceLang" value="en" cssClass="translator-input" placeholder="en" />
            Target lang: <s:textfield name="targetLang" value="fr" cssClass="translator-input" placeholder="fr" />
        </div>
        <s:submit value="Translate" cssClass="translator-submit"/>
    </s:form>

    <s:if test="translatedText != null">
        <h3>Translated Text:</h3>
        <div class="translated-text">
            <s:property value="translatedText" escape="false"/>
        </div>
    </s:if>

    <p style="margin-top:1rem;"><a href="index.jsp">Home</a></p>

</div>

</body>
</html>
