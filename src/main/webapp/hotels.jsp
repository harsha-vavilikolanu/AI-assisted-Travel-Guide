<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Hotels</title>
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
            padding: 2rem;
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 2rem;
            background: linear-gradient(90deg, #00ffff, #ff00ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 10px rgba(255,0,255,0.3);
        }

        .hotel-container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            justify-content: center;
        }

        .hotel-card {
            background: rgba(20,20,20,0.85);
            border-radius: 15px;
            width: 300px;
            padding: 1.5rem;
            box-shadow: 0 8px 30px rgba(0,255,255,0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
            animation: fadeIn 1s ease-in-out;
        }

        .hotel-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 12px 40px rgba(0,255,255,0.4);
        }

        .hotel-name {
            font-size: 1.5rem;
            font-weight: bold;
            color: #00ffff;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 5px #00ffff;
        }

        .hotel-address {
            font-size: 0.9rem;
            color: #ccc;
            margin-bottom: 1rem;
        }

        .hotel-price, .hotel-rating {
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .book-btn {
            display: inline-block;
            text-decoration: none;
            padding: 0.6rem 1.5rem;
            border-radius: 25px;
            background: linear-gradient(90deg, #ff00ff, #ff66ff);
            color: #0d0d0d;
            font-weight: bold;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 0 10px #ff00ff, 0 0 20px rgba(255,0,255,0.3);
        }

        .book-btn:hover {
            background: linear-gradient(90deg, #ff66ff, #ff00ff);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 0 15px #ff66ff, 0 0 30px rgba(255,102,255,0.5);
        }

        p {
            text-align: center;
            font-size: 1.2rem;
            color: #ff5555;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 2rem;
            color: #00ffff;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: #ff00ff;
            text-shadow: 0 0 8px #ff00ff;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @media screen and (max-width: 768px) {
            .hotel-container {
                flex-direction: column;
                align-items: center;
            }
        }

    </style>
</head>
<body>

<h2>Hotels in <s:property value="country"/></h2>

<s:if test="hotels != null && !hotels.isEmpty()">
    <div class="hotel-container">
        <s:iterator value="hotels">
            <div class="hotel-card">
                <div class="hotel-name"><s:property value="name"/></div>
                <div class="hotel-address"><s:property value="address"/></div>
                <div class="hotel-price">Price: $<s:property value="price"/></div>
                <div class="hotel-rating">Rating: <s:property value="rating"/>⭐</div>
                <a href="bookHotel.jsp?hotelId=<s:property value='id'/>" class="book-btn">Book Now</a>
            </div>
        </s:iterator>
    </div>
</s:if>

<s:else>
    <p>No hotels found for "<s:property value='country'/>".</p>
</s:else>

<a href="index.jsp" class="back-link">← Back to Home</a>

</body>
</html>
