<%@page import="com.megacabservice.dao.ContactDAO"%>
<%@page import="com.megacabservice.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.megacabservice.db.DBConn"%>

<%
ContactDAO contactDAO = new ContactDAO(DBConn.getConnection());
    List<Contact> messages = contactDAO.getAllMessages();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Messages</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS for Black and Yellow Theme -->
    <style>
        body {
            background-color: #1a1a1a; /* Dark background */
            color: #f1f1f1; /* Light text */
        }
        .table-custom {
            background-color: #f1f1f1; 
            border-radius: 10px;
            overflow: hidden;
        }
        .table-custom thead {
            background-color: #ffc107; /* Yellow header */
            color: #000; /* Black text */
        }
        .table-custom th,
        .table-custom td {
            padding: 12px 15px;
            vertical-align: middle;
        }
        .table-custom tbody tr {
            transition: background-color 0.3s ease;
        }
        .table-custom tbody tr:hover {
            background-color: #FFFFCC; /* Darker hover effect */
        }
        .badge-custom {
            font-size: 0.9rem;
            padding: 6px 10px;
            border-radius: 20px;
        }
        .badge-custom.bg-warning {
            background-color: #ffc107 !important; /* Yellow for PENDING */
            color: #000;
        }
        .badge-custom.bg-success {
            background-color: #28a745 !important; /* Green for RESOLVED */
            color: #fff;
        }
        .btn-custom {
            background-color: #ffc107; /* Yellow button */
            color: #000;
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #e0a800; /* Darker yellow on hover */
        }
        .modal-custom {
            background-color: #262626; /* Dark modal background */
            color: #f1f1f1; /* Light text */
        }
        .modal-custom .modal-header {
            border-bottom: 1px solid #444;
        }
        .modal-custom .modal-footer {
            border-top: 1px solid #444;
        }
        .form-control-custom {
            background-color: #333; /* Dark input background */
            color: #f1f1f1; /* Light text */
            border: 1px solid #444;
        }
        .form-control-custom:focus {
            background-color: #444;
            border-color: #ffc107;
            box-shadow: 0 0 5px rgba(255, 193, 7, 0.5);
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4 text-warning">Customer Messages</h2>
        
        <div class="table-responsive">
            <table class="table table-custom">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Contact msg : messages) { %>
                    <tr>
                        <td><%= msg.getId() %></td>
                        <td><%= msg.getName() %></td>
                        <td><%= msg.getEmail() %></td>
                        <td><%= msg.getMessage() %></td>
                        <td><%= msg.getCreatedAt() %></td>
                        <td>
                            <span class="badge badge-custom <%= msg.getStatus().equals("PENDING") ? "bg-warning" : "bg-success" %>">
                                <%= msg.getStatus() %>
                            </span>
                        </td>
                        <td>
                            <button class="btn btn-custom btn-sm" data-bs-toggle="modal" 
                                    data-bs-target="#replyModal<%= msg.getId() %>">
                                <i class="fas fa-reply"></i> Reply
                            </button>
                        </td>
                    </tr>
                    
                    <!-- Reply Modal -->
                    <div class="modal fade" id="replyModal<%= msg.getId() %>" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content modal-custom">
                                <div class="modal-header">
                                    <h5 class="modal-title">Reply to <%= msg.getName() %></h5>
                                    <button class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                </div>
                                <form action="ReplyMessageServlet" method="POST">
                                    <div class="modal-body">
                                        <input type="hidden" name="messageId" value="<%= msg.getId() %>">
                                        <input type="hidden" name="email" value="<%= msg.getEmail() %>">
                                        
                                        <div class="mb-3">
                                            <label>Original Message</label>
                                            <textarea class="form-control form-control-custom" 
                                                      readonly rows="3"><%= msg.getMessage() %></textarea>
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label>Your Reply</label>
                                            <textarea class="form-control form-control-custom" 
                                                      name="reply" rows="5" required></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-custom">Send Reply</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap 5 JS and Dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>