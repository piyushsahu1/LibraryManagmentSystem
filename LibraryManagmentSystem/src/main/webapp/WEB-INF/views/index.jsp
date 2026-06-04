<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Library Management System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body class="bg-light">
<div id="root"></div>

<script type="text/babel">
function HomePage() {
  return (
    <div className="container mt-5">
      <div className="card shadow">
        <div className="card-header bg-primary text-white text-center">
          <h2>Library Management System</h2>
        </div>
        <div className="card-body text-center">
          <a href="addBook" className="btn btn-success m-2">Add Book</a>
          <a href="viewBook" className="btn btn-primary m-2">View Books</a>
          <a href="searchBook" className="btn btn-warning m-2">Search Book</a>
          <a href="issueBook" className="btn btn-info m-2 text-white">Issue Book</a>
          <a href="returnBook" className="btn btn-secondary m-2">Return Book</a>
        </div>
      </div>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<HomePage />);
</script>
</body>
</html>
