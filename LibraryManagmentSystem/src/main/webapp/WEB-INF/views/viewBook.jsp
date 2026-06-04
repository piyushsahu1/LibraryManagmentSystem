<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.app.entitiy.Book" %>
<%!
String esc(String value) {
    if (value == null) {
        return "";
    }
    return value.replace("\\", "\\\\").replace("\"", "\\\"").replace("\r", "").replace("\n", "\\n");
}
%>
<%
List<Book> books = (List<Book>) request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Books</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body class="bg-light">
<div id="root"></div>

<script type="text/babel">
const books = [
<%
if (books != null) {
    for (int i = 0; i < books.size(); i++) {
        Book book = books.get(i);
%>
  {
    id: <%= book.getId() %>,
    title: "<%= esc(book.getTitle()) %>",
    author: "<%= esc(book.getAuthor()) %>",
    price: <%= book.getPrice() %>,
    quantity: <%= book.getQuantity() %>
  }<%= i < books.size() - 1 ? "," : "" %>
<%
    }
}
%>
];

function ViewBooksPage() {
  return (
    <div className="container mt-5">
      <div className="card shadow">
        <div className="card-header bg-primary text-white d-flex justify-content-between align-items-center flex-wrap gap-2">
          <h2 className="h4 mb-0">View Books</h2>
          <div>
            <a href="addBook" className="btn btn-success btn-sm m-1">Add Book</a>
            <a href="searchBook" className="btn btn-warning btn-sm m-1">Search</a>
            <a href="issueBook" className="btn btn-info btn-sm text-white m-1">Issue</a>
            <a href="returnBook" className="btn btn-secondary btn-sm m-1">Return</a>
            <a href="./" className="btn btn-light btn-sm m-1">Home</a>
          </div>
        </div>
        <div className="table-responsive">
          <table className="table table-bordered table-striped align-middle mb-0">
            <thead className="table-light">
              <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Quantity</th>
                <th className="text-center">Action</th>
              </tr>
            </thead>
            <tbody>
              {books.length === 0 ? (
                <tr>
                  <td colSpan="6" className="text-center text-muted py-4">No books found.</td>
                </tr>
              ) : (
                books.map((book) => (
                  <tr key={book.id}>
                    <td>{book.id}</td>
                    <td>{book.title}</td>
                    <td>{book.author}</td>
                    <td>Rs. {book.price}</td>
                    <td>{book.quantity}</td>
                    <td className="text-center">
                      <a href={`editBook?id=${book.id}`} className="btn btn-primary btn-sm m-1">Edit</a>
                      <a href={`deleteBook?id=${book.id}`} className="btn btn-danger btn-sm m-1">Delete</a>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<ViewBooksPage />);
</script>
</body>
</html>
