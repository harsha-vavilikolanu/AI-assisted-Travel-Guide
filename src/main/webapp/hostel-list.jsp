<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<html><head><title>Hostels</title></head>
<body>
<h2>Demo Hostels</h2>
<!-- For demo, static hostels -->
<div>
  <form action="bookHostel" method="post">
    <input type="hidden" name="hostelId" value="1" />
    <div>
      <strong>Happy Hostel</strong> - City A - ₹500/night
      <button type="submit">Book</button>
    </div>
  </form>
</div>
<div>
  <form action="bookHostel" method="post">
    <input type="hidden" name="hostelId" value="2" />
    <div>
      <strong>Traveller's Inn</strong> - City B - ₹750/night
      <button type="submit">Book</button>
    </div>
  </form>
</div>
</body></html>
