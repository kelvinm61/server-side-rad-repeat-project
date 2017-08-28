<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add loan</title>
	
	
    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
   
    <!-- Custom CSS -->
    <link href="../../css/simple-sidebar.css" rel="stylesheet">
    <link href="../../css/investment-tables.css" rel="stylesheet">
    
    <!--jQuery -->
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
        

        <!-- Page Content -->
        <nav class="navbar navbar-full">
            <!-- style=" background-color: #58b3f3; -->
            <div class="container-fluid">
                <!-- Menu toggle used to hide and show sidemenu -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#menu-toggle" id="menu-toggle">
                        <span class="glyphicon glyphicon-menu-hamburger"></span> Menu
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse nav-text" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class=" text-secondary"><a href="/" id="demo">Home </a></li>
                    </ul>
                     <ul class="nav navbar-nav navbar-right">
                     	<li class=" text-secondary"><a href="/logout" >Logout </a></li>
                     </ul>
                </div>
                <!--navbar-collapse -->
            </div>
            <!-- container-fluid -->
        </nav>
	  <div id="page-content-wrapper">
            <div class="container-fluid">

		<form:form modelAttribute = "Order">
			<table>
				<tr>
					<th>
						<h3>New Customer</h3>
					</th>
				</tr>
				<tr>
					<td>
						<label> Customer ID: </label> 
						<form:input path="cust.cId"></form:input>
					</td>
					<td><form:errors path = "cust.cId"></form:errors></td>
				</tr>
				<tr>
					<td>
						<label> Book ID: </label> 
						
						<form:input path="book.Bid"></form:input>
					</td>
					<td><form:errors path = "book.Bid"></form:errors></td>
				</tr>
				<tr>
					<td>
						<label> Loan ID: </label> 
							<form:input path="Loan.LId"></form:input>
					</td>
					<td><form:errors path = "Loan.LId"></form:errors></td>
				</tr>
				
				</table>
				</form:form>
				
	  <table>
	  <tr>
	    <td><a href="/">Home</a></td>
	    <td><a href="/secure/customers/showCustomers">List Customers</a></td>
	    <td><a href="/secure/loans/showBooks">List Books</a></td>
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