<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Issue Book</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body class="bg-light">
<div id="root"></div>

<script type="text/babel">
function IssueBookPage() {
  return (
    <div className="container mt-5">
      <div className="card shadow" style={{ maxWidth: '560px' }}>
        <div className="card-header bg-info text-white">
          <h2 className="h4 mb-0">Issue Book</h2>
        </div>
        <div className="card-body">
          <form action="issueBook" method="post">
            <div className="mb-3">
              <label className="form-label">Student Name</label>
              <input type="text" name="studentName" className="form-control" required />
            </div>
            <div className="mb-3">
              <label className="form-label">Book ID</label>
              <input type="number" name="bookid" className="form-control" required />
            </div>
            <button type="submit" className="btn btn-primary m-1">Issue Book</button>
            <a href="viewBook" className="btn btn-secondary m-1">View Books</a>
            <a href="returnBook" className="btn btn-outline-secondary m-1">Return Book</a>
          </form>
        </div>
      </div>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<IssueBookPage />);
</script>
</body>
</html>
