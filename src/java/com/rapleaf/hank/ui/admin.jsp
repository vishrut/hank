<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.rapleaf.hank.ui.*"%>
<%@page import="com.rapleaf.hank.coordinator.*"%>
<%@page import="java.util.*"%>

<%
  Coordinator coord = (Coordinator)getServletContext().getAttribute("coordinator");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.net.URLEncoder"%><html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Hank: Ring Groups</title>

  <jsp:include page="_head.jsp" />
</head>
<body>

  <jsp:include page="_top_nav.jsp" />

  <h1>Domains</h1>

  <h2>Create New Domain</h2>
  <a href="new_domain.jsp">Create New Domain</a>

  <h2>Clean All Domains</h2>
  <form action="/domain/clean_domains" method=post>
    <input type=submit value="Clean All Domains"
    onclick="return confirm('Are you sure you want to clean all Domains? This action cannot be undone.');"/>
  </form>

  <h2>Delete Domain</h2>
  <form action="/domain/delete" method=post>
    <select name="name">
      <option value=""></option>
        <% for (Domain domain : coord.getDomainsSorted()) { %>
          <option value="<%= domain.getName() %>"><%= domain.getName() %></option>
        <% } %>
    </select>
    <input type=submit value="Delete Domain"
     onclick="return confirm('Are you sure you want to delete the selected domain? This action cannot be undone.');"/>
  </form>

  <h1>Domain Groups</h1>

  <h2>Create New Domain Group</h2>

  <form action="/domain_group/create" method=post onsubmit="return validateCreate();">
    <input type=text id="name" name="name" size=50/> <input type=submit value="Create Domain Group"/>
  </form>

  <h2>Delete Domain Group</h2>
  <form method=post action="/domain_group/delete">
    <select name="name">
      <option value=""></option>
        <% for (DomainGroup domainGroup : coord.getDomainGroupsSorted()) { %>
          <option value="<%= domainGroup.getName() %>"><%= domainGroup.getName() %></option>
        <% } %>
    </select>
    <input type=submit value="Delete Domain Group"
      onclick="return confirm('Are you sure you want to delete the selected domain group? This action cannot be undone.');"/>
  </form>


  <h1>Ring Groups</h1>

  <h2>Create New Ring Group</h2>
  <form action="/ring_group/create" method=post onsubmit="return validateCreate();">
    <table>
      <tr>
        <td>Domain group name:</td>
        <td>
          <select name="dgName">
            <option></option>
          <%
            for (DomainGroup dgc : coord.getDomainGroupsSorted()) {
              if (dgc.getVersions().isEmpty()) {continue;}
          %>
          <option><%=dgc.getName()%></option>
          <%
            }
          %>
          </select>
        </td>
      </tr>
      <tr>
        <td>Ring group name:</td>
        <td><input type=text size=30 id="rgName" name="rgName"/></td>
      </tr>
      <tr>
        <td><input type=submit value="Create Ring Group"/></td>
        <td></td>
      </tr>
    </table>
  </form>

  <h2>Delete Ring Group</h2>

  <form action="/ring_group/delete_ring_group" method=post>
  <select name="g">
    <option value=""></option>
      <% for (RingGroup ringGroup : coord.getRingGroupsSorted()) { %>
        <option value="<%= ringGroup.getName() %>"><%= ringGroup.getName() %></option>
      <% } %>
  </select>
  <input type=submit value="Delete Ring Group"
  onclick="return confirm('Are you sure you want to delete the selected ring group? This action cannot be undone.');"/>
  </form>

<jsp:include page="_footer.jsp"/>

</body>
</html>
