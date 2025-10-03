<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>TravelGuide</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            color: #f0f0f0;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
            background-color: #0d0d0d;
        }

        /* Background Video */
        #bg-video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1;
            object-fit: cover;
        }

        header, footer {
            background-color: rgba(0,0,0,0.7);
            color: #00ffff;
            padding: 1rem 2rem;
            text-align: center;
            box-shadow: 0 0 20px rgba(0,255,255,0.4);
            backdrop-filter: blur(5px);
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-align: center;
            color: #00ffff;
            text-shadow: 0 0 10px #00ffff, 0 0 20px #00ffff;
            animation: fadeInDown 1s ease-in-out;
        }

        /* Professional Gradient Heading for Search */
        h2 {
            font-size: 2rem;
            margin-top: 2rem;
            margin-bottom: 1rem;
            text-align: center;
            background: linear-gradient(90deg, #00ffff, #ff00ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 8px rgba(255,0,255,0.3);
            animation: fadeInUp 1s ease-in-out;
        }

        ul {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin: 1.5rem 0;
        }

        ul li a {
            text-decoration: none;
            padding: 0.5rem 1.5rem;
            background-color: rgba(0,0,0,0.6);
            color: #00ffff;
            border-radius: 25px;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 0 10px #00ffff, 0 0 20px rgba(0,255,255,0.3);
        }

        ul li a:hover {
            background-color: #00ffff;
            color: #0d0d0d;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 0 15px #00ffff, 0 0 30px rgba(0,255,255,0.5);
        }

        /* Search Form Card */
        .search-card {
            margin: 0 auto;
            margin-top: 1rem;
            width: 50%;
            background: rgba(20,20,20,0.85);
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,255,255,0.2);
            padding: 2rem;
            animation: fadeIn 1s ease-in-out;
        }

        .search-card table {
            width: 100%;
        }

        td {
            padding: 0.8rem;
        }

        s:textfield, input[type=text] {
            width: 100%;
            padding: 0.6rem;
            border: 1px solid #00ffff;
            border-radius: 8px;
            background-color: rgba(0,0,0,0.7);
            color: #f0f0f0;
            transition: all 0.3s ease;
        }

        s:textfield:focus, input[type=text]:focus {
            border-color: #ff00ff;
            box-shadow: 0 0 12px #ff00ff;
            outline: none;
        }

        s:submit, input[type=submit] {
            padding: 0.6rem 1.8rem;
            border: none;
            border-radius: 25px;
            background-color: #ff00ff;
            color: #0d0d0d;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 0 12px #ff00ff, 0 0 25px rgba(255,0,255,0.3);
        }

        s:submit:hover, input[type=submit]:hover {
            background-color: #ff66ff;
            transform: translateY(-3px);
            box-shadow: 0 0 18px #ff66ff, 0 0 35px rgba(255,102,255,0.5);
        }

        footer {
            margin-top: auto;
            font-size: 0.9rem;
            text-shadow: 0 0 8px #00ffff;
        }

        /* Animations */
        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            .search-card {
                width: 90%;
                padding: 1.5rem;
            }
            h1 { font-size: 2.2rem; }
            h2 { font-size: 1.5rem; }
            ul {
                flex-direction: column;
                gap: 1rem;
            }
        }

    </style>
</head>
<body>

<!-- Bright Background Video -->
<video id="bg-video" autoplay muted loop playsinline>
    <source src="bgvideo.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
</video>

<header>
    <h1>Welcome to TravelGuide</h1>
</header>

<ul>
    <li><a href="transport.jsp">Plan Transport</a></li>
    <li><a href="expense.jsp">Expense Tracker</a></li>
    <li><a href="translate.jsp">Translator </a></li>
    <li><a href="chat.jsp">Chatbot </a></li>
    <li><a href="budget-plan.jsp">Budget Planner </a></li>
</ul>


<hr/>

<h2>🔍 Search Hotels by Country</h2>

<!-- Search Form as Card -->
<div class="search-card">
    <s:form action="searchHotels" method="post">
        <table>
            <tr>
                <td>Country:</td>
                <td><s:textfield name="country" placeholder="Enter country name"/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <s:submit value="Search Hotels"/>
                </td>
            </tr>
        </table>
    </s:form>
</div>

<footer>
    &copy; 2025 TravelGuide. All rights reserved. Crafted with ❤️ and Struts.
</footer>

</body>
</html>
