<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Budget Travel Planner</title>
    <style>
        /* Basic Reset (Copied from other JSPs like translate.jsp) */
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
        }

        .planner-container {
            background-color: rgba(20,20,20,0.95);
            padding: 2rem;
            border-radius: 20px;
            width: 500px;
            max-width: 95%;
            box-shadow: 0 8px 40px rgba(0,255,255,0.2);
        }

        .planner-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .planner-input {
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

        .planner-input:focus {
            border-color: #ff00ff;
            box-shadow: 0 0 12px #ff00ff, 0 0 25px rgba(255,0,255,0.4), inset 0 0 6px rgba(255,0,255,0.2);
        }

        .planner-submit {
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

        .planner-submit:hover {
            background-position: right center;
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 0 20px #ff66ff, 0 0 40px rgba(255,102,255,0.5);
        }
        
        .plan-result {
            margin-top: 1.5rem;
            padding: 1.5rem;
            border-radius: 15px;
            background-color: #111;
            box-shadow: 0 0 10px rgba(0,255,255,0.2);
            border: 1px solid #00ffff;
            white-space: pre-wrap; /* To handle newlines from API response */
        }
        
        .error-message {
            color: #ff5555;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>

<h2>Budget Travel Planner</h2>

<div class="planner-container">

    <s:actionerror/>

    <s:form action="planBudget" cssClass="planner-form">
        <s:textfield name="country" cssClass="planner-input" placeholder="Enter country to visit (e.g., Thailand)"/>
        <s:textfield name="budget" cssClass="planner-input" placeholder="Enter your total budget (e.g., 1200)"/>
        <s:submit value="Get Plan" cssClass="planner-submit"/>
    </s:form>

    <s:if test="travelPlan != null">
        <h3>Proposed Travel Plan:</h3>
        <div class="plan-result">
            <s:if test="travelPlan.startsWith('Error:')">
                <p class="error-message"><s:property value="travelPlan" escape="false"/></p>
            </s:if>
            <s:else>
                <s:property value="travelPlan" escape="false"/>
            </s:else>
        </div>
    </s:if>

    <p style="margin-top:1rem;"><a href="index.jsp" style="color:#00ffff; text-decoration:none;">Home</a></p>

</div>

</body>
</html>