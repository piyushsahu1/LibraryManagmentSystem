<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
Book b = (Book) request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Book</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body class="bg-light">
<div id="root"></div>

<script type="text/babel">
const book = {
  id: <%= b != null ? b.getId() : 0 %>,
  title: "<%= b != null ? esc(b.getTitle()) : "" %>",
  author: "<%= b != null ? esc(b.getAuthor()) : "" %>",
  price: <%= b != null ? b.getPrice() : 0 %>,
  quantity: <%= b != null ? b.getQuantity() : 0 %>
};

function EditBookPage() {
  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-md-6">
          <div className="card shadow">
            <div className="card-header bg-primary text-white text-center">
              <h3>Edit Book</h3>
            </div>
            <div className="card-body">
              <form action="updateBook" method="post">
                <input type="hidden" name="id" value={book.id} />
                <div className="mb-3">
                  <label className="form-label">Title</label>
                  <input type="text" name="title" className="form-control" defaultValue={book.title} required />
                </div>
                <div className="mb-3">
                  <label className="form-label">Author</label>
                  <input type="text" name="author" className="form-control" defaultValue={book.author} required />
                </div>
                <div className="mb-3">
                  <label className="form-label">Price</label>
                  <input type="number" name="price" className="form-control" defaultValue={book.price} required />
                </div>
                <div className="mb-3">
                  <label className="form-label">Quantity</label>
                  <input type="number" name="quantity" className="form-control" defaultValue={book.quantity} required />
                </div>
                <button type="submit" className="btn btn-primary m-1">Update</button>
                <a href="viewBook" className="btn btn-secondary m-1">View Books</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<EditBookPage />);
</script>
</body>
</html>
