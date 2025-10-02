<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>TravelBot Chat</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #0d0d0d;
            color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            padding: 2rem;
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(90deg, #00ffff, #ff00ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 8px rgba(255,0,255,0.3);
            animation: glowText 2s infinite alternate;
        }

        @keyframes glowText {
            0% { text-shadow: 0 0 8px #00ffff, 0 0 10px #ff00ff; }
            100% { text-shadow: 0 0 20px #00ffff, 0 0 25px #ff00ff; }
        }

        .chat-container {
            background-color: rgba(20,20,20,0.95);
            border-radius: 20px;
            width: 420px;
            max-width: 95%;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            box-shadow: 0 8px 40px rgba(0,255,255,0.3);
        }

        .chat-header {
            background-color: #111;
            padding: 1rem;
            color: #00ffff;
            font-weight: bold;
            text-align: center;
            text-shadow: 0 0 5px #00ffff;
        }

        .chat-messages {
            padding: 1rem;
            height: 450px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
            scroll-behavior: smooth;
            background: #1a1a1a;
        }

        .chat-bubble {
            max-width: 80%;
            padding: 0.8rem 1rem;
            border-radius: 20px;
            animation: fadeIn 0.3s ease-in-out;
            word-wrap: break-word;
        }

        .user-bubble {
            align-self: flex-end;
            background-color: #00ffff;
            color: #0d0d0d;
            border-bottom-right-radius: 0;
            box-shadow: 0 0 12px #00ffff;
        }

        .bot-bubble {
            align-self: flex-start;
            background-color: #ff00ff;
            color: #0d0d0d;
            border-bottom-left-radius: 0;
            box-shadow: 0 0 12px #ff00ff;
        }

        .chat-input {
            display: flex;
            padding: 1rem;
            background-color: #111;
            gap: 0.5rem;
        }

        /* Input and Send button styles */
        .chat-textfield {
            flex: 1;
            padding: 0.9rem 1.5rem;
            border-radius: 35px;
            border: 2px solid #00ffff;
            background-color: #1a1a1a;
            color: #f0f0f0;
            font-size: 1rem;
            outline: none;
            transition: all 0.4s ease;
            box-shadow: inset 0 0 8px rgba(0,255,255,0.2);
        }

        .chat-textfield::placeholder {
            color: #aaa;
            font-style: italic;
        }

        .chat-textfield:focus {
            border-color: #ff00ff;
            box-shadow: 0 0 12px #ff00ff, 0 0 25px rgba(255,0,255,0.4), inset 0 0 6px rgba(255,0,255,0.2);
        }

        .chat-submit {
            padding: 0.9rem 2rem;
            border-radius: 35px;
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

        .chat-submit:hover {
            background-position: right center;
            transform: translateY(-2px) scale(1.08);
            box-shadow: 0 0 20px #ff66ff, 0 0 40px rgba(255,102,255,0.5);
        }

        /* Scrollbar Styling */
        .chat-messages::-webkit-scrollbar {
            width: 8px;
        }

        .chat-messages::-webkit-scrollbar-thumb {
            background-color: #00ffff;
            border-radius: 4px;
        }

        .chat-messages::-webkit-scrollbar-track {
            background: #111;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(10px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @media screen and (max-width: 500px) {
            .chat-container { width: 95%; }
        }

    </style>
</head>
<body>

<h2>TravelBot Chat</h2>

<div class="chat-container">
    <div class="chat-header">Chat with TravelBot 🤖</div>

    <div class="chat-messages">
        <s:if test="userMessage != null">
            <div class="chat-bubble user-bubble">
                <s:property value="userMessage"/>
            </div>
        </s:if>
        <s:if test="botResponse != null">
            <div class="chat-bubble bot-bubble">
                <s:property value="botResponse"/>
            </div>
        </s:if>
    </div>

    <div class="chat-input">
        <s:form action="chatbotAction" method="post">
            <s:textfield name="userMessage" placeholder="Type your message..." cssClass="chat-textfield"/>
            <s:submit value="Send" cssClass="chat-submit"/>
        </s:form>
    </div>
</div>

</body>
</html>
