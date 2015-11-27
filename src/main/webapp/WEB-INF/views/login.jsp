<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<%@ page import="org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter" %>
<%@ page import="org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter" %>
<%@ page import="org.springframework.security.core.AuthenticationException" %>
 
  
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
<style type="text/css">
    .bs-example{
    	margin: 20px;
    }
	/* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
    .form-horizontal .control-label{
        padding-top: 7px;
    }
</style>

</head>
<body>
<%-- <h1>Login</h1>
 
	<form name="f" action="<c:url value="/loginProcess" />" method="post">
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" 
						 name="username" 
						 id="username" <c:if test="${not empty param.login_error}">value="<%= session.getAttribute(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_USERNAME_KEY) %>"</c:if> /></td>
			</tr>
			
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" id="password" /></td>
			</tr>
			<tr><td colspan="2" align="center"><input name="submit" id="submit" type="submit" value="Login" /></td></tr>
		</table>
		
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form> 
	
	<c:if test="${not empty param.login_error}">
		<font color="red">
			Login failure!<br />
			Reason: <%= ((AuthenticationException) session.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY)).getMessage() %>
		</font>
	</c:if> --%>
	  <div class="bs-example">
	  <h1 align ="center">Sign in</h1><br>
    <form class="form-horizontal" name="f" action="<c:url value="/loginProcess" />" method="post">
    	<div class="form-group">
	    	<div class ="btn pull-right">
	            	<a href="register">Register</a><br>
        	</div>
    	</div>
        <div class="form-group">
            <label for="inputUsername" class="control-label col-xs-2">Username</label>
            <div class="col-xs-10">
                <input type="text" class="form-control" id="username" name="username" placeholder="Username">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="control-label col-xs-2">Password</label>
            <div class="col-xs-10">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <div class="checkbox">
                    <label><input type="checkbox"> Remember me</label>
                    
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <button type="submit" class="btn btn-primary" value="Login" >Login</button>
            </div>
        </div>
        <!-- send csrf -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

  </div>
 
<sec:authorize access="isAuthenticated()">
   You are currently logged in!
</sec:authorize>
 
</body>
</html>