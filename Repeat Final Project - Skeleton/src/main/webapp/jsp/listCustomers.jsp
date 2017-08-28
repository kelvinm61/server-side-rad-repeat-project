<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>List customers</title>

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
   
      <link href="../../css/simple-sidebar.css" rel="stylesheet">
    <link href="../../css/investment-tables.css" rel="stylesheet">
    
    <script src="../../js/jquery.js"></script>
    
</head>
<body>
	 <div id="wrapper">
       
        <div id="sidebar-wrapper">
           
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
         
        </div>
 
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
	<h1>List all Loans</h1>
		<c:forEach var="customer" items="${AllCustomers}">
		<div class="custDiv">
		<h1>Id:	<c:out value="${customer.cId}"/> Name:	<c:out value="${customer.cName}"/> </h1>
		<h3><c:out value="${customer.cName}"/>'s Loans</h3>
		<table>
		<tr>
			<th> Loan ID </th>
			<th> Due Date </th>
			<th> Book ID </th>
			<th> Desc</th>
		</tr>
		<c:forEach var="loan" items="${customer.loans}">
	
			<tr>
				<td>
					<c:out value="${Loan.LId}"/>
				</td>
				
				<td>
					<c:out value="${loan.cust.cId}"/>
				</td>
				<td>
					<c:out value="${loan.book.Bid}"/>
				</td>
				<td>
					<c:out value="${loan.book.bDesc}"/>
				</td>
			
			</tr>
			
		</c:forEach>
				
		</table>
	
	</div>
		</c:forEach>
		<table>
		  <tr>
		    <td><a href="/">Home</a></td>
		    <td><a href="/secure/customers/addCustomer"> Add a new customer</a></td>
		    <td><a href="/secure/books/showBooks">List Books</a></td>
		    <td><a href="/secure/loans/showLoans">List loans</a></td>
		    <td><a href="/logout">Logout</a></td>
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