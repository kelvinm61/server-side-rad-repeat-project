<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add customer</title>
	

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
   
  
    <link href="../../css/simple-sidebar.css" rel="stylesheet">
    <link href="../../css/investment-tables.css" rel="stylesheet">
    

    <script src="../../js/jquery.js"></script>
    
    
   
</head>
<body>
	 <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!-- Sidebar menu items -->
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                       Library
                    </a>
                </li>
                
                <li>
                
                    <a href="#" >Books</a>
                    
                    <ul>
                    <li><a href="/secure/books/showBooks">List Books</a></li>
                    <li><a href="/secure/books/addBook">Add Books</a></li>
                    	
                    	
                    </ul>
                </li>
                <li>
                    <a href="#" >Customers</a>
                    
                    <ul>
                    <li><a href="/secure/customers/showCustomers">List Customers</a></li>
                    <li><a href="/secure/customers/addCustomer">Add Customers</a></li>
                    	
                    	
                    </ul>
                    </li>
               <li>
                    <a href="#" >Loans</a>
                    <ul>
                    <li><a href="/secure/loans/showLoan">List Loan</a></li>
                    <li><a href="/secure/loans/addLoan">Add Loans</a></li>
                    	
                    	
                    </ul>
                    </li>

            </ul>
        

         <nav class="navbar navbar-full">
             <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#menu-toggle" id="menu-toggle">
                        <span class="glyphicon glyphicon-menu-hamburger"></span> Menu
                    </a>
                </div>
                  <div class="collapse navbar-collapse nav-text" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class=" text-secondary"><a href="/" id="demo">Home </a></li>
                    </ul>
                     <ul class="nav navbar-nav navbar-right">
                     	<li class=" text-secondary"><a href="/logout" >Logout </a></li>
                     </ul>
                </div>
        
            </div>
   
        </nav>
	  <div id="page-content-wrapper">
            <div class="container-fluid">
        
	

		<form:form modelAttribute = "Customer">
			<table>
				<tr>
					<th>
						<h3>Add new Customer</h3>
					</th>
				</tr>
				<tr>
					<td>
						<label> Customer Name: </label> 
						<!-- Binds an input value to an attribute of a POJO representing a customer -->
						<form:input path="cName"></form:input>
					</td>
					<td><form:errors path = "cName"></form:errors></td>
				</tr>
				<tr>
				<td>
					<input type="submit" value="Submit" />
				</td>
				</tr>
				
				</table>
				</form:form>
				
				
	  <table>
	  <tr>
	    <td><a href="/">Home</a></td>
	    <td><a href="/secure/customers/showCustomers">List Customers</a></td>
	    <td><a href="/secure/book/showBooks">List Books</a></td>
	  </tr>
	  </table>
	


            </div>
        </div>
   

    </div>
    <script>
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        var cur = document.getElementById("demo");
    </script>
    
</body>
</html>