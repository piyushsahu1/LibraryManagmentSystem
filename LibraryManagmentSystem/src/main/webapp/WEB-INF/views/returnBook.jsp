<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.app.entitiy.IssueBook" %>
<%
List<IssueBook> issues = (List<IssueBook>) request.getAttribute("issue");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Return Book</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body class="bg-light">
<div id="root"></div>

<script type="text/babel">
const issues = [
<%
if (issues != null) {
    for (int i = 0; i < issues.size(); i++) {
        IssueBook issue = issues.get(i);
%>
  {
    issueid: <%= issue.getIssueid() %>,
    studentName: "<%= issue.getStudentName() != null ? issue.getStudentName().replace("\\", "\\\\").replace("\"", "\\\"") : "" %>",
    bookid: <%= issue.getBookid() %>,
    issuedate: "<%= issue.getIssuedate() != null ? issue.getIssuedate().toString() : "" %>"
  }<%= i < issues.size() - 1 ? "," : "" %>
<%
    }
}
%>
];

function ReturnBookPage() {
  return (
    <div className="container mt-5">
      <div className="card shadow" style={{ maxWidth: '650px' }}>
        <div className="card-header bg-secondary text-white">
          <h2 className="h4 mb-0">Return Book</h2>
        </div>
        <div className="card-body">
          <form action="returnBook" method="post">
            <div className="mb-3">
              <label className="form-label">Issued Book</label>
              <select name="issueid" className="form-select" required>
                <option value="">Select issued book</option>
                {issues.map((issue) => (
                  <option key={issue.issueid} value={issue.issueid}>
                    Issue ID {issue.issueid} - Book ID {issue.bookid} - {issue.studentName} - {issue.issuedate}
                  </option>
                ))}
              </select>
            </div>
            <button type="submit" className="btn btn-secondary m-1" disabled={issues.length === 0}>Return Book</button>
            <a href="viewBook" className="btn btn-primary m-1">View Books</a>
            <a href="./" className="btn btn-outline-secondary m-1">Home</a>
          </form>
          {issues.length === 0 && <p className="text-muted mt-3 mb-0">No issued books available for return.</p>}
        </div>
      </div>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<ReturnBookPage />);
</script>
</body>
</html>
