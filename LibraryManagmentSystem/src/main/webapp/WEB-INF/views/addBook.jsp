<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Book</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body class="bg-light">
<div id="root"></div>

<script type="text/babel">
function AddBookPage() {
  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-md-6">
          <div className="card shadow">
            <div className="card-header bg-success text-white text-center">
              <h3>Add Book</h3>
            </div>
            <div className="card-body">
              <form action="saveBook" method="post">
                <div className="mb-3">
                  <label className="form-label">Title</label>
                  <input type="text" name="title" className="form-control" required />
                </div>
                <div className="mb-3">
                  <label className="form-label">Author</label>
                  <input type="text" name="author" className="form-control" required />
                </div>
                <div className="mb-3">
                  <label className="form-label">Price</label>
                  <input type="number" name="price" className="form-control" required />
                </div>
                <div className="mb-3">
                  <label className="form-label">Quantity</label>
                  <input type="number" name="quantity" className="form-control" required />
                </div>
                <div className="text-center">
                  <button type="submit" className="btn btn-success m-1">Add Book</button>
                  <a href="viewBook" className="btn btn-primary m-1">View Books</a>
                  <a href="./" className="btn btn-secondary m-1">Home</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<AddBookPage />);
</script>
</body>
</html>
