<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<%
	session.setAttribute("form",request.getParameter("pg"));
%>


<head>
<meta charset="utf-8">

<script type="text/javascript">
function replaceUrlParam(url, paramName, paramValue){
    var pattern = new RegExp('(\\?|\\&)('+paramName+'=).*?(&|$)')
    var newUrl=url
    if(url.search(pattern)>=0){
        newUrl = url.replace(pattern,'$1$2' + paramValue + '$3');
    }
    else{
        newUrl = newUrl + (newUrl.indexOf('?')>0 ? '&' : '?') + paramName + '=' + paramValue
    }
    return newUrl
}


function showItems()
{
	//document.getElementById("sec").innerHTML='<jsp:include page="${request.contextPath}/items"></jsp:include>';
	alert("func called");
	//location.href=replaceUrlParam(document.URL,"pg","items");
}
</script>
<title>IT Inventory App</title>
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
}
/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing block. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 15px; /* adding the padding to the sides of the elements within the blocks, instead of the block elements themselves, gets rid of any box model math. A nested block with side padding can also be used as an alternate method. */
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}
/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color: black;
	text-decoration: underline; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: black;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: none;
}
/* ~~ This fixed width container surrounds all other blocks ~~ */
.container {
	width: 100%;
	background-color: white;
	margin: 0 0; /* the auto value on the sides, coupled with the width, centers the layout */
}
/* ~~ The header is not given a width. It will extend the full width of your layout. ~~ */
header {
	background-color: beige;
	border-bottom: 1px solid #666;
}
/* ~~ These are the columns for the layout. ~~ 

1) Padding is only placed on the top and/or bottom of the block elements. The elements within these blocks have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the block itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the block element and place a second block element within it with no width and the padding necessary for your design.

2) No margin has been given to the columns since they are all floated. If you must add margin, avoid placing it on the side you're floating toward (for example: a right margin on a block set to float right). Many times, padding can be used instead. For blocks where this rule must be broken, you should add a "display:inline" declaration to the block element's rule to tame a bug where some versions of Internet Explorer double the margin.

3) Since classes can be used multiple times in a document (and an element can also have multiple classes applied), the columns have been assigned class names instead of IDs. For example, two sidebar blocks could be stacked if necessary. These can very easily be changed to IDs if that's your preference, as long as you'll only be using them once per document.

4) If you prefer your nav on the left instead of the right, simply float these columns the opposite direction (all left instead of all right) and they'll render in reverse order. There's no need to move the blocks around in the HTML source.

*/
.sidebar1 {
	float: right;
	width: 20%;
	background-color: #EADCAE;
	padding-bottom: 10px;
	font-size:16px;
	
}
.content {
	padding: 10px 0;
	width: 80%;
	float: right;
	background-color:white;
	
}

/* ~~ This grouped selector gives the lists in the .content area space ~~ */
.content ul, .content ol {
	padding: 0 15px 15px 40px; /* this padding mirrors the right padding in the headings and paragraph rule above. Padding was placed on the bottom for space between other elements on the lists and on the left to create the indention. These may be adjusted as you wish. */
}

/* ~~ The navigation list styles (can be removed if you choose to use a premade flyout menu like Spry) ~~ */
ul.nav {
	list-style: none; /* this removes the list marker */
	border-top: 1px solid #666; /* this creates the top border for the links - all others are placed using a bottom border on the LI */
	margin-bottom: 15px; /* this creates the space between the navigation on the content below */
	border-left:1px;
}
ul.nav li {
	border-bottom: 1px solid #666; /* this creates the button separation */
	border-top: 1px solid #666; /* this creates the top border for the links - all others are placed using a bottom border on the LI */
	border-left:1px solid #666;
}
ul.nav a, ul.nav a:visited { /* grouping these selectors makes sure that your links retain their button look even after being visited */
	padding: 5px 5px 5px 0px;
	display: block; /* this gives the link block properties causing it to fill the whole LI containing it. This causes the entire area to react to a mouse click. */
	 /*this width makes the entire button clickable for IE6. If you don't need to support IE6, it can be removed. Calculate the proper width by subtracting the padding on this link from the width of your sidebar container. */
	text-decoration: none;
	background-color:beige;
	
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* this changes the background and text color for both mouse and keyboard navigators */
	background-color: #F9E79F;
	color: black;
	font-weight:bold;
}

/* ~~ The footer ~~ */
footer {
	padding: 10px 0;
	background-color: beige;
	position: relative;/* this gives IE6 hasLayout to properly clear */
	clear: both; /* this clear property forces the .container to understand where the columns end and contain them */
	border-top: 1px solid #666;
}

/*HTML 5 support - Sets new HTML 5 tags to display:block so browsers know how to render the tags properly. */
header, section, footer, aside, article, figure {
	display: block;
}
-->
</style><!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--></head>

<body>

<div class="container">
  <header>
    <div>
     
    <a href="#"><img src="<c:url value="/resources/img/logo.jpg" />" alt="Insert Logo Here" width="20%"id="Insert_logo" style="height:100%;background-color: #C6D580; display:inline;" /></a>
    
    <h2 style="float:right; padding-top:4.5%;">IT Inventory Application</h2>
   
    </div>
  </header>
  <div class="sidebar1">
    <ul class="nav">
      <li><a href="?pg=items">Items</a></li>
      <li><a href="?pg=newtrans">New Transaction</a></li>
      <li><a href="showTrans" target="_blank">Transactions</a></li>
      <li><a href='<c:url value="/j_spring_security_logout" />' >Logout</a></li>
    </ul>
    <aside>
      <p id="test">
      <%
      for(int i=1;i<=10;i++)
    	  out.println("<br>");
      %>
      </p>
      <p>
      	<%
      	for(int i=1;i<=15;i++)
    	  out.println("<br>");
      %>
      </p>
    </aside>
  <!-- end .sidebar1 --></div>
  <article class="content">
    
    <section id="sec">
    <jsp:include page="${request.contextPath}/${form}"></jsp:include>

    </section>
    <!-- end .content --></article>
  <footer>
    <p>This Site is Under Development..</p>
    <address>
      <a href="#">Refresh Current Page</a>
    </address>
  </footer>
  <!-- end .container --></div>
</body>
</html>