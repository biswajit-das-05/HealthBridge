<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Bridge</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        .navbar {
            background-color: #4CAF50;
            border-bottom: 2px solid #388E3C;
        }

        .navbar .navbar-brand {
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
            margin-right: 2rem;
        }

        .navbar-nav .nav-item .nav-link {
            color: white;
            font-size: 1.1rem;
            margin-right: 1.5rem;
            transition: color 0.3s;
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #C8E6C9;
        }

        .navbar-toggler {
            border-color: white;
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%28155, 155, 155, 1%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }


        .dropdown-toggle {
            color: #4CAF50;
            background-color: white;
            border: 1px solid #4CAF50;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        .dropdown-toggle:hover {
            background-color: #388E3C;
            color: white;
        }





        .dropdown-menu .dropdown-item {
            color: #4CAF50;
        }

        .dropdown-menu .dropdown-item:hover {
            background-color: #C8E6C9;
            color: white;
        }

        form.d-flex {
            margin-left: auto;
        }

        @media (min-width: 992px) {
            .navbar-nav .nav-item .nav-link {
                margin-right: 2rem;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fas fa-clinic-medical"></i> Health_Bridge</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">HOME</a></li>
                <li class="nav-item"><a class="nav-link active" href="doctor.jsp">DOCTOR</a></li>
                <li class="nav-item"><a class="nav-link active" href="view_doctor.jsp">VIEW DOCTOR</a></li>
                <li class="nav-item"><a class="nav-link active" href="patient.jsp">PATIENT</a></li>
            </ul>
            <form class="d-flex">
                <div class="dropdown">

                    </ul>
                </div>
            </form>
        </div>
    </div>
</nav>

<!-- dependencies of bootstrap js-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
